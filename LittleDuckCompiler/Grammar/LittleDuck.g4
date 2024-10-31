grammar LittleDuck;

program
    : 'program' ID ';' optionalVariables functions 'begin' body 'end'
    ;

optionalVariables
    : 'vars' variableDeclaration
    | // epsilon (empty rule)
    ;

variableDeclaration
    : idList ':' type ';' variableDeclaration
    | // epsilon (empty rule)
    ;

idList
    : ID moreIds
    ;

moreIds
    : ',' ID moreIds
    | // epsilon (empty rule)
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
    : ('+' | '-') term expressionPrime
    | // epsilon (empty rule)
    ;

comparisonExpression
    : expression
    | expression comparisonOperators expression
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
    : ('*' | '/') factor termPrime
    | // epsilon (empty rule)
    ;

factor
    : parenthesizedExpression
    | optionalSign primitive
    ;

parenthesizedExpression
    : '(' comparisonExpression ')'
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
    ;

conditional
    : ID '(' comparisonExpression ')' body elseBody
    ;

elseBody
    : 'else' body
    | // epsilon (empty rule)
    ;

loop
    : 'while' '(' comparisonExpression ')' 'do' body ';'
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