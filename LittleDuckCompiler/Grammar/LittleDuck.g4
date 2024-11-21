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
      
          // CHeck if there is no Name defined for the Variable
          guard let variableNames = $idList.names else {
              throw CompilerError.undefinedBehavior(message: "Missing variable names.")
          }
          
          // Get Current Scope
          let currentScope = ParserHelper.shared.getCurrentScope()

          // Add each variable in the list to the VariableTable
          for name in variableNames {
              if !VariableTable.shared.addVariable(name: name, type: $type.text, scope: currentScope) {
                  throw CompilerError.undefinedBehavior(message: "Variable \(name) already declared in scope \(currentScope).")
              }
          }
      }
      variableDeclaration
    | // epsilon (empty rule)
    ;

idList returns [Array<String> names]
    : ID
      {
          Swift.print("Debug: Parsing idList, found ID: \($ID.text)")
          $names = [$ID.text]; // Initialize the list with the first ID
      }
      moreIds
      {
          Swift.print("Debug: Parsing moreIds in idList")
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
    : 'void' ID
    {
        
          // Temporarily store the function name and set scope
          var functionName = $ID.text
          ParserHelper.shared.setCurrentScope(functionName)
    
    }
    '(' parameterList ')' '{'
    {
          // After parsing parameters, retrieve them from ParameterTable
          functionName = ParserHelper.shared.getCurrentScope()
          let parameterTypes = ParameterTable.shared.getParametersForFunction(functionName).map { $0.type }

          // Add function to FunctionDirectory with collected parameter types
          if !FunctionDirectory.shared.addFunction(
                name: functionName,
                type: "void",
                startQuadruple: QuadrupleGenerator.shared.currentQuadrupleIndex
          ) {
              throw CompilerError.undefinedBehavior(message: "Function \(functionName) already defined.")
          }

          // Update parameter count and types
          FunctionDirectory.shared.updateParameterCount(name: functionName, count: parameterTypes.count)
          Swift.print("Added function: \(functionName) with parameter types: \(parameterTypes)")
    }
    optionalVariables
    {
          // Update local variable count after parsing local variables
          let localVarCount = VariableTable.shared.getVariablesInScope(functionName).count
          FunctionDirectory.shared.updateLocalVarCount(name: functionName, count: localVarCount)

          // Update starting quadruple
          FunctionDirectory.shared.updateStartQuadruple(name: functionName, startQuadruple: QuadrupleGenerator.shared.currentQuadrupleIndex)

    }
    body
    {
          // Generate the ENDFunc quadruple immediately after the body
          QuadrupleGenerator.shared.addQuadruple(op: "ENDFunc", operand1: "_", operand2: "_", result: "_")
          
          // Reset variable table and scope
          VariableTable.shared.resetScope(scope: ParserHelper.shared.getCurrentScope())
          ParserHelper.shared.resetScope()

          Swift.print("ENDFunc generated for function: \(ParserHelper.shared.getCurrentScope())")
    }
    
    '}' ';'
    ;

parameterList
    : parameter moreParameters
    | // epsilon (empty rule)
    ;

parameter
    : ID ':' type
      {
          let paramName = $ID.text
          let paramType = $type.text

          // Add parameter to the ParameterTable for the function signature
          ParameterTable.shared.addParameter(forFunction: ParserHelper.shared.getCurrentScope(), parameterName: paramName, parameterType: paramType)

          print("Added parameter \(paramName) of type \(paramType) to function \(ParserHelper.shared.getCurrentScope())")
      }
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
              print("Variable \(String(describing: $ID.text)) not found in current or global scope.")
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
        // Generate GotoF for the condition
        guard let conditionOperand = ParserHelper.shared.popOperand() else {
            fatalError("Missing condition operand for IF statement")
        }

        let gotoFalseIndex = QuadrupleGenerator.shared.addQuadruple(op: "GotoF", operand1: conditionOperand, operand2: "_", result: "")
        ParserHelper.shared.pushJump(gotoFalseIndex) // Push GotoF index for backpatching
    }
    body {
        // After parsing the IF block, generate the Goto to skip the ELSE block
        let gotoIndex = QuadrupleGenerator.shared.addQuadruple(op: "Goto", operand1: "_", operand2: "_", result: "")
    }
    'else' {
        // Backpatch the GotoF to jump to the start of the ELSE block
        guard let gotoFalseIndex = ParserHelper.shared.popJump() else {
            fatalError("No GotoF index to backpatch for IF statement")
        }
        Swift.print("HERE STARTS ELSE \(QuadrupleGenerator.shared.currentQuadrupleIndex)")
        QuadrupleGenerator.shared.fillJumpTarget(gotoFalseIndex, with: QuadrupleGenerator.shared.currentQuadrupleIndex)
        ParserHelper.shared.pushJump(gotoIndex) // Push Goto index for backpatching

    }
    body {
        // Backpatch the Goto to skip the ELSE block
        guard let gotoIndex = ParserHelper.shared.popJump() else {
            fatalError("No Goto index to backpatch for ELSE statement")
        }
        QuadrupleGenerator.shared.fillJumpTarget(gotoIndex, with: QuadrupleGenerator.shared.currentQuadrupleIndex)
    }
