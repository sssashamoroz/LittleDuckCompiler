// Generated from LittleDuck.g4 by ANTLR 4.13.2
import Antlr4

/**
 * This interface defines a complete listener for a parse tree produced by
 * {@link LittleDuckParser}.
 */
public protocol LittleDuckListener: ParseTreeListener {
	/**
	 * Enter a parse tree produced by {@link LittleDuckParser#program}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterProgram(_ ctx: LittleDuckParser.ProgramContext)
	/**
	 * Exit a parse tree produced by {@link LittleDuckParser#program}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitProgram(_ ctx: LittleDuckParser.ProgramContext)
	/**
	 * Enter a parse tree produced by {@link LittleDuckParser#optionalVariables}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterOptionalVariables(_ ctx: LittleDuckParser.OptionalVariablesContext)
	/**
	 * Exit a parse tree produced by {@link LittleDuckParser#optionalVariables}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitOptionalVariables(_ ctx: LittleDuckParser.OptionalVariablesContext)
	/**
	 * Enter a parse tree produced by {@link LittleDuckParser#variableDeclaration}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterVariableDeclaration(_ ctx: LittleDuckParser.VariableDeclarationContext)
	/**
	 * Exit a parse tree produced by {@link LittleDuckParser#variableDeclaration}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitVariableDeclaration(_ ctx: LittleDuckParser.VariableDeclarationContext)
	/**
	 * Enter a parse tree produced by {@link LittleDuckParser#idList}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterIdList(_ ctx: LittleDuckParser.IdListContext)
	/**
	 * Exit a parse tree produced by {@link LittleDuckParser#idList}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitIdList(_ ctx: LittleDuckParser.IdListContext)
	/**
	 * Enter a parse tree produced by {@link LittleDuckParser#moreIds}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterMoreIds(_ ctx: LittleDuckParser.MoreIdsContext)
	/**
	 * Exit a parse tree produced by {@link LittleDuckParser#moreIds}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitMoreIds(_ ctx: LittleDuckParser.MoreIdsContext)
	/**
	 * Enter a parse tree produced by {@link LittleDuckParser#functions}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterFunctions(_ ctx: LittleDuckParser.FunctionsContext)
	/**
	 * Exit a parse tree produced by {@link LittleDuckParser#functions}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitFunctions(_ ctx: LittleDuckParser.FunctionsContext)
	/**
	 * Enter a parse tree produced by {@link LittleDuckParser#function}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterFunction(_ ctx: LittleDuckParser.FunctionContext)
	/**
	 * Exit a parse tree produced by {@link LittleDuckParser#function}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitFunction(_ ctx: LittleDuckParser.FunctionContext)
	/**
	 * Enter a parse tree produced by {@link LittleDuckParser#parameterList}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterParameterList(_ ctx: LittleDuckParser.ParameterListContext)
	/**
	 * Exit a parse tree produced by {@link LittleDuckParser#parameterList}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitParameterList(_ ctx: LittleDuckParser.ParameterListContext)
	/**
	 * Enter a parse tree produced by {@link LittleDuckParser#parameter}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterParameter(_ ctx: LittleDuckParser.ParameterContext)
	/**
	 * Exit a parse tree produced by {@link LittleDuckParser#parameter}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitParameter(_ ctx: LittleDuckParser.ParameterContext)
	/**
	 * Enter a parse tree produced by {@link LittleDuckParser#moreParameters}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterMoreParameters(_ ctx: LittleDuckParser.MoreParametersContext)
	/**
	 * Exit a parse tree produced by {@link LittleDuckParser#moreParameters}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitMoreParameters(_ ctx: LittleDuckParser.MoreParametersContext)
	/**
	 * Enter a parse tree produced by {@link LittleDuckParser#type}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterType(_ ctx: LittleDuckParser.TypeContext)
	/**
	 * Exit a parse tree produced by {@link LittleDuckParser#type}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitType(_ ctx: LittleDuckParser.TypeContext)
	/**
	 * Enter a parse tree produced by {@link LittleDuckParser#expression}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterExpression(_ ctx: LittleDuckParser.ExpressionContext)
	/**
	 * Exit a parse tree produced by {@link LittleDuckParser#expression}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitExpression(_ ctx: LittleDuckParser.ExpressionContext)
	/**
	 * Enter a parse tree produced by {@link LittleDuckParser#expressionPrime}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterExpressionPrime(_ ctx: LittleDuckParser.ExpressionPrimeContext)
	/**
	 * Exit a parse tree produced by {@link LittleDuckParser#expressionPrime}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitExpressionPrime(_ ctx: LittleDuckParser.ExpressionPrimeContext)
	/**
	 * Enter a parse tree produced by {@link LittleDuckParser#comparisonExpression}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterComparisonExpression(_ ctx: LittleDuckParser.ComparisonExpressionContext)
	/**
	 * Exit a parse tree produced by {@link LittleDuckParser#comparisonExpression}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitComparisonExpression(_ ctx: LittleDuckParser.ComparisonExpressionContext)
	/**
	 * Enter a parse tree produced by {@link LittleDuckParser#comparisonOperators}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterComparisonOperators(_ ctx: LittleDuckParser.ComparisonOperatorsContext)
	/**
	 * Exit a parse tree produced by {@link LittleDuckParser#comparisonOperators}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitComparisonOperators(_ ctx: LittleDuckParser.ComparisonOperatorsContext)
	/**
	 * Enter a parse tree produced by {@link LittleDuckParser#term}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterTerm(_ ctx: LittleDuckParser.TermContext)
	/**
	 * Exit a parse tree produced by {@link LittleDuckParser#term}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitTerm(_ ctx: LittleDuckParser.TermContext)
	/**
	 * Enter a parse tree produced by {@link LittleDuckParser#termPrime}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterTermPrime(_ ctx: LittleDuckParser.TermPrimeContext)
	/**
	 * Exit a parse tree produced by {@link LittleDuckParser#termPrime}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitTermPrime(_ ctx: LittleDuckParser.TermPrimeContext)
	/**
	 * Enter a parse tree produced by {@link LittleDuckParser#factor}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterFactor(_ ctx: LittleDuckParser.FactorContext)
	/**
	 * Exit a parse tree produced by {@link LittleDuckParser#factor}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitFactor(_ ctx: LittleDuckParser.FactorContext)
	/**
	 * Enter a parse tree produced by {@link LittleDuckParser#parenthesizedExpression}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterParenthesizedExpression(_ ctx: LittleDuckParser.ParenthesizedExpressionContext)
	/**
	 * Exit a parse tree produced by {@link LittleDuckParser#parenthesizedExpression}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitParenthesizedExpression(_ ctx: LittleDuckParser.ParenthesizedExpressionContext)
	/**
	 * Enter a parse tree produced by {@link LittleDuckParser#optionalSign}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterOptionalSign(_ ctx: LittleDuckParser.OptionalSignContext)
	/**
	 * Exit a parse tree produced by {@link LittleDuckParser#optionalSign}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitOptionalSign(_ ctx: LittleDuckParser.OptionalSignContext)
	/**
	 * Enter a parse tree produced by {@link LittleDuckParser#primitive}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterPrimitive(_ ctx: LittleDuckParser.PrimitiveContext)
	/**
	 * Exit a parse tree produced by {@link LittleDuckParser#primitive}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitPrimitive(_ ctx: LittleDuckParser.PrimitiveContext)
	/**
	 * Enter a parse tree produced by {@link LittleDuckParser#statement}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterStatement(_ ctx: LittleDuckParser.StatementContext)
	/**
	 * Exit a parse tree produced by {@link LittleDuckParser#statement}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitStatement(_ ctx: LittleDuckParser.StatementContext)
	/**
	 * Enter a parse tree produced by {@link LittleDuckParser#assignment}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterAssignment(_ ctx: LittleDuckParser.AssignmentContext)
	/**
	 * Exit a parse tree produced by {@link LittleDuckParser#assignment}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitAssignment(_ ctx: LittleDuckParser.AssignmentContext)
	/**
	 * Enter a parse tree produced by {@link LittleDuckParser#conditional}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterConditional(_ ctx: LittleDuckParser.ConditionalContext)
	/**
	 * Exit a parse tree produced by {@link LittleDuckParser#conditional}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitConditional(_ ctx: LittleDuckParser.ConditionalContext)
	/**
	 * Enter a parse tree produced by {@link LittleDuckParser#elseBody}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterElseBody(_ ctx: LittleDuckParser.ElseBodyContext)
	/**
	 * Exit a parse tree produced by {@link LittleDuckParser#elseBody}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitElseBody(_ ctx: LittleDuckParser.ElseBodyContext)
	/**
	 * Enter a parse tree produced by {@link LittleDuckParser#loop}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterLoop(_ ctx: LittleDuckParser.LoopContext)
	/**
	 * Exit a parse tree produced by {@link LittleDuckParser#loop}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitLoop(_ ctx: LittleDuckParser.LoopContext)
	/**
	 * Enter a parse tree produced by {@link LittleDuckParser#body}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterBody(_ ctx: LittleDuckParser.BodyContext)
	/**
	 * Exit a parse tree produced by {@link LittleDuckParser#body}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitBody(_ ctx: LittleDuckParser.BodyContext)
	/**
	 * Enter a parse tree produced by {@link LittleDuckParser#statementList}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterStatementList(_ ctx: LittleDuckParser.StatementListContext)
	/**
	 * Exit a parse tree produced by {@link LittleDuckParser#statementList}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitStatementList(_ ctx: LittleDuckParser.StatementListContext)
	/**
	 * Enter a parse tree produced by {@link LittleDuckParser#print}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterPrint(_ ctx: LittleDuckParser.PrintContext)
	/**
	 * Exit a parse tree produced by {@link LittleDuckParser#print}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitPrint(_ ctx: LittleDuckParser.PrintContext)
	/**
	 * Enter a parse tree produced by {@link LittleDuckParser#printContent}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterPrintContent(_ ctx: LittleDuckParser.PrintContentContext)
	/**
	 * Exit a parse tree produced by {@link LittleDuckParser#printContent}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitPrintContent(_ ctx: LittleDuckParser.PrintContentContext)
	/**
	 * Enter a parse tree produced by {@link LittleDuckParser#morePrintContent}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterMorePrintContent(_ ctx: LittleDuckParser.MorePrintContentContext)
	/**
	 * Exit a parse tree produced by {@link LittleDuckParser#morePrintContent}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitMorePrintContent(_ ctx: LittleDuckParser.MorePrintContentContext)
	/**
	 * Enter a parse tree produced by {@link LittleDuckParser#functionCall}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterFunctionCall(_ ctx: LittleDuckParser.FunctionCallContext)
	/**
	 * Exit a parse tree produced by {@link LittleDuckParser#functionCall}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitFunctionCall(_ ctx: LittleDuckParser.FunctionCallContext)
	/**
	 * Enter a parse tree produced by {@link LittleDuckParser#expressionList}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterExpressionList(_ ctx: LittleDuckParser.ExpressionListContext)
	/**
	 * Exit a parse tree produced by {@link LittleDuckParser#expressionList}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitExpressionList(_ ctx: LittleDuckParser.ExpressionListContext)
	/**
	 * Enter a parse tree produced by {@link LittleDuckParser#moreExpressions}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterMoreExpressions(_ ctx: LittleDuckParser.MoreExpressionsContext)
	/**
	 * Exit a parse tree produced by {@link LittleDuckParser#moreExpressions}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitMoreExpressions(_ ctx: LittleDuckParser.MoreExpressionsContext)
}