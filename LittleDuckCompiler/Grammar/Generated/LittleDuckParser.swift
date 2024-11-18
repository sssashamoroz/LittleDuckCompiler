// Generated from LittleDuck.g4 by ANTLR 4.13.2
import Antlr4

open class LittleDuckParser: Parser {

	internal static var _decisionToDFA: [DFA] = {
          var decisionToDFA = [DFA]()
          let length = LittleDuckParser._ATN.getNumberOfDecisions()
          for i in 0..<length {
            decisionToDFA.append(DFA(LittleDuckParser._ATN.getDecisionState(i)!, i))
           }
           return decisionToDFA
     }()

	internal static let _sharedContextCache = PredictionContextCache()

	public
	enum Tokens: Int {
		case EOF = -1, T__0 = 1, CONST = 2, PROGRAM = 3, BEGIN = 4, END = 5, VARS = 6, 
                 VOID = 7, WHILE = 8, DO = 9, PRINT = 10, ELSE = 11, INT_TYPE = 12, 
                 FLOAT_TYPE = 13, LPAREN = 14, RPAREN = 15, LBRACE = 16, 
                 RBRACE = 17, SEMICOLON = 18, COLON = 19, COMMA = 20, EQ = 21, 
                 PLUS = 22, MINUS = 23, MUL = 24, DIV = 25, LT = 26, GT = 27, 
                 NEQ = 28, EQEQ = 29, ID = 30, CONST_INT = 31, CONST_FLOAT = 32, 
                 STRING_LITERAL = 33, WS = 34
	}

	public
	static let RULE_program = 0, RULE_optionalVariables = 1, RULE_variableDeclaration = 2, 
            RULE_idList = 3, RULE_moreIds = 4, RULE_functions = 5, RULE_function = 6, 
            RULE_parameterList = 7, RULE_parameter = 8, RULE_moreParameters = 9, 
            RULE_type = 10, RULE_expression = 11, RULE_expressionPrime = 12, 
            RULE_comparisonExpression = 13, RULE_comparisonOperators = 14, 
            RULE_term = 15, RULE_termPrime = 16, RULE_factor = 17, RULE_parenthesizedExpression = 18, 
            RULE_optionalSign = 19, RULE_primitive = 20, RULE_statement = 21, 
            RULE_assignment = 22, RULE_conditional = 23, RULE_elseBody = 24, 
            RULE_loop = 25, RULE_body = 26, RULE_statementList = 27, RULE_print = 28, 
            RULE_printContent = 29, RULE_morePrintContent = 30, RULE_functionCall = 31, 
            RULE_expressionList = 32, RULE_moreExpressions = 33

	public
	static let ruleNames: [String] = [
		"program", "optionalVariables", "variableDeclaration", "idList", "moreIds", 
		"functions", "function", "parameterList", "parameter", "moreParameters", 
		"type", "expression", "expressionPrime", "comparisonExpression", "comparisonOperators", 
		"term", "termPrime", "factor", "parenthesizedExpression", "optionalSign", 
		"primitive", "statement", "assignment", "conditional", "elseBody", "loop", 
		"body", "statementList", "print", "printContent", "morePrintContent", 
		"functionCall", "expressionList", "moreExpressions"
	]

	private static let _LITERAL_NAMES: [String?] = [
		nil, "'if'", nil, "'program'", "'begin'", "'end'", "'vars'", "'void'", 
		"'while'", "'do'", "'print'", "'else'", "'int'", "'float'", "'('", "')'", 
		"'{'", "'}'", "';'", "':'", "','", "'='", "'+'", "'-'", "'*'", "'/'", 
		"'<'", "'>'", "'!='", "'=='"
	]
	private static let _SYMBOLIC_NAMES: [String?] = [
		nil, nil, "CONST", "PROGRAM", "BEGIN", "END", "VARS", "VOID", "WHILE", 
		"DO", "PRINT", "ELSE", "INT_TYPE", "FLOAT_TYPE", "LPAREN", "RPAREN", "LBRACE", 
		"RBRACE", "SEMICOLON", "COLON", "COMMA", "EQ", "PLUS", "MINUS", "MUL", 
		"DIV", "LT", "GT", "NEQ", "EQEQ", "ID", "CONST_INT", "CONST_FLOAT", "STRING_LITERAL", 
		"WS"
	]
	public
	static let VOCABULARY = Vocabulary(_LITERAL_NAMES, _SYMBOLIC_NAMES)

	override open
	func getGrammarFileName() -> String { return "LittleDuck.g4" }

	override open
	func getRuleNames() -> [String] { return LittleDuckParser.ruleNames }

	override open
	func getSerializedATN() -> [Int] { return LittleDuckParser._serializedATN }

	override open
	func getATN() -> ATN { return LittleDuckParser._ATN }


	override open
	func getVocabulary() -> Vocabulary {
	    return LittleDuckParser.VOCABULARY
	}

	override public
	init(_ input:TokenStream) throws {
	    RuntimeMetaData.checkVersion("4.13.2", RuntimeMetaData.VERSION)
		try super.init(input)
		_interp = ParserATNSimulator(self,LittleDuckParser._ATN,LittleDuckParser._decisionToDFA, LittleDuckParser._sharedContextCache)
	}


