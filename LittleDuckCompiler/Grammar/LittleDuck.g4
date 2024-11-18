grammar LittleDuck;

program
    : 'program' ID ';' optionalVariables functions 'begin' body 'end'
    ;

optionalVariables
    : 'vars' variableDeclaration
    | // epsilon (empty rule)
    ;

variableDeclaration
    : idList ':' type ';'
      {
          guard let variableNames = $idList.names else {
              throw CompilerError.undefinedBehavior(message: "Missing variable names.")
          }

          // Add each variable in the list to the VariableTable
          for name in variableNames {
              if !VariableTable.shared.addVariable(name: name, type: $type.text) {
                  throw CompilerError.undefinedBehavior(message: "Variable \(name) already declared.")
              }
          }
      }
      variableDeclaration
    | // epsilon (empty rule)
    ;

idList returns [Array<String> names]
    : ID
      {
          $names = [$ID.text]; // Initialize the list with the first ID
      }
      moreIds
      {
          $names.append(contentsOf: $moreIds.names); // Add more IDs if present
      }
    ;

moreIds returns [Array<String> names]
    : ',' ID moreIds
      {
          // Add the current ID and recursively append the next IDs
          $names = [$ID.text];
          $names.append(contentsOf: $moreIds.names);
      }
    | // epsilon (empty rule)
      {
          // Initialize an empty list for the base case
          $names = [];
      }
    ;

functions
    : function functions
    | // epsilon (empty rule)
    ;

function
    : 'void' ID '(' parameterList ')' '{' optionalVariables body '}' ';'
    ;

parameterList
    : parameter moreParameters
    | // epsilon (empty rule)
    ;

parameter
    : ID ':' type
    ;

moreParameters
    : ',' parameter moreParameters
    | // epsilon (empty rule)
    ;

type
    : 'int'
    | 'float'
    ;

expression
    : term expressionPrime
    ;

expressionPrime
    : operator=('+' | '-') term
      {
          ParserHelper.shared.pushOperator($operator.text)
          ParserHelper.shared.popAndGenerateQuadruple()
      }
      expressionPrime
    | // epsilon (empty rule)
    ;

comparisonExpression
    : expression
    | expression comparisonOperators expression
      {

          guard let rightType = ParserHelper.shared.popType(),
                let leftType = ParserHelper.shared.popType() else {
              throw CompilerError.typeMismatch(expected: "boolean", found: "nil")
          }

          guard let resultType = SemanticCube.cube[leftType]?[rightType]?[$comparisonOperators.text],
                resultType == "boolean" else {
              throw CompilerError.typeMismatch(expected: "boolean", found: "\(leftType), \(rightType)")
          }

          ParserHelper.shared.pushType(resultType)

          guard let operand2 = ParserHelper.shared.popOperand(),
                let operand1 = ParserHelper.shared.popOperand() else {
              throw CompilerError.undefinedBehavior(message: "Missing operands for comparison")
          }

          let temp = ParserHelper.shared.generateTemp()
          QuadrupleGenerator.shared.addQuadruple(op: $comparisonOperators.text, operand1: operand1, operand2: operand2, result: temp)
          ParserHelper.shared.pushOperand(temp) // Push the result of comparison
      }
    ;

comparisonOperators
    : '<'
    | '>'
    | '!='
    | '=='
    ;

term
    : factor termPrime
    ;

termPrime
    : operator=('*' | '/') factor
      {
          // Access the text of the matched operator
          ParserHelper.shared.pushOperator($operator.text)
          ParserHelper.shared.popAndGenerateQuadruple()
      }
      termPrime
    | // epsilon (empty rule)
    ;

factor
    : parenthesizedExpression
    | CONST
      {
          ParserHelper.shared.pushOperand($CONST.text)
          ParserHelper.shared.pushType("int") // Example for INT
      }
    | ID
      {
          guard let type = VariableTable.shared.getVariableType(name: $ID.text) else {
              throw CompilerError.undefinedBehavior(message: "Variable \($ID.text) not defined")
          }
          ParserHelper.shared.pushOperand($ID.text)
          ParserHelper.shared.pushType(type)
      }
    ;

parenthesizedExpression
    : '(' comparisonExpression ')'
      {
          // Parenthesis just evaluates and pushes result from comparisonExpression
      }
    ;

optionalSign
    : '+'
    | '-'
    | // epsilon (empty rule)
    ;

primitive
    : ID
    | CONST
    ;

statement
    : assignment
    | conditional
    | loop
    | functionCall
    | print
    ;

assignment
    : ID '=' comparisonExpression ';'
      {
          guard let variableType = VariableTable.shared.getVariableType(name: $ID.text) else {
              throw CompilerError.undefinedBehavior(message: "Variable \($ID.text) not declared.")
          }

          guard let assignedType = ParserHelper.shared.popType() else {
              throw CompilerError.undefinedBehavior(message: "Missing type for value assigned to \($ID.text).")
          }

          // Handle type promotion
          if assignedType != variableType {
                if assignedType == "int" && variableType == "float" {
                    // Allow implicit promotion without generating a cast quadruple
                    ParserHelper.shared.pushType("float")
                } else if assignedType != variableType {
                    throw CompilerError.typeMismatch(expected: variableType, found: assignedType)
                }
          }

          // Pop the final operand and generate assignment quadruple
          guard let value = ParserHelper.shared.popOperand() else {
              throw CompilerError.missingValueForAssignment(variable: $ID.text)
          }

          QuadrupleGenerator.shared.addQuadruple(op: "=", operand1: value, operand2: "_", result: $ID.text)
      }
    ;