;

elseBody
    : 'else' body
    | // epsilon
;

loop
    : 'while'
    {
    
          let loopEvaluationindex = QuadrupleGenerator.shared.currentQuadrupleIndex
    }
    
    '(' comparisonExpression ')' 'do' {
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
          QuadrupleGenerator.shared.addQuadruple(op: "Goto", operand1: "_", operand2: "_", result: "\(loopEvaluationindex)")

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
    : ID
      {
          // Verify that the function exists in the FunctionDirectory
          var functionName = $ID.text
          guard let functionInfo = FunctionDirectory.shared.getFunction(name: functionName) else {
              throw CompilerError.undefinedBehavior(message: "Function \(functionName) is not declared.")
          }

          // Generate ERA quadruple for the function's activation record
          QuadrupleGenerator.shared.addQuadruple(op: "ERA", operand1: functionName, operand2: "_", result: "_")

          // Start parameter processing
          ParserHelper.shared.initializeParameterProcessing(forFunction: functionName)
      }
      '(' expressionList ')'
      {
          // Verify the parameter count matches
          guard ParserHelper.shared.verifyParameters(forFunction: $ID.text) else {
              throw CompilerError.typeMismatch(
                  expected: "parameters for \($ID.text)",
                  found: "mismatched number or types of arguments"
              )
          }

          // Generate GOSUB quadruple to jump to the function's starting address
          functionName = $ID.text
          guard let functionStartQuadruple = FunctionDirectory.shared.getFunctionStart(name: functionName) else {
              throw CompilerError.undefinedBehavior(message: "Function \(functionName) is missing a start address.")
          }
          QuadrupleGenerator.shared.addQuadruple(op: "GOSUB", operand1: functionName, operand2: "_", result: "\(functionStartQuadruple)")
      }
      ';'
    ;

expressionList
    : comparisonExpression moreExpressions
      {
          // Pop the argument and its type
          guard let argument = ParserHelper.shared.popOperand(),
                let argumentType = ParserHelper.shared.popType() else {
              throw CompilerError.undefinedBehavior(message: "Missing argument for function call.")
          }

          // Validate against the current parameter
          guard ParserHelper.shared.validateParameter(argument: argument, type: argumentType) else {
              throw CompilerError.typeMismatch(
                  expected: "parameter of type \(ParserHelper.shared.getExpectedParameterType())",
                  found: argumentType
              )
          }

          // Generate PARAM quadruple for the current parameter
          let paramIndex = ParserHelper.shared.getCurrentParameterIndex()
          QuadrupleGenerator.shared.addQuadruple(op: "PARAM", operand1: argument, operand2: "_", result: "param\(paramIndex)")
      }
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