	public class ProgramContext: ParserRuleContext {
			open
			func PROGRAM() -> TerminalNode? {
				return getToken(LittleDuckParser.Tokens.PROGRAM.rawValue, 0)
			}
			open
			func ID() -> TerminalNode? {
				return getToken(LittleDuckParser.Tokens.ID.rawValue, 0)
			}
			open
			func SEMICOLON() -> TerminalNode? {
				return getToken(LittleDuckParser.Tokens.SEMICOLON.rawValue, 0)
			}
			open
			func optionalVariables() -> OptionalVariablesContext? {
				return getRuleContext(OptionalVariablesContext.self, 0)
			}
			open
			func functions() -> FunctionsContext? {
				return getRuleContext(FunctionsContext.self, 0)
			}
			open
			func BEGIN() -> TerminalNode? {
				return getToken(LittleDuckParser.Tokens.BEGIN.rawValue, 0)
			}
			open
			func body() -> BodyContext? {
				return getRuleContext(BodyContext.self, 0)
			}
			open
			func END() -> TerminalNode? {
				return getToken(LittleDuckParser.Tokens.END.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return LittleDuckParser.RULE_program
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? LittleDuckListener {
				listener.enterProgram(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? LittleDuckListener {
				listener.exitProgram(self)
			}
		}
	}
	@discardableResult
	 open func program() throws -> ProgramContext {
		var _localctx: ProgramContext
		_localctx = ProgramContext(_ctx, getState())
		try enterRule(_localctx, 0, LittleDuckParser.RULE_program)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(68)
		 	try match(LittleDuckParser.Tokens.PROGRAM.rawValue)
		 	setState(69)
		 	try match(LittleDuckParser.Tokens.ID.rawValue)
		 	setState(70)
		 	try match(LittleDuckParser.Tokens.SEMICOLON.rawValue)
		 	setState(71)
		 	try optionalVariables()
		 	setState(72)
		 	try functions()
		 	setState(73)
		 	try match(LittleDuckParser.Tokens.BEGIN.rawValue)
		 	setState(74)
		 	try body()
		 	setState(75)
		 	try match(LittleDuckParser.Tokens.END.rawValue)

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class OptionalVariablesContext: ParserRuleContext {
			open
			func VARS() -> TerminalNode? {
				return getToken(LittleDuckParser.Tokens.VARS.rawValue, 0)
			}
			open
			func variableDeclaration() -> VariableDeclarationContext? {
				return getRuleContext(VariableDeclarationContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return LittleDuckParser.RULE_optionalVariables
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? LittleDuckListener {
				listener.enterOptionalVariables(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? LittleDuckListener {
				listener.exitOptionalVariables(self)
			}
		}
	}
	@discardableResult
	 open func optionalVariables() throws -> OptionalVariablesContext {
		var _localctx: OptionalVariablesContext
		_localctx = OptionalVariablesContext(_ctx, getState())
		try enterRule(_localctx, 2, LittleDuckParser.RULE_optionalVariables)
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(80)
		 	try _errHandler.sync(self)
		 	switch (LittleDuckParser.Tokens(rawValue: try _input.LA(1))!) {
		 	case .VARS:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(77)
		 		try match(LittleDuckParser.Tokens.VARS.rawValue)
		 		setState(78)
		 		try variableDeclaration()

		 		break
		 	case .BEGIN:fallthrough
		 	case .VOID:fallthrough
		 	case .LBRACE:
		 		try enterOuterAlt(_localctx, 2)

		 		break
		 	default:
		 		throw ANTLRException.recognition(e: NoViableAltException(self))
		 	}
		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class VariableDeclarationContext: ParserRuleContext {
		open var _idList: IdListContext!
		open var _type: TypeContext!
			open
			func idList() -> IdListContext? {
				return getRuleContext(IdListContext.self, 0)
			}
			open
			func COLON() -> TerminalNode? {
				return getToken(LittleDuckParser.Tokens.COLON.rawValue, 0)
			}
			open
			func type() -> TypeContext? {
				return getRuleContext(TypeContext.self, 0)
			}
			open
			func SEMICOLON() -> TerminalNode? {
				return getToken(LittleDuckParser.Tokens.SEMICOLON.rawValue, 0)
			}
			open
			func variableDeclaration() -> VariableDeclarationContext? {
				return getRuleContext(VariableDeclarationContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return LittleDuckParser.RULE_variableDeclaration
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? LittleDuckListener {
				listener.enterVariableDeclaration(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? LittleDuckListener {
				listener.exitVariableDeclaration(self)
			}
		}
	}
	@discardableResult
	 open func variableDeclaration() throws -> VariableDeclarationContext {
		var _localctx: VariableDeclarationContext
		_localctx = VariableDeclarationContext(_ctx, getState())
		try enterRule(_localctx, 4, LittleDuckParser.RULE_variableDeclaration)
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(90)
		 	try _errHandler.sync(self)
		 	switch (LittleDuckParser.Tokens(rawValue: try _input.LA(1))!) {
		 	case .ID:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(82)
		 		try {
		 				let assignmentValue = try idList()
		 				_localctx.castdown(VariableDeclarationContext.self)._idList = assignmentValue
		 		     }()

		 		setState(83)
		 		try match(LittleDuckParser.Tokens.COLON.rawValue)
		 		setState(84)
		 		try {
		 				let assignmentValue = try type()
		 				_localctx.castdown(VariableDeclarationContext.self)._type = assignmentValue
		 		     }()

		 		setState(85)
		 		try match(LittleDuckParser.Tokens.SEMICOLON.rawValue)

		 		          guard let variableNames = _localctx.castdown(VariableDeclarationContext.self)._idList.names else {
		 		              throw CompilerError.undefinedBehavior(message: "Missing variable names.")
		 		          }

		 		          // Add each variable in the list to the VariableTable
		 		          for name in variableNames {
		 		              if !VariableTable.shared.addVariable(name: name, type: (_localctx.castdown(VariableDeclarationContext.self)._type != nil ? try _input.getText(_localctx.castdown(VariableDeclarationContext.self)._type!.start,_localctx.castdown(VariableDeclarationContext.self)._type!.stop) : "")) {
		 		                  throw CompilerError.undefinedBehavior(message: "Variable \(name) already declared.")
		 		              }
		 		          }
		 		      
		 		setState(87)
		 		try variableDeclaration()

		 		break
		 	case .BEGIN:fallthrough
		 	case .VOID:fallthrough
		 	case .LBRACE:
		 		try enterOuterAlt(_localctx, 2)

		 		break
		 	default:
		 		throw ANTLRException.recognition(e: NoViableAltException(self))
		 	}
		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class IdListContext: ParserRuleContext {
		open var names: Array<String>!
		open var _ID: Token!
		open var _moreIds: MoreIdsContext!
			open
			func ID() -> TerminalNode? {
				return getToken(LittleDuckParser.Tokens.ID.rawValue, 0)
			}
			open
			func moreIds() -> MoreIdsContext? {
				return getRuleContext(MoreIdsContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return LittleDuckParser.RULE_idList
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? LittleDuckListener {
				listener.enterIdList(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? LittleDuckListener {
				listener.exitIdList(self)
			}
		}
	}
	@discardableResult
	 open func idList() throws -> IdListContext {
		var _localctx: IdListContext
		_localctx = IdListContext(_ctx, getState())
		try enterRule(_localctx, 6, LittleDuckParser.RULE_idList)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(92)
		 	try {
		 			let assignmentValue = try match(LittleDuckParser.Tokens.ID.rawValue)
		 			_localctx.castdown(IdListContext.self)._ID = assignmentValue
		 	     }()


		 	          _localctx.castdown(IdListContext.self).names =  [(_localctx.castdown(IdListContext.self)._ID != nil ? _localctx.castdown(IdListContext.self)._ID!.getText()! : "")] // Initialize the list with the first ID
		 	      
		 	setState(94)
		 	try {
		 			let assignmentValue = try moreIds()
		 			_localctx.castdown(IdListContext.self)._moreIds = assignmentValue
		 	     }()


		 	          _localctx.names.append(contentsOf: _localctx.castdown(IdListContext.self)._moreIds.names); // Add more IDs if present
		 	      

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class MoreIdsContext: ParserRuleContext {
		open var names: Array<String>!
		open var _ID: Token!
		open var _moreIds: MoreIdsContext!
			open
			func COMMA() -> TerminalNode? {
				return getToken(LittleDuckParser.Tokens.COMMA.rawValue, 0)
			}
			open
			func ID() -> TerminalNode? {
				return getToken(LittleDuckParser.Tokens.ID.rawValue, 0)
			}
			open
			func moreIds() -> MoreIdsContext? {
				return getRuleContext(MoreIdsContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return LittleDuckParser.RULE_moreIds
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? LittleDuckListener {
				listener.enterMoreIds(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? LittleDuckListener {
				listener.exitMoreIds(self)
			}
		}
	}
	@discardableResult
	 open func moreIds() throws -> MoreIdsContext {
		var _localctx: MoreIdsContext
		_localctx = MoreIdsContext(_ctx, getState())
		try enterRule(_localctx, 8, LittleDuckParser.RULE_moreIds)
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(103)
		 	try _errHandler.sync(self)
		 	switch (LittleDuckParser.Tokens(rawValue: try _input.LA(1))!) {
		 	case .COMMA:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(97)
		 		try match(LittleDuckParser.Tokens.COMMA.rawValue)
		 		setState(98)
		 		try {
		 				let assignmentValue = try match(LittleDuckParser.Tokens.ID.rawValue)
		 				_localctx.castdown(MoreIdsContext.self)._ID = assignmentValue
		 		     }()

		 		setState(99)
		 		try {
		 				let assignmentValue = try moreIds()
		 				_localctx.castdown(MoreIdsContext.self)._moreIds = assignmentValue
		 		     }()


		 		          // Add the current ID and recursively append the next IDs
		 		          _localctx.castdown(MoreIdsContext.self).names =  [(_localctx.castdown(MoreIdsContext.self)._ID != nil ? _localctx.castdown(MoreIdsContext.self)._ID!.getText()! : "")]
		 		          _localctx.names.append(contentsOf: _localctx.castdown(MoreIdsContext.self)._moreIds.names);
		 		      

		 		break

		 	case .COLON:
		 		try enterOuterAlt(_localctx, 2)

		 		          // Initialize an empty list for the base case
		 		          _localctx.castdown(MoreIdsContext.self).names =  []
		 		      

		 		break
		 	default:
		 		throw ANTLRException.recognition(e: NoViableAltException(self))
		 	}
		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class FunctionsContext: ParserRuleContext {
			open
			func function() -> FunctionContext? {
				return getRuleContext(FunctionContext.self, 0)
			}
			open
			func functions() -> FunctionsContext? {
				return getRuleContext(FunctionsContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return LittleDuckParser.RULE_functions
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? LittleDuckListener {
				listener.enterFunctions(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? LittleDuckListener {
				listener.exitFunctions(self)
			}
		}
	}
	@discardableResult
	 open func functions() throws -> FunctionsContext {
		var _localctx: FunctionsContext
		_localctx = FunctionsContext(_ctx, getState())
		try enterRule(_localctx, 10, LittleDuckParser.RULE_functions)
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(109)
		 	try _errHandler.sync(self)
		 	switch (LittleDuckParser.Tokens(rawValue: try _input.LA(1))!) {
		 	case .VOID:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(105)
		 		try function()
		 		setState(106)
		 		try functions()

		 		break

		 	case .BEGIN:
		 		try enterOuterAlt(_localctx, 2)

		 		break
		 	default:
		 		throw ANTLRException.recognition(e: NoViableAltException(self))
		 	}
		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class FunctionContext: ParserRuleContext {
			open
			func VOID() -> TerminalNode? {
				return getToken(LittleDuckParser.Tokens.VOID.rawValue, 0)
			}
			open
			func ID() -> TerminalNode? {
				return getToken(LittleDuckParser.Tokens.ID.rawValue, 0)
			}
			open
			func LPAREN() -> TerminalNode? {
				return getToken(LittleDuckParser.Tokens.LPAREN.rawValue, 0)
			}
			open
			func parameterList() -> ParameterListContext? {
				return getRuleContext(ParameterListContext.self, 0)
			}
			open
			func RPAREN() -> TerminalNode? {
				return getToken(LittleDuckParser.Tokens.RPAREN.rawValue, 0)
			}
			open
			func LBRACE() -> TerminalNode? {
				return getToken(LittleDuckParser.Tokens.LBRACE.rawValue, 0)
			}
			open
			func optionalVariables() -> OptionalVariablesContext? {
				return getRuleContext(OptionalVariablesContext.self, 0)
			}
			open
			func body() -> BodyContext? {
				return getRuleContext(BodyContext.self, 0)
			}
			open
			func RBRACE() -> TerminalNode? {
				return getToken(LittleDuckParser.Tokens.RBRACE.rawValue, 0)
			}
			open
			func SEMICOLON() -> TerminalNode? {
				return getToken(LittleDuckParser.Tokens.SEMICOLON.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return LittleDuckParser.RULE_function
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? LittleDuckListener {
				listener.enterFunction(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? LittleDuckListener {
				listener.exitFunction(self)
			}
		}
	}
	@discardableResult
	 open func function() throws -> FunctionContext {
		var _localctx: FunctionContext
		_localctx = FunctionContext(_ctx, getState())
		try enterRule(_localctx, 12, LittleDuckParser.RULE_function)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(111)
		 	try match(LittleDuckParser.Tokens.VOID.rawValue)
		 	setState(112)
		 	try match(LittleDuckParser.Tokens.ID.rawValue)
		 	setState(113)
		 	try match(LittleDuckParser.Tokens.LPAREN.rawValue)
		 	setState(114)
		 	try parameterList()
		 	setState(115)
		 	try match(LittleDuckParser.Tokens.RPAREN.rawValue)
		 	setState(116)
		 	try match(LittleDuckParser.Tokens.LBRACE.rawValue)
		 	setState(117)
		 	try optionalVariables()
		 	setState(118)
		 	try body()
		 	setState(119)
		 	try match(LittleDuckParser.Tokens.RBRACE.rawValue)
		 	setState(120)
		 	try match(LittleDuckParser.Tokens.SEMICOLON.rawValue)

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class ParameterListContext: ParserRuleContext {
			open
			func parameter() -> ParameterContext? {
				return getRuleContext(ParameterContext.self, 0)
			}
			open
			func moreParameters() -> MoreParametersContext? {
				return getRuleContext(MoreParametersContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return LittleDuckParser.RULE_parameterList
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? LittleDuckListener {
				listener.enterParameterList(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? LittleDuckListener {
				listener.exitParameterList(self)
			}
		}
	}
	@discardableResult
	 open func parameterList() throws -> ParameterListContext {
		var _localctx: ParameterListContext
		_localctx = ParameterListContext(_ctx, getState())
		try enterRule(_localctx, 14, LittleDuckParser.RULE_parameterList)
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(126)
		 	try _errHandler.sync(self)
		 	switch (LittleDuckParser.Tokens(rawValue: try _input.LA(1))!) {
		 	case .ID:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(122)
		 		try parameter()
		 		setState(123)
		 		try moreParameters()

		 		break

		 	case .RPAREN:
		 		try enterOuterAlt(_localctx, 2)

		 		break
		 	default:
		 		throw ANTLRException.recognition(e: NoViableAltException(self))
		 	}
		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class ParameterContext: ParserRuleContext {
			open
			func ID() -> TerminalNode? {
				return getToken(LittleDuckParser.Tokens.ID.rawValue, 0)
			}
			open
			func COLON() -> TerminalNode? {
				return getToken(LittleDuckParser.Tokens.COLON.rawValue, 0)
			}
			open
			func type() -> TypeContext? {
				return getRuleContext(TypeContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return LittleDuckParser.RULE_parameter
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? LittleDuckListener {
				listener.enterParameter(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? LittleDuckListener {
				listener.exitParameter(self)
			}
		}
	}
	@discardableResult
	 open func parameter() throws -> ParameterContext {
		var _localctx: ParameterContext
		_localctx = ParameterContext(_ctx, getState())
		try enterRule(_localctx, 16, LittleDuckParser.RULE_parameter)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(128)
		 	try match(LittleDuckParser.Tokens.ID.rawValue)
		 	setState(129)
		 	try match(LittleDuckParser.Tokens.COLON.rawValue)
		 	setState(130)
		 	try type()

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class MoreParametersContext: ParserRuleContext {
			open
			func COMMA() -> TerminalNode? {
				return getToken(LittleDuckParser.Tokens.COMMA.rawValue, 0)
			}
			open
			func parameter() -> ParameterContext? {
				return getRuleContext(ParameterContext.self, 0)
			}
			open
			func moreParameters() -> MoreParametersContext? {
				return getRuleContext(MoreParametersContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return LittleDuckParser.RULE_moreParameters
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? LittleDuckListener {
				listener.enterMoreParameters(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? LittleDuckListener {
				listener.exitMoreParameters(self)
			}
		}
	}
	@discardableResult
	 open func moreParameters() throws -> MoreParametersContext {
		var _localctx: MoreParametersContext
		_localctx = MoreParametersContext(_ctx, getState())
		try enterRule(_localctx, 18, LittleDuckParser.RULE_moreParameters)
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(137)
		 	try _errHandler.sync(self)
		 	switch (LittleDuckParser.Tokens(rawValue: try _input.LA(1))!) {
		 	case .COMMA:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(132)
		 		try match(LittleDuckParser.Tokens.COMMA.rawValue)
		 		setState(133)
		 		try parameter()
		 		setState(134)
		 		try moreParameters()

		 		break

		 	case .RPAREN:
		 		try enterOuterAlt(_localctx, 2)

		 		break
		 	default:
		 		throw ANTLRException.recognition(e: NoViableAltException(self))
		 	}
		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class TypeContext: ParserRuleContext {
			open
			func INT_TYPE() -> TerminalNode? {
				return getToken(LittleDuckParser.Tokens.INT_TYPE.rawValue, 0)
			}
			open
			func FLOAT_TYPE() -> TerminalNode? {
				return getToken(LittleDuckParser.Tokens.FLOAT_TYPE.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return LittleDuckParser.RULE_type
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? LittleDuckListener {
				listener.enterType(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? LittleDuckListener {
				listener.exitType(self)
			}
		}
	}
	@discardableResult
	 open func type() throws -> TypeContext {
		var _localctx: TypeContext
		_localctx = TypeContext(_ctx, getState())
		try enterRule(_localctx, 20, LittleDuckParser.RULE_type)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(139)
		 	_la = try _input.LA(1)
		 	if (!(_la == LittleDuckParser.Tokens.INT_TYPE.rawValue || _la == LittleDuckParser.Tokens.FLOAT_TYPE.rawValue)) {
		 	try _errHandler.recoverInline(self)
		 	}
		 	else {
		 		_errHandler.reportMatch(self)
		 		try consume()
		 	}

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class ExpressionContext: ParserRuleContext {
			open
			func term() -> TermContext? {
				return getRuleContext(TermContext.self, 0)
			}
			open
			func expressionPrime() -> ExpressionPrimeContext? {
				return getRuleContext(ExpressionPrimeContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return LittleDuckParser.RULE_expression
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? LittleDuckListener {
				listener.enterExpression(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? LittleDuckListener {
				listener.exitExpression(self)
			}
		}
	}
	@discardableResult
	 open func expression() throws -> ExpressionContext {
		var _localctx: ExpressionContext
		_localctx = ExpressionContext(_ctx, getState())
		try enterRule(_localctx, 22, LittleDuckParser.RULE_expression)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(141)
		 	try term()
		 	setState(142)
		 	try expressionPrime()

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class ExpressionPrimeContext: ParserRuleContext {
		open var `operator`: Token!
			open
			func term() -> TermContext? {
				return getRuleContext(TermContext.self, 0)
			}
			open
			func expressionPrime() -> ExpressionPrimeContext? {
				return getRuleContext(ExpressionPrimeContext.self, 0)
			}
			open
			func PLUS() -> TerminalNode? {
				return getToken(LittleDuckParser.Tokens.PLUS.rawValue, 0)
			}
			open
			func MINUS() -> TerminalNode? {
				return getToken(LittleDuckParser.Tokens.MINUS.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return LittleDuckParser.RULE_expressionPrime
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? LittleDuckListener {
				listener.enterExpressionPrime(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? LittleDuckListener {
				listener.exitExpressionPrime(self)
			}
		}
	}
	@discardableResult
	 open func expressionPrime() throws -> ExpressionPrimeContext {
		var _localctx: ExpressionPrimeContext
		_localctx = ExpressionPrimeContext(_ctx, getState())
		try enterRule(_localctx, 24, LittleDuckParser.RULE_expressionPrime)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(150)
		 	try _errHandler.sync(self)
		 	switch (LittleDuckParser.Tokens(rawValue: try _input.LA(1))!) {
		 	case .PLUS:fallthrough
		 	case .MINUS:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(144)
		 		_localctx.castdown(ExpressionPrimeContext.self).`operator` = try _input.LT(1)
		 		_la = try _input.LA(1)
		 		if (!(_la == LittleDuckParser.Tokens.PLUS.rawValue || _la == LittleDuckParser.Tokens.MINUS.rawValue)) {
		 			_localctx.castdown(ExpressionPrimeContext.self).`operator` = try _errHandler.recoverInline(self) as Token
		 		}
		 		else {
		 			_errHandler.reportMatch(self)
		 			try consume()
		 		}
		 		setState(145)
		 		try term()

		 		          ParserHelper.shared.pushOperator((_localctx.castdown(ExpressionPrimeContext.self).operator != nil ? _localctx.castdown(ExpressionPrimeContext.self).operator!.getText()! : ""))
		 		          ParserHelper.shared.popAndGenerateQuadruple()
		 		      
		 		setState(147)
		 		try expressionPrime()

		 		break
		 	case .RPAREN:fallthrough
		 	case .SEMICOLON:fallthrough
		 	case .COMMA:fallthrough
		 	case .LT:fallthrough
		 	case .GT:fallthrough
		 	case .NEQ:fallthrough
		 	case .EQEQ:
		 		try enterOuterAlt(_localctx, 2)

		 		break
		 	default:
		 		throw ANTLRException.recognition(e: NoViableAltException(self))
		 	}
		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class ComparisonExpressionContext: ParserRuleContext {
		open var _comparisonOperators: ComparisonOperatorsContext!
			open
			func expression() -> [ExpressionContext] {
				return getRuleContexts(ExpressionContext.self)
			}
			open
			func expression(_ i: Int) -> ExpressionContext? {
				return getRuleContext(ExpressionContext.self, i)
			}
			open
			func comparisonOperators() -> ComparisonOperatorsContext? {
				return getRuleContext(ComparisonOperatorsContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return LittleDuckParser.RULE_comparisonExpression
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? LittleDuckListener {
				listener.enterComparisonExpression(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? LittleDuckListener {
				listener.exitComparisonExpression(self)
			}
		}
	}
	@discardableResult
	 open func comparisonExpression() throws -> ComparisonExpressionContext {
		var _localctx: ComparisonExpressionContext
		_localctx = ComparisonExpressionContext(_ctx, getState())
		try enterRule(_localctx, 26, LittleDuckParser.RULE_comparisonExpression)
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(158)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,7, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(152)
		 		try expression()

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(153)
		 		try expression()
		 		setState(154)
		 		try {
		 				let assignmentValue = try comparisonOperators()
		 				_localctx.castdown(ComparisonExpressionContext.self)._comparisonOperators = assignmentValue
		 		     }()

		 		setState(155)
		 		try expression()


		 		          guard let rightType = ParserHelper.shared.popType(),
		 		                let leftType = ParserHelper.shared.popType() else {
		 		              throw CompilerError.typeMismatch(expected: "boolean", found: "nil")
		 		          }

		 		          guard let resultType = SemanticCube.cube[leftType]?[rightType]?[(_localctx.castdown(ComparisonExpressionContext.self)._comparisonOperators != nil ? try _input.getText(_localctx.castdown(ComparisonExpressionContext.self)._comparisonOperators!.start,_localctx.castdown(ComparisonExpressionContext.self)._comparisonOperators!.stop) : "")],
		 		                resultType == "boolean" else {
		 		              throw CompilerError.typeMismatch(expected: "boolean", found: "\(leftType), \(rightType)")
		 		          }

		 		          ParserHelper.shared.pushType(resultType)

		 		          guard let operand2 = ParserHelper.shared.popOperand(),
		 		                let operand1 = ParserHelper.shared.popOperand() else {
		 		              throw CompilerError.undefinedBehavior(message: "Missing operands for comparison")
		 		          }

		 		          let temp = ParserHelper.shared.generateTemp()
		 		          QuadrupleGenerator.shared.addQuadruple(op: (_localctx.castdown(ComparisonExpressionContext.self)._comparisonOperators != nil ? try _input.getText(_localctx.castdown(ComparisonExpressionContext.self)._comparisonOperators!.start,_localctx.castdown(ComparisonExpressionContext.self)._comparisonOperators!.stop) : ""), operand1: operand1, operand2: operand2, result: temp)
		 		          ParserHelper.shared.pushOperand(temp) // Push the result of comparison
		 		      

		 		break
		 	default: break
		 	}
		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class ComparisonOperatorsContext: ParserRuleContext {
			open
			func LT() -> TerminalNode? {
				return getToken(LittleDuckParser.Tokens.LT.rawValue, 0)
			}
			open
			func GT() -> TerminalNode? {
				return getToken(LittleDuckParser.Tokens.GT.rawValue, 0)
			}
			open
			func NEQ() -> TerminalNode? {
				return getToken(LittleDuckParser.Tokens.NEQ.rawValue, 0)
			}
			open
			func EQEQ() -> TerminalNode? {
				return getToken(LittleDuckParser.Tokens.EQEQ.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return LittleDuckParser.RULE_comparisonOperators
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? LittleDuckListener {
				listener.enterComparisonOperators(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? LittleDuckListener {
				listener.exitComparisonOperators(self)
			}
		}
	}
	@discardableResult
	 open func comparisonOperators() throws -> ComparisonOperatorsContext {
		var _localctx: ComparisonOperatorsContext
		_localctx = ComparisonOperatorsContext(_ctx, getState())
		try enterRule(_localctx, 28, LittleDuckParser.RULE_comparisonOperators)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(160)
		 	_la = try _input.LA(1)
		 	if (!(((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 1006632960) != 0))) {
		 	try _errHandler.recoverInline(self)
		 	}
		 	else {
		 		_errHandler.reportMatch(self)
		 		try consume()
		 	}

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class TermContext: ParserRuleContext {
			open
			func factor() -> FactorContext? {
				return getRuleContext(FactorContext.self, 0)
			}
			open
			func termPrime() -> TermPrimeContext? {
				return getRuleContext(TermPrimeContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return LittleDuckParser.RULE_term
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? LittleDuckListener {
				listener.enterTerm(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? LittleDuckListener {
				listener.exitTerm(self)
			}
		}
	}
	@discardableResult
	 open func term() throws -> TermContext {
		var _localctx: TermContext
		_localctx = TermContext(_ctx, getState())
		try enterRule(_localctx, 30, LittleDuckParser.RULE_term)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(162)
		 	try factor()
		 	setState(163)
		 	try termPrime()

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class TermPrimeContext: ParserRuleContext {
		open var `operator`: Token!
			open
			func factor() -> FactorContext? {
				return getRuleContext(FactorContext.self, 0)
			}
			open
			func termPrime() -> TermPrimeContext? {
				return getRuleContext(TermPrimeContext.self, 0)
			}
			open
			func MUL() -> TerminalNode? {
				return getToken(LittleDuckParser.Tokens.MUL.rawValue, 0)
			}
			open
			func DIV() -> TerminalNode? {
				return getToken(LittleDuckParser.Tokens.DIV.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return LittleDuckParser.RULE_termPrime
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? LittleDuckListener {
				listener.enterTermPrime(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? LittleDuckListener {
				listener.exitTermPrime(self)
			}
		}
	}
	@discardableResult
	 open func termPrime() throws -> TermPrimeContext {
		var _localctx: TermPrimeContext
		_localctx = TermPrimeContext(_ctx, getState())
		try enterRule(_localctx, 32, LittleDuckParser.RULE_termPrime)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(171)
		 	try _errHandler.sync(self)
		 	switch (LittleDuckParser.Tokens(rawValue: try _input.LA(1))!) {
		 	case .MUL:fallthrough
		 	case .DIV:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(165)
		 		_localctx.castdown(TermPrimeContext.self).`operator` = try _input.LT(1)
		 		_la = try _input.LA(1)
		 		if (!(_la == LittleDuckParser.Tokens.MUL.rawValue || _la == LittleDuckParser.Tokens.DIV.rawValue)) {
		 			_localctx.castdown(TermPrimeContext.self).`operator` = try _errHandler.recoverInline(self) as Token
		 		}
		 		else {
		 			_errHandler.reportMatch(self)
		 			try consume()
		 		}
		 		setState(166)
		 		try factor()

		 		          // Access the text of the matched operator
		 		          ParserHelper.shared.pushOperator((_localctx.castdown(TermPrimeContext.self).operator != nil ? _localctx.castdown(TermPrimeContext.self).operator!.getText()! : ""))
		 		          ParserHelper.shared.popAndGenerateQuadruple()
		 		      
		 		setState(168)
		 		try termPrime()

		 		break
		 	case .RPAREN:fallthrough
		 	case .SEMICOLON:fallthrough
		 	case .COMMA:fallthrough
		 	case .PLUS:fallthrough
		 	case .MINUS:fallthrough
		 	case .LT:fallthrough
		 	case .GT:fallthrough
		 	case .NEQ:fallthrough
		 	case .EQEQ:
		 		try enterOuterAlt(_localctx, 2)

		 		break
		 	default:
		 		throw ANTLRException.recognition(e: NoViableAltException(self))
		 	}
		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class FactorContext: ParserRuleContext {
		open var _CONST: Token!
		open var _ID: Token!
			open
			func parenthesizedExpression() -> ParenthesizedExpressionContext? {
				return getRuleContext(ParenthesizedExpressionContext.self, 0)
			}
			open
			func CONST() -> TerminalNode? {
				return getToken(LittleDuckParser.Tokens.CONST.rawValue, 0)
			}
			open
			func ID() -> TerminalNode? {
				return getToken(LittleDuckParser.Tokens.ID.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return LittleDuckParser.RULE_factor
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? LittleDuckListener {
				listener.enterFactor(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? LittleDuckListener {
				listener.exitFactor(self)
			}
		}
	}
	@discardableResult
	 open func factor() throws -> FactorContext {
		var _localctx: FactorContext
		_localctx = FactorContext(_ctx, getState())
		try enterRule(_localctx, 34, LittleDuckParser.RULE_factor)
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(178)
		 	try _errHandler.sync(self)
		 	switch (LittleDuckParser.Tokens(rawValue: try _input.LA(1))!) {
		 	case .LPAREN:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(173)
		 		try parenthesizedExpression()

		 		break

		 	case .CONST:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(174)
		 		try {
		 				let assignmentValue = try match(LittleDuckParser.Tokens.CONST.rawValue)
		 				_localctx.castdown(FactorContext.self)._CONST = assignmentValue
		 		     }()


		 		          ParserHelper.shared.pushOperand((_localctx.castdown(FactorContext.self)._CONST != nil ? _localctx.castdown(FactorContext.self)._CONST!.getText()! : ""))
		 		          ParserHelper.shared.pushType("int") // Example for INT
		 		      

		 		break

		 	case .ID:
		 		try enterOuterAlt(_localctx, 3)
		 		setState(176)
		 		try {
		 				let assignmentValue = try match(LittleDuckParser.Tokens.ID.rawValue)
		 				_localctx.castdown(FactorContext.self)._ID = assignmentValue
		 		     }()


		 		          guard let type = VariableTable.shared.getVariableType(name: (_localctx.castdown(FactorContext.self)._ID != nil ? _localctx.castdown(FactorContext.self)._ID!.getText()! : "")) else {
		 		              throw CompilerError.undefinedBehavior(message: "Variable \((_localctx.castdown(FactorContext.self)._ID != nil ? _localctx.castdown(FactorContext.self)._ID!.getText()! : "")) not defined")
		 		          }
		 		          ParserHelper.shared.pushOperand((_localctx.castdown(FactorContext.self)._ID != nil ? _localctx.castdown(FactorContext.self)._ID!.getText()! : ""))
		 		          ParserHelper.shared.pushType(type)
		 		      

		 		break
		 	default:
		 		throw ANTLRException.recognition(e: NoViableAltException(self))
		 	}
		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class ParenthesizedExpressionContext: ParserRuleContext {
			open
			func LPAREN() -> TerminalNode? {
				return getToken(LittleDuckParser.Tokens.LPAREN.rawValue, 0)
			}
			open
			func comparisonExpression() -> ComparisonExpressionContext? {
				return getRuleContext(ComparisonExpressionContext.self, 0)
			}
			open
			func RPAREN() -> TerminalNode? {
				return getToken(LittleDuckParser.Tokens.RPAREN.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return LittleDuckParser.RULE_parenthesizedExpression
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? LittleDuckListener {
				listener.enterParenthesizedExpression(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? LittleDuckListener {
				listener.exitParenthesizedExpression(self)
			}
		}
	}
	@discardableResult
	 open func parenthesizedExpression() throws -> ParenthesizedExpressionContext {
		var _localctx: ParenthesizedExpressionContext
		_localctx = ParenthesizedExpressionContext(_ctx, getState())
		try enterRule(_localctx, 36, LittleDuckParser.RULE_parenthesizedExpression)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(180)
		 	try match(LittleDuckParser.Tokens.LPAREN.rawValue)
		 	setState(181)
		 	try comparisonExpression()
		 	setState(182)
		 	try match(LittleDuckParser.Tokens.RPAREN.rawValue)

		 	          // Parenthesis just evaluates and pushes result from comparisonExpression
		 	      

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class OptionalSignContext: ParserRuleContext {
			open
			func PLUS() -> TerminalNode? {
				return getToken(LittleDuckParser.Tokens.PLUS.rawValue, 0)
			}
			open
			func MINUS() -> TerminalNode? {
				return getToken(LittleDuckParser.Tokens.MINUS.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return LittleDuckParser.RULE_optionalSign
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? LittleDuckListener {
				listener.enterOptionalSign(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? LittleDuckListener {
				listener.exitOptionalSign(self)
			}
		}
	}
	@discardableResult
	 open func optionalSign() throws -> OptionalSignContext {
		var _localctx: OptionalSignContext
		_localctx = OptionalSignContext(_ctx, getState())
		try enterRule(_localctx, 38, LittleDuckParser.RULE_optionalSign)
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(188)
		 	try _errHandler.sync(self)
		 	switch (LittleDuckParser.Tokens(rawValue: try _input.LA(1))!) {
		 	case .PLUS:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(185)
		 		try match(LittleDuckParser.Tokens.PLUS.rawValue)

		 		break

		 	case .MINUS:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(186)
		 		try match(LittleDuckParser.Tokens.MINUS.rawValue)

		 		break

		 	case .EOF:
		 		try enterOuterAlt(_localctx, 3)

		 		break
		 	default:
		 		throw ANTLRException.recognition(e: NoViableAltException(self))
		 	}
		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class PrimitiveContext: ParserRuleContext {
			open
			func ID() -> TerminalNode? {
				return getToken(LittleDuckParser.Tokens.ID.rawValue, 0)
			}
			open
			func CONST() -> TerminalNode? {
				return getToken(LittleDuckParser.Tokens.CONST.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return LittleDuckParser.RULE_primitive
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? LittleDuckListener {
				listener.enterPrimitive(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? LittleDuckListener {
				listener.exitPrimitive(self)
			}
		}
	}
	@discardableResult
	 open func primitive() throws -> PrimitiveContext {
		var _localctx: PrimitiveContext
		_localctx = PrimitiveContext(_ctx, getState())
		try enterRule(_localctx, 40, LittleDuckParser.RULE_primitive)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(190)
		 	_la = try _input.LA(1)
		 	if (!(_la == LittleDuckParser.Tokens.CONST.rawValue || _la == LittleDuckParser.Tokens.ID.rawValue)) {
		 	try _errHandler.recoverInline(self)
		 	}
		 	else {
		 		_errHandler.reportMatch(self)
		 		try consume()
		 	}

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class StatementContext: ParserRuleContext {
			open
			func assignment() -> AssignmentContext? {
				return getRuleContext(AssignmentContext.self, 0)
			}
			open
			func conditional() -> ConditionalContext? {
				return getRuleContext(ConditionalContext.self, 0)
			}
			open
			func loop() -> LoopContext? {
				return getRuleContext(LoopContext.self, 0)
			}
			open
			func functionCall() -> FunctionCallContext? {
				return getRuleContext(FunctionCallContext.self, 0)
			}
			open
			func print() -> PrintContext? {
				return getRuleContext(PrintContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return LittleDuckParser.RULE_statement
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? LittleDuckListener {
				listener.enterStatement(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? LittleDuckListener {
				listener.exitStatement(self)
			}
		}
	}
	@discardableResult
	 open func statement() throws -> StatementContext {
		var _localctx: StatementContext
		_localctx = StatementContext(_ctx, getState())
		try enterRule(_localctx, 42, LittleDuckParser.RULE_statement)
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(197)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,11, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(192)
		 		try assignment()

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(193)
		 		try conditional()

		 		break
		 	case 3:
		 		try enterOuterAlt(_localctx, 3)
		 		setState(194)
		 		try loop()

		 		break
		 	case 4:
		 		try enterOuterAlt(_localctx, 4)
		 		setState(195)
		 		try functionCall()

		 		break
		 	case 5:
		 		try enterOuterAlt(_localctx, 5)
		 		setState(196)
		 		try print()

		 		break
		 	default: break
		 	}
		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class AssignmentContext: ParserRuleContext {
		open var _ID: Token!
			open
			func ID() -> TerminalNode? {
				return getToken(LittleDuckParser.Tokens.ID.rawValue, 0)
			}
			open
			func EQ() -> TerminalNode? {
				return getToken(LittleDuckParser.Tokens.EQ.rawValue, 0)
			}
			open
			func comparisonExpression() -> ComparisonExpressionContext? {
				return getRuleContext(ComparisonExpressionContext.self, 0)
			}
			open
			func SEMICOLON() -> TerminalNode? {
				return getToken(LittleDuckParser.Tokens.SEMICOLON.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return LittleDuckParser.RULE_assignment
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? LittleDuckListener {
				listener.enterAssignment(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? LittleDuckListener {
				listener.exitAssignment(self)
			}
		}
	}
	@discardableResult
	 open func assignment() throws -> AssignmentContext {
		var _localctx: AssignmentContext
		_localctx = AssignmentContext(_ctx, getState())
		try enterRule(_localctx, 44, LittleDuckParser.RULE_assignment)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(199)
		 	try {
		 			let assignmentValue = try match(LittleDuckParser.Tokens.ID.rawValue)
		 			_localctx.castdown(AssignmentContext.self)._ID = assignmentValue
		 	     }()

		 	setState(200)
		 	try match(LittleDuckParser.Tokens.EQ.rawValue)
		 	setState(201)
		 	try comparisonExpression()
		 	setState(202)
		 	try match(LittleDuckParser.Tokens.SEMICOLON.rawValue)

		 	          guard let variableType = VariableTable.shared.getVariableType(name: (_localctx.castdown(AssignmentContext.self)._ID != nil ? _localctx.castdown(AssignmentContext.self)._ID!.getText()! : "")) else {
		 	              throw CompilerError.undefinedBehavior(message: "Variable \((_localctx.castdown(AssignmentContext.self)._ID != nil ? _localctx.castdown(AssignmentContext.self)._ID!.getText()! : "")) not declared.")
		 	          }

		 	          guard let assignedType = ParserHelper.shared.popType() else {
		 	              throw CompilerError.undefinedBehavior(message: "Missing type for value assigned to \((_localctx.castdown(AssignmentContext.self)._ID != nil ? _localctx.castdown(AssignmentContext.self)._ID!.getText()! : "")).")
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
		 	              throw CompilerError.missingValueForAssignment(variable: (_localctx.castdown(AssignmentContext.self)._ID != nil ? _localctx.castdown(AssignmentContext.self)._ID!.getText()! : ""))
		 	          }

		 	          QuadrupleGenerator.shared.addQuadruple(op: "=", operand1: value, operand2: "", result: (_localctx.castdown(AssignmentContext.self)._ID != nil ? _localctx.castdown(AssignmentContext.self)._ID!.getText()! : ""))
		 	      

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class ConditionalContext: ParserRuleContext {
			open
			func LPAREN() -> TerminalNode? {
				return getToken(LittleDuckParser.Tokens.LPAREN.rawValue, 0)
			}
			open
			func comparisonExpression() -> ComparisonExpressionContext? {
				return getRuleContext(ComparisonExpressionContext.self, 0)
			}
			open
			func RPAREN() -> TerminalNode? {
				return getToken(LittleDuckParser.Tokens.RPAREN.rawValue, 0)
			}
			open
			func body() -> BodyContext? {
				return getRuleContext(BodyContext.self, 0)
			}
			open
			func elseBody() -> ElseBodyContext? {
				return getRuleContext(ElseBodyContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return LittleDuckParser.RULE_conditional
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? LittleDuckListener {
				listener.enterConditional(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? LittleDuckListener {
				listener.exitConditional(self)
			}
		}
	}
	@discardableResult
	 open func conditional() throws -> ConditionalContext {
		var _localctx: ConditionalContext
		_localctx = ConditionalContext(_ctx, getState())
		try enterRule(_localctx, 46, LittleDuckParser.RULE_conditional)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(205)
		 	try match(LittleDuckParser.Tokens.T__0.rawValue)
		 	setState(206)
		 	try match(LittleDuckParser.Tokens.LPAREN.rawValue)
		 	setState(207)
		 	try comparisonExpression()
		 	setState(208)
		 	try match(LittleDuckParser.Tokens.RPAREN.rawValue)


		 	        guard let conditionOperand = ParserHelper.shared.popOperand() else {
		 	            fatalError("Missing condition operand for IF statement")
		 	        }

		 	        // Generate GotoF immediately
		 	        let jumpQuadIndex = QuadrupleGenerator.shared.addQuadruple(op: "GotoF", operand1: conditionOperand, operand2: "", result: "")
		 	        ParserHelper.shared.pushJump(jumpQuadIndex) // Push index for backpatching
		 	    
		 	setState(210)
		 	try body()

		 	        // Backpatch GotoF to jump to the end of the body
		 	        guard let jumpIndex = ParserHelper.shared.popJump() else {
		 	            fatalError("No jump to backpatch for IF statement")
		 	        }
		 	        QuadrupleGenerator.shared.fillJumpTarget(jumpIndex, with: QuadrupleGenerator.shared.currentQuadrupleIndex)
		 	    
		 	setState(212)
		 	try elseBody()

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class ElseBodyContext: ParserRuleContext {
			open
			func ELSE() -> TerminalNode? {
				return getToken(LittleDuckParser.Tokens.ELSE.rawValue, 0)
			}
			open
			func body() -> BodyContext? {
				return getRuleContext(BodyContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return LittleDuckParser.RULE_elseBody
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? LittleDuckListener {
				listener.enterElseBody(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? LittleDuckListener {
				listener.exitElseBody(self)
			}
		}
	}
	@discardableResult
	 open func elseBody() throws -> ElseBodyContext {
		var _localctx: ElseBodyContext
		_localctx = ElseBodyContext(_ctx, getState())
		try enterRule(_localctx, 48, LittleDuckParser.RULE_elseBody)
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(219)
		 	try _errHandler.sync(self)
		 	switch (LittleDuckParser.Tokens(rawValue: try _input.LA(1))!) {
		 	case .ELSE:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(214)
		 		try match(LittleDuckParser.Tokens.ELSE.rawValue)
		 		setState(215)
		 		try body()

		 		        // Generate an unconditional Goto to skip the `else` body
		 		        let elseJump = QuadrupleGenerator.shared.addUnconditionalJump()
		 		        ParserHelper.shared.pushJump(elseJump)

		 		        // Backpatch the previous GotoF to skip to this part
		 		        guard let ifFalseJump = ParserHelper.shared.popJump() else {
		 		            fatalError("No jump to backpatch for IF statement")
		 		        }
		 		        QuadrupleGenerator.shared.fillJumpTarget(ifFalseJump, with: QuadrupleGenerator.shared.currentQuadrupleIndex)
		 		    

		 		break
		 	case .T__0:fallthrough
		 	case .WHILE:fallthrough
		 	case .PRINT:fallthrough
		 	case .RBRACE:fallthrough
		 	case .ID:
		 		try enterOuterAlt(_localctx, 2)

		 		break
		 	default:
		 		throw ANTLRException.recognition(e: NoViableAltException(self))
		 	}
		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class LoopContext: ParserRuleContext {
			open
			func WHILE() -> TerminalNode? {
				return getToken(LittleDuckParser.Tokens.WHILE.rawValue, 0)
			}
			open
			func LPAREN() -> TerminalNode? {
				return getToken(LittleDuckParser.Tokens.LPAREN.rawValue, 0)
			}
			open
			func comparisonExpression() -> ComparisonExpressionContext? {
				return getRuleContext(ComparisonExpressionContext.self, 0)
			}
			open
			func RPAREN() -> TerminalNode? {
				return getToken(LittleDuckParser.Tokens.RPAREN.rawValue, 0)
			}
			open
			func DO() -> TerminalNode? {
				return getToken(LittleDuckParser.Tokens.DO.rawValue, 0)
			}
			open
			func body() -> BodyContext? {
				return getRuleContext(BodyContext.self, 0)
			}
			open
			func SEMICOLON() -> TerminalNode? {
				return getToken(LittleDuckParser.Tokens.SEMICOLON.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return LittleDuckParser.RULE_loop
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? LittleDuckListener {
				listener.enterLoop(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? LittleDuckListener {
				listener.exitLoop(self)
			}
		}
	}
	@discardableResult
	 open func loop() throws -> LoopContext {
		var _localctx: LoopContext
		_localctx = LoopContext(_ctx, getState())
		try enterRule(_localctx, 50, LittleDuckParser.RULE_loop)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(221)
		 	try match(LittleDuckParser.Tokens.WHILE.rawValue)
		 	setState(222)
		 	try match(LittleDuckParser.Tokens.LPAREN.rawValue)
		 	setState(223)
		 	try comparisonExpression()
		 	setState(224)
		 	try match(LittleDuckParser.Tokens.RPAREN.rawValue)
		 	setState(225)
		 	try match(LittleDuckParser.Tokens.DO.rawValue)
		 	setState(226)
		 	try body()
		 	setState(227)
		 	try match(LittleDuckParser.Tokens.SEMICOLON.rawValue)

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class BodyContext: ParserRuleContext {
			open
			func LBRACE() -> TerminalNode? {
				return getToken(LittleDuckParser.Tokens.LBRACE.rawValue, 0)
			}
			open
			func statementList() -> StatementListContext? {
				return getRuleContext(StatementListContext.self, 0)
			}
			open
			func RBRACE() -> TerminalNode? {
				return getToken(LittleDuckParser.Tokens.RBRACE.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return LittleDuckParser.RULE_body
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? LittleDuckListener {
				listener.enterBody(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? LittleDuckListener {
				listener.exitBody(self)
			}
		}
	}
	@discardableResult
	 open func body() throws -> BodyContext {
		var _localctx: BodyContext
		_localctx = BodyContext(_ctx, getState())
		try enterRule(_localctx, 52, LittleDuckParser.RULE_body)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(229)
		 	try match(LittleDuckParser.Tokens.LBRACE.rawValue)
		 	setState(230)
		 	try statementList()
		 	setState(231)
		 	try match(LittleDuckParser.Tokens.RBRACE.rawValue)

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class StatementListContext: ParserRuleContext {
			open
			func statement() -> StatementContext? {
				return getRuleContext(StatementContext.self, 0)
			}
			open
			func statementList() -> StatementListContext? {
				return getRuleContext(StatementListContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return LittleDuckParser.RULE_statementList
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? LittleDuckListener {
				listener.enterStatementList(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? LittleDuckListener {
				listener.exitStatementList(self)
			}
		}
	}
	@discardableResult
	 open func statementList() throws -> StatementListContext {
		var _localctx: StatementListContext
		_localctx = StatementListContext(_ctx, getState())
		try enterRule(_localctx, 54, LittleDuckParser.RULE_statementList)
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(237)
		 	try _errHandler.sync(self)
		 	switch (LittleDuckParser.Tokens(rawValue: try _input.LA(1))!) {
		 	case .T__0:fallthrough
		 	case .WHILE:fallthrough
		 	case .PRINT:fallthrough
		 	case .ID:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(233)
		 		try statement()
		 		setState(234)
		 		try statementList()

		 		break

		 	case .RBRACE:
		 		try enterOuterAlt(_localctx, 2)

		 		break
		 	default:
		 		throw ANTLRException.recognition(e: NoViableAltException(self))
		 	}
		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class PrintContext: ParserRuleContext {
			open
			func PRINT() -> TerminalNode? {
				return getToken(LittleDuckParser.Tokens.PRINT.rawValue, 0)
			}
			open
			func LPAREN() -> TerminalNode? {
				return getToken(LittleDuckParser.Tokens.LPAREN.rawValue, 0)
			}
			open
			func printContent() -> PrintContentContext? {
				return getRuleContext(PrintContentContext.self, 0)
			}
			open
			func RPAREN() -> TerminalNode? {
				return getToken(LittleDuckParser.Tokens.RPAREN.rawValue, 0)
			}
			open
			func SEMICOLON() -> TerminalNode? {
				return getToken(LittleDuckParser.Tokens.SEMICOLON.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return LittleDuckParser.RULE_print
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? LittleDuckListener {
				listener.enterPrint(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? LittleDuckListener {
				listener.exitPrint(self)
			}
		}
	}
	@discardableResult
	 open func print() throws -> PrintContext {
		var _localctx: PrintContext
		_localctx = PrintContext(_ctx, getState())
		try enterRule(_localctx, 56, LittleDuckParser.RULE_print)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(239)
		 	try match(LittleDuckParser.Tokens.PRINT.rawValue)
		 	setState(240)
		 	try match(LittleDuckParser.Tokens.LPAREN.rawValue)
		 	setState(241)
		 	try printContent()
		 	setState(242)
		 	try match(LittleDuckParser.Tokens.RPAREN.rawValue)
		 	setState(243)
		 	try match(LittleDuckParser.Tokens.SEMICOLON.rawValue)

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class PrintContentContext: ParserRuleContext {
			open
			func comparisonExpression() -> ComparisonExpressionContext? {
				return getRuleContext(ComparisonExpressionContext.self, 0)
			}
			open
			func morePrintContent() -> MorePrintContentContext? {
				return getRuleContext(MorePrintContentContext.self, 0)
			}
			open
			func STRING_LITERAL() -> TerminalNode? {
				return getToken(LittleDuckParser.Tokens.STRING_LITERAL.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return LittleDuckParser.RULE_printContent
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? LittleDuckListener {
				listener.enterPrintContent(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? LittleDuckListener {
				listener.exitPrintContent(self)
			}
		}
	}
	@discardableResult
	 open func printContent() throws -> PrintContentContext {
		var _localctx: PrintContentContext
		_localctx = PrintContentContext(_ctx, getState())
		try enterRule(_localctx, 58, LittleDuckParser.RULE_printContent)
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(250)
		 	try _errHandler.sync(self)
		 	switch (LittleDuckParser.Tokens(rawValue: try _input.LA(1))!) {
		 	case .CONST:fallthrough
		 	case .LPAREN:fallthrough
		 	case .ID:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(245)
		 		try comparisonExpression()
		 		setState(246)
		 		try morePrintContent()

		 		break

		 	case .STRING_LITERAL:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(248)
		 		try match(LittleDuckParser.Tokens.STRING_LITERAL.rawValue)
		 		setState(249)
		 		try morePrintContent()

		 		break
		 	default:
		 		throw ANTLRException.recognition(e: NoViableAltException(self))
		 	}
		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class MorePrintContentContext: ParserRuleContext {
			open
			func COMMA() -> TerminalNode? {
				return getToken(LittleDuckParser.Tokens.COMMA.rawValue, 0)
			}
			open
			func printContent() -> PrintContentContext? {
				return getRuleContext(PrintContentContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return LittleDuckParser.RULE_morePrintContent
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? LittleDuckListener {
				listener.enterMorePrintContent(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? LittleDuckListener {
				listener.exitMorePrintContent(self)
			}
		}
	}
	@discardableResult
	 open func morePrintContent() throws -> MorePrintContentContext {
		var _localctx: MorePrintContentContext
		_localctx = MorePrintContentContext(_ctx, getState())
		try enterRule(_localctx, 60, LittleDuckParser.RULE_morePrintContent)
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(255)
		 	try _errHandler.sync(self)
		 	switch (LittleDuckParser.Tokens(rawValue: try _input.LA(1))!) {
		 	case .COMMA:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(252)
		 		try match(LittleDuckParser.Tokens.COMMA.rawValue)
		 		setState(253)
		 		try printContent()

		 		break

		 	case .RPAREN:
		 		try enterOuterAlt(_localctx, 2)

		 		break
		 	default:
		 		throw ANTLRException.recognition(e: NoViableAltException(self))
		 	}
		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class FunctionCallContext: ParserRuleContext {
			open
			func ID() -> TerminalNode? {
				return getToken(LittleDuckParser.Tokens.ID.rawValue, 0)
			}
			open
			func LPAREN() -> TerminalNode? {
				return getToken(LittleDuckParser.Tokens.LPAREN.rawValue, 0)
			}
			open
			func expressionList() -> ExpressionListContext? {
				return getRuleContext(ExpressionListContext.self, 0)
			}
			open
			func RPAREN() -> TerminalNode? {
				return getToken(LittleDuckParser.Tokens.RPAREN.rawValue, 0)
			}
			open
			func SEMICOLON() -> TerminalNode? {
				return getToken(LittleDuckParser.Tokens.SEMICOLON.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return LittleDuckParser.RULE_functionCall
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? LittleDuckListener {
				listener.enterFunctionCall(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? LittleDuckListener {
				listener.exitFunctionCall(self)
			}
		}
	}
	@discardableResult
	 open func functionCall() throws -> FunctionCallContext {
		var _localctx: FunctionCallContext
		_localctx = FunctionCallContext(_ctx, getState())
		try enterRule(_localctx, 62, LittleDuckParser.RULE_functionCall)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(257)
		 	try match(LittleDuckParser.Tokens.ID.rawValue)
		 	setState(258)
		 	try match(LittleDuckParser.Tokens.LPAREN.rawValue)
		 	setState(259)
		 	try expressionList()
		 	setState(260)
		 	try match(LittleDuckParser.Tokens.RPAREN.rawValue)
		 	setState(261)
		 	try match(LittleDuckParser.Tokens.SEMICOLON.rawValue)

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class ExpressionListContext: ParserRuleContext {
			open
			func comparisonExpression() -> ComparisonExpressionContext? {
				return getRuleContext(ComparisonExpressionContext.self, 0)
			}
			open
			func moreExpressions() -> MoreExpressionsContext? {
				return getRuleContext(MoreExpressionsContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return LittleDuckParser.RULE_expressionList
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? LittleDuckListener {
				listener.enterExpressionList(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? LittleDuckListener {
				listener.exitExpressionList(self)
			}
		}
	}
	@discardableResult
	 open func expressionList() throws -> ExpressionListContext {
		var _localctx: ExpressionListContext
		_localctx = ExpressionListContext(_ctx, getState())
		try enterRule(_localctx, 64, LittleDuckParser.RULE_expressionList)
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(267)
		 	try _errHandler.sync(self)
		 	switch (LittleDuckParser.Tokens(rawValue: try _input.LA(1))!) {
		 	case .CONST:fallthrough
		 	case .LPAREN:fallthrough
		 	case .ID:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(263)
		 		try comparisonExpression()
		 		setState(264)
		 		try moreExpressions()

		 		break

		 	case .RPAREN:
		 		try enterOuterAlt(_localctx, 2)

		 		break
		 	default:
		 		throw ANTLRException.recognition(e: NoViableAltException(self))
		 	}
		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class MoreExpressionsContext: ParserRuleContext {
			open
			func COMMA() -> TerminalNode? {
				return getToken(LittleDuckParser.Tokens.COMMA.rawValue, 0)
			}
			open
			func comparisonExpression() -> ComparisonExpressionContext? {
				return getRuleContext(ComparisonExpressionContext.self, 0)
			}
			open
			func moreExpressions() -> MoreExpressionsContext? {
				return getRuleContext(MoreExpressionsContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return LittleDuckParser.RULE_moreExpressions
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? LittleDuckListener {
				listener.enterMoreExpressions(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? LittleDuckListener {
				listener.exitMoreExpressions(self)
			}
		}
	}
	@discardableResult
	 open func moreExpressions() throws -> MoreExpressionsContext {
		var _localctx: MoreExpressionsContext
		_localctx = MoreExpressionsContext(_ctx, getState())
		try enterRule(_localctx, 66, LittleDuckParser.RULE_moreExpressions)
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(274)
		 	try _errHandler.sync(self)
		 	switch (LittleDuckParser.Tokens(rawValue: try _input.LA(1))!) {
		 	case .COMMA:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(269)
		 		try match(LittleDuckParser.Tokens.COMMA.rawValue)
		 		setState(270)
		 		try comparisonExpression()
		 		setState(271)
		 		try moreExpressions()

		 		break

		 	case .RPAREN:
		 		try enterOuterAlt(_localctx, 2)

		 		break
		 	default:
		 		throw ANTLRException.recognition(e: NoViableAltException(self))
		 	}
		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	static let _serializedATN:[Int] = [
		4,1,34,277,2,0,7,0,2,1,7,1,2,2,7,2,2,3,7,3,2,4,7,4,2,5,7,5,2,6,7,6,2,7,
		7,7,2,8,7,8,2,9,7,9,2,10,7,10,2,11,7,11,2,12,7,12,2,13,7,13,2,14,7,14,
		2,15,7,15,2,16,7,16,2,17,7,17,2,18,7,18,2,19,7,19,2,20,7,20,2,21,7,21,
		2,22,7,22,2,23,7,23,2,24,7,24,2,25,7,25,2,26,7,26,2,27,7,27,2,28,7,28,
		2,29,7,29,2,30,7,30,2,31,7,31,2,32,7,32,2,33,7,33,1,0,1,0,1,0,1,0,1,0,
		1,0,1,0,1,0,1,0,1,1,1,1,1,1,3,1,81,8,1,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,
		3,2,91,8,2,1,3,1,3,1,3,1,3,1,3,1,4,1,4,1,4,1,4,1,4,1,4,3,4,104,8,4,1,5,
		1,5,1,5,1,5,3,5,110,8,5,1,6,1,6,1,6,1,6,1,6,1,6,1,6,1,6,1,6,1,6,1,6,1,
		7,1,7,1,7,1,7,3,7,127,8,7,1,8,1,8,1,8,1,8,1,9,1,9,1,9,1,9,1,9,3,9,138,
		8,9,1,10,1,10,1,11,1,11,1,11,1,12,1,12,1,12,1,12,1,12,1,12,3,12,151,8,
		12,1,13,1,13,1,13,1,13,1,13,1,13,3,13,159,8,13,1,14,1,14,1,15,1,15,1,15,
		1,16,1,16,1,16,1,16,1,16,1,16,3,16,172,8,16,1,17,1,17,1,17,1,17,1,17,3,
		17,179,8,17,1,18,1,18,1,18,1,18,1,18,1,19,1,19,1,19,3,19,189,8,19,1,20,
		1,20,1,21,1,21,1,21,1,21,1,21,3,21,198,8,21,1,22,1,22,1,22,1,22,1,22,1,
		22,1,23,1,23,1,23,1,23,1,23,1,23,1,23,1,23,1,23,1,24,1,24,1,24,1,24,1,
		24,3,24,220,8,24,1,25,1,25,1,25,1,25,1,25,1,25,1,25,1,25,1,26,1,26,1,26,
		1,26,1,27,1,27,1,27,1,27,3,27,238,8,27,1,28,1,28,1,28,1,28,1,28,1,28,1,
		29,1,29,1,29,1,29,1,29,3,29,251,8,29,1,30,1,30,1,30,3,30,256,8,30,1,31,
		1,31,1,31,1,31,1,31,1,31,1,32,1,32,1,32,1,32,3,32,268,8,32,1,33,1,33,1,
		33,1,33,1,33,3,33,275,8,33,1,33,0,0,34,0,2,4,6,8,10,12,14,16,18,20,22,
		24,26,28,30,32,34,36,38,40,42,44,46,48,50,52,54,56,58,60,62,64,66,0,5,
		1,0,12,13,1,0,22,23,1,0,26,29,1,0,24,25,2,0,2,2,30,30,265,0,68,1,0,0,0,
		2,80,1,0,0,0,4,90,1,0,0,0,6,92,1,0,0,0,8,103,1,0,0,0,10,109,1,0,0,0,12,
		111,1,0,0,0,14,126,1,0,0,0,16,128,1,0,0,0,18,137,1,0,0,0,20,139,1,0,0,
		0,22,141,1,0,0,0,24,150,1,0,0,0,26,158,1,0,0,0,28,160,1,0,0,0,30,162,1,
		0,0,0,32,171,1,0,0,0,34,178,1,0,0,0,36,180,1,0,0,0,38,188,1,0,0,0,40,190,
		1,0,0,0,42,197,1,0,0,0,44,199,1,0,0,0,46,205,1,0,0,0,48,219,1,0,0,0,50,
		221,1,0,0,0,52,229,1,0,0,0,54,237,1,0,0,0,56,239,1,0,0,0,58,250,1,0,0,
		0,60,255,1,0,0,0,62,257,1,0,0,0,64,267,1,0,0,0,66,274,1,0,0,0,68,69,5,
		3,0,0,69,70,5,30,0,0,70,71,5,18,0,0,71,72,3,2,1,0,72,73,3,10,5,0,73,74,
		5,4,0,0,74,75,3,52,26,0,75,76,5,5,0,0,76,1,1,0,0,0,77,78,5,6,0,0,78,81,
		3,4,2,0,79,81,1,0,0,0,80,77,1,0,0,0,80,79,1,0,0,0,81,3,1,0,0,0,82,83,3,
		6,3,0,83,84,5,19,0,0,84,85,3,20,10,0,85,86,5,18,0,0,86,87,6,2,-1,0,87,
		88,3,4,2,0,88,91,1,0,0,0,89,91,1,0,0,0,90,82,1,0,0,0,90,89,1,0,0,0,91,
		5,1,0,0,0,92,93,5,30,0,0,93,94,6,3,-1,0,94,95,3,8,4,0,95,96,6,3,-1,0,96,
		7,1,0,0,0,97,98,5,20,0,0,98,99,5,30,0,0,99,100,3,8,4,0,100,101,6,4,-1,
		0,101,104,1,0,0,0,102,104,6,4,-1,0,103,97,1,0,0,0,103,102,1,0,0,0,104,
		9,1,0,0,0,105,106,3,12,6,0,106,107,3,10,5,0,107,110,1,0,0,0,108,110,1,
		0,0,0,109,105,1,0,0,0,109,108,1,0,0,0,110,11,1,0,0,0,111,112,5,7,0,0,112,
		113,5,30,0,0,113,114,5,14,0,0,114,115,3,14,7,0,115,116,5,15,0,0,116,117,
		5,16,0,0,117,118,3,2,1,0,118,119,3,52,26,0,119,120,5,17,0,0,120,121,5,
		18,0,0,121,13,1,0,0,0,122,123,3,16,8,0,123,124,3,18,9,0,124,127,1,0,0,
		0,125,127,1,0,0,0,126,122,1,0,0,0,126,125,1,0,0,0,127,15,1,0,0,0,128,129,
		5,30,0,0,129,130,5,19,0,0,130,131,3,20,10,0,131,17,1,0,0,0,132,133,5,20,
		0,0,133,134,3,16,8,0,134,135,3,18,9,0,135,138,1,0,0,0,136,138,1,0,0,0,
		137,132,1,0,0,0,137,136,1,0,0,0,138,19,1,0,0,0,139,140,7,0,0,0,140,21,
		1,0,0,0,141,142,3,30,15,0,142,143,3,24,12,0,143,23,1,0,0,0,144,145,7,1,
		0,0,145,146,3,30,15,0,146,147,6,12,-1,0,147,148,3,24,12,0,148,151,1,0,
		0,0,149,151,1,0,0,0,150,144,1,0,0,0,150,149,1,0,0,0,151,25,1,0,0,0,152,
		159,3,22,11,0,153,154,3,22,11,0,154,155,3,28,14,0,155,156,3,22,11,0,156,
		157,6,13,-1,0,157,159,1,0,0,0,158,152,1,0,0,0,158,153,1,0,0,0,159,27,1,
		0,0,0,160,161,7,2,0,0,161,29,1,0,0,0,162,163,3,34,17,0,163,164,3,32,16,
		0,164,31,1,0,0,0,165,166,7,3,0,0,166,167,3,34,17,0,167,168,6,16,-1,0,168,
		169,3,32,16,0,169,172,1,0,0,0,170,172,1,0,0,0,171,165,1,0,0,0,171,170,
		1,0,0,0,172,33,1,0,0,0,173,179,3,36,18,0,174,175,5,2,0,0,175,179,6,17,
		-1,0,176,177,5,30,0,0,177,179,6,17,-1,0,178,173,1,0,0,0,178,174,1,0,0,
		0,178,176,1,0,0,0,179,35,1,0,0,0,180,181,5,14,0,0,181,182,3,26,13,0,182,
		183,5,15,0,0,183,184,6,18,-1,0,184,37,1,0,0,0,185,189,5,22,0,0,186,189,
		5,23,0,0,187,189,1,0,0,0,188,185,1,0,0,0,188,186,1,0,0,0,188,187,1,0,0,
		0,189,39,1,0,0,0,190,191,7,4,0,0,191,41,1,0,0,0,192,198,3,44,22,0,193,
		198,3,46,23,0,194,198,3,50,25,0,195,198,3,62,31,0,196,198,3,56,28,0,197,
		192,1,0,0,0,197,193,1,0,0,0,197,194,1,0,0,0,197,195,1,0,0,0,197,196,1,
		0,0,0,198,43,1,0,0,0,199,200,5,30,0,0,200,201,5,21,0,0,201,202,3,26,13,
		0,202,203,5,18,0,0,203,204,6,22,-1,0,204,45,1,0,0,0,205,206,5,1,0,0,206,
		207,5,14,0,0,207,208,3,26,13,0,208,209,5,15,0,0,209,210,6,23,-1,0,210,
		211,3,52,26,0,211,212,6,23,-1,0,212,213,3,48,24,0,213,47,1,0,0,0,214,215,
		5,11,0,0,215,216,3,52,26,0,216,217,6,24,-1,0,217,220,1,0,0,0,218,220,1,
		0,0,0,219,214,1,0,0,0,219,218,1,0,0,0,220,49,1,0,0,0,221,222,5,8,0,0,222,
		223,5,14,0,0,223,224,3,26,13,0,224,225,5,15,0,0,225,226,5,9,0,0,226,227,
		3,52,26,0,227,228,5,18,0,0,228,51,1,0,0,0,229,230,5,16,0,0,230,231,3,54,
		27,0,231,232,5,17,0,0,232,53,1,0,0,0,233,234,3,42,21,0,234,235,3,54,27,
		0,235,238,1,0,0,0,236,238,1,0,0,0,237,233,1,0,0,0,237,236,1,0,0,0,238,
		55,1,0,0,0,239,240,5,10,0,0,240,241,5,14,0,0,241,242,3,58,29,0,242,243,
		5,15,0,0,243,244,5,18,0,0,244,57,1,0,0,0,245,246,3,26,13,0,246,247,3,60,
		30,0,247,251,1,0,0,0,248,249,5,33,0,0,249,251,3,60,30,0,250,245,1,0,0,
		0,250,248,1,0,0,0,251,59,1,0,0,0,252,253,5,20,0,0,253,256,3,58,29,0,254,
		256,1,0,0,0,255,252,1,0,0,0,255,254,1,0,0,0,256,61,1,0,0,0,257,258,5,30,
		0,0,258,259,5,14,0,0,259,260,3,64,32,0,260,261,5,15,0,0,261,262,5,18,0,
		0,262,63,1,0,0,0,263,264,3,26,13,0,264,265,3,66,33,0,265,268,1,0,0,0,266,
		268,1,0,0,0,267,263,1,0,0,0,267,266,1,0,0,0,268,65,1,0,0,0,269,270,5,20,
		0,0,270,271,3,26,13,0,271,272,3,66,33,0,272,275,1,0,0,0,273,275,1,0,0,
		0,274,269,1,0,0,0,274,273,1,0,0,0,275,67,1,0,0,0,18,80,90,103,109,126,
		137,150,158,171,178,188,197,219,237,250,255,267,274
	]

	public
	static let _ATN = try! ATNDeserializer().deserialize(_serializedATN)
}