conditional
    : 'if' '(' comparisonExpression ')' {

        guard let conditionOperand = ParserHelper.shared.popOperand() else {
            fatalError("Missing condition operand for IF statement")
        }

        // Generate GotoF immediately
        let jumpQuadIndex = QuadrupleGenerator.shared.addQuadruple(op: "GotoF", operand1: conditionOperand, operand2: "", result: "")
        ParserHelper.shared.pushJump(jumpQuadIndex) // Push index for backpatching
    }
    body {
        // Backpatch GotoF to jump to the end of the body
        guard let jumpIndex = ParserHelper.shared.popJump() else {
            fatalError("No jump to backpatch for IF statement")
        }
        QuadrupleGenerator.shared.fillJumpTarget(jumpIndex, with: QuadrupleGenerator.shared.currentQuadrupleIndex)
    }
    elseBody
;

elseBody
    : 'else' body {
        // Generate an unconditional Goto to skip the `else` body
        let elseJump = QuadrupleGenerator.shared.addUnconditionalJump()
        ParserHelper.shared.pushJump(elseJump)

        // Backpatch the previous GotoF to skip to this part
        guard let ifFalseJump = ParserHelper.shared.popJump() else {
            fatalError("No jump to backpatch for IF statement")
        }
        QuadrupleGenerator.shared.fillJumpTarget(ifFalseJump, with: QuadrupleGenerator.shared.currentQuadrupleIndex)
    }
    | // epsilon
;

loop
    : 'while' '(' comparisonExpression ')' 'do' {
          // Save the current quadruple index as the loop's start point
          let loopStartIndex = QuadrupleGenerator.shared.currentQuadrupleIndex
          ParserHelper.shared.pushJump(loopStartIndex) // Push start index to jump stack

          // Evaluate the condition
          guard let conditionOperand = ParserHelper.shared.popOperand() else {
              fatalError("Missing condition operand for WHILE loop")
          }

          // Generate GotoF quadruple for the condition
          let gotoFalseIndex = QuadrupleGenerator.shared.addQuadruple(op: "GotoF", operand1: conditionOperand, operand2: "_", result: "_")
          ParserHelper.shared.pushJump(gotoFalseIndex) // Push GotoF index to jump stack
      }
      body ';' {
          // Generate Goto to jump back to the start of the loop
          guard let loopStartIndex = ParserHelper.shared.popJump() else {
              fatalError("Missing loop start index for WHILE loop")
          }
          QuadrupleGenerator.shared.addQuadruple(op: "Goto", operand1: "_", operand2: "_", result: "\(loopStartIndex)")

          // Backpatch the GotoF to jump to the end of the loop body
          guard let gotoFalseIndex = ParserHelper.shared.popJump() else {
              fatalError("Missing GotoF index for backpatching in WHILE loop")
          }
          QuadrupleGenerator.shared.fillJumpTarget(gotoFalseIndex, with: QuadrupleGenerator.shared.currentQuadrupleIndex)
      }
    ;

body
    : '{' statementList '}'
    ;

statementList
    : statement statementList
    | // epsilon (empty rule)
    ;

print
    : 'print' '(' printContent ')' ';'
    ;

printContent
    : comparisonExpression morePrintContent
    | STRING_LITERAL morePrintContent
    ;

morePrintContent
    : ',' printContent
    | // epsilon (empty rule)
    ;

functionCall
    : ID '(' expressionList ')' ';'
    ;

expressionList
    : comparisonExpression moreExpressions
    | // epsilon (empty rule)
    ;

moreExpressions
    : ',' comparisonExpression moreExpressions
    | // epsilon (empty rule)
    ;

CONST
    : CONST_INT
    | CONST_FLOAT
    ;

// String literals (keywords and symbols)
PROGRAM    : 'program' ;
BEGIN      : 'begin' ;
END        : 'end' ;
VARS       : 'vars' ;
VOID       : 'void' ;
WHILE      : 'while' ;
DO         : 'do' ;
PRINT      : 'print' ;
ELSE       : 'else' ;
INT_TYPE   : 'int' ;
FLOAT_TYPE : 'float' ;

LPAREN     : '(' ;
RPAREN     : ')' ;
LBRACE     : '{' ;
RBRACE     : '}' ;
SEMICOLON  : ';' ;
COLON      : ':' ;
COMMA      : ',' ;
EQ         : '=' ;
PLUS       : '+' ;
MINUS      : '-' ;
MUL        : '*' ;
DIV        : '/' ;
LT         : '<' ;
GT         : '>' ;
NEQ        : '!=' ;
EQEQ       : '==' ;

// Identifiers and constants
ID         : [a-zA-Z_][a-zA-Z0-9_]* ;
CONST_INT  : [0-9]+ ;
CONST_FLOAT: [0-9]+ '.' [0-9]+ ;
STRING_LITERAL : '"' (~["])* '"' ;

// Whitespace (to be ignored)
WS         : [ \t\r\n]+ -> skip ;
