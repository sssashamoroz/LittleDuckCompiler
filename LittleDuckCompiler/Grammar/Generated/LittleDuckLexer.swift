// Generated from LittleDuck.g4 by ANTLR 4.13.2
import Antlr4

open class LittleDuckLexer: Lexer {

	internal static var _decisionToDFA: [DFA] = {
          var decisionToDFA = [DFA]()
          let length = LittleDuckLexer._ATN.getNumberOfDecisions()
          for i in 0..<length {
          	    decisionToDFA.append(DFA(LittleDuckLexer._ATN.getDecisionState(i)!, i))
          }
           return decisionToDFA
     }()

	internal static let _sharedContextCache = PredictionContextCache()

	public
	static let CONST=1, PROGRAM=2, BEGIN=3, END=4, VARS=5, VOID=6, WHILE=7, 
            DO=8, PRINT=9, ELSE=10, INT_TYPE=11, FLOAT_TYPE=12, LPAREN=13, 
            RPAREN=14, LBRACE=15, RBRACE=16, SEMICOLON=17, COLON=18, COMMA=19, 
            EQ=20, PLUS=21, MINUS=22, MUL=23, DIV=24, LT=25, GT=26, NEQ=27, 
            EQEQ=28, ID=29, CONST_INT=30, CONST_FLOAT=31, STRING_LITERAL=32, 
            WS=33

	public
	static let channelNames: [String] = [
		"DEFAULT_TOKEN_CHANNEL", "HIDDEN"
	]

	public
	static let modeNames: [String] = [
		"DEFAULT_MODE"
	]

	public
	static let ruleNames: [String] = [
		"CONST", "PROGRAM", "BEGIN", "END", "VARS", "VOID", "WHILE", "DO", "PRINT", 
		"ELSE", "INT_TYPE", "FLOAT_TYPE", "LPAREN", "RPAREN", "LBRACE", "RBRACE", 
		"SEMICOLON", "COLON", "COMMA", "EQ", "PLUS", "MINUS", "MUL", "DIV", "LT", 
		"GT", "NEQ", "EQEQ", "ID", "CONST_INT", "CONST_FLOAT", "STRING_LITERAL", 
		"WS"
	]

	private static let _LITERAL_NAMES: [String?] = [
		nil, nil, "'program'", "'begin'", "'end'", "'vars'", "'void'", "'while'", 
		"'do'", "'print'", "'else'", "'int'", "'float'", "'('", "')'", "'{'", 
		"'}'", "';'", "':'", "','", "'='", "'+'", "'-'", "'*'", "'/'", "'<'", 
		"'>'", "'!='", "'=='"
	]
	private static let _SYMBOLIC_NAMES: [String?] = [
		nil, "CONST", "PROGRAM", "BEGIN", "END", "VARS", "VOID", "WHILE", "DO", 
		"PRINT", "ELSE", "INT_TYPE", "FLOAT_TYPE", "LPAREN", "RPAREN", "LBRACE", 
		"RBRACE", "SEMICOLON", "COLON", "COMMA", "EQ", "PLUS", "MINUS", "MUL", 
		"DIV", "LT", "GT", "NEQ", "EQEQ", "ID", "CONST_INT", "CONST_FLOAT", "STRING_LITERAL", 
		"WS"
	]
	public
	static let VOCABULARY = Vocabulary(_LITERAL_NAMES, _SYMBOLIC_NAMES)


	override open
	func getVocabulary() -> Vocabulary {
		return LittleDuckLexer.VOCABULARY
	}

	public
	required init(_ input: CharStream) {
	    RuntimeMetaData.checkVersion("4.13.2", RuntimeMetaData.VERSION)
		super.init(input)
		_interp = LexerATNSimulator(self, LittleDuckLexer._ATN, LittleDuckLexer._decisionToDFA, LittleDuckLexer._sharedContextCache)
	}

	override open
	func getGrammarFileName() -> String { return "LittleDuck.g4" }

	override open
	func getRuleNames() -> [String] { return LittleDuckLexer.ruleNames }

	override open
	func getSerializedATN() -> [Int] { return LittleDuckLexer._serializedATN }

	override open
	func getChannelNames() -> [String] { return LittleDuckLexer.channelNames }

	override open
	func getModeNames() -> [String] { return LittleDuckLexer.modeNames }

	override open
	func getATN() -> ATN { return LittleDuckLexer._ATN }

	static let _serializedATN:[Int] = [
		4,0,33,202,6,-1,2,0,7,0,2,1,7,1,2,2,7,2,2,3,7,3,2,4,7,4,2,5,7,5,2,6,7,
		6,2,7,7,7,2,8,7,8,2,9,7,9,2,10,7,10,2,11,7,11,2,12,7,12,2,13,7,13,2,14,
		7,14,2,15,7,15,2,16,7,16,2,17,7,17,2,18,7,18,2,19,7,19,2,20,7,20,2,21,
		7,21,2,22,7,22,2,23,7,23,2,24,7,24,2,25,7,25,2,26,7,26,2,27,7,27,2,28,
		7,28,2,29,7,29,2,30,7,30,2,31,7,31,2,32,7,32,1,0,1,0,3,0,70,8,0,1,1,1,
		1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,1,2,1,2,1,2,1,2,1,2,1,3,1,3,1,3,1,3,1,4,
		1,4,1,4,1,4,1,4,1,5,1,5,1,5,1,5,1,5,1,6,1,6,1,6,1,6,1,6,1,6,1,7,1,7,1,
		7,1,8,1,8,1,8,1,8,1,8,1,8,1,9,1,9,1,9,1,9,1,9,1,10,1,10,1,10,1,10,1,11,
		1,11,1,11,1,11,1,11,1,11,1,12,1,12,1,13,1,13,1,14,1,14,1,15,1,15,1,16,
		1,16,1,17,1,17,1,18,1,18,1,19,1,19,1,20,1,20,1,21,1,21,1,22,1,22,1,23,
		1,23,1,24,1,24,1,25,1,25,1,26,1,26,1,26,1,27,1,27,1,27,1,28,1,28,5,28,
		166,8,28,10,28,12,28,169,9,28,1,29,4,29,172,8,29,11,29,12,29,173,1,30,
		4,30,177,8,30,11,30,12,30,178,1,30,1,30,4,30,183,8,30,11,30,12,30,184,
		1,31,1,31,5,31,189,8,31,10,31,12,31,192,9,31,1,31,1,31,1,32,4,32,197,8,
		32,11,32,12,32,198,1,32,1,32,0,0,33,1,1,3,2,5,3,7,4,9,5,11,6,13,7,15,8,
		17,9,19,10,21,11,23,12,25,13,27,14,29,15,31,16,33,17,35,18,37,19,39,20,
		41,21,43,22,45,23,47,24,49,25,51,26,53,27,55,28,57,29,59,30,61,31,63,32,
		65,33,1,0,5,3,0,65,90,95,95,97,122,4,0,48,57,65,90,95,95,97,122,1,0,48,
		57,1,0,34,34,3,0,9,10,13,13,32,32,208,0,1,1,0,0,0,0,3,1,0,0,0,0,5,1,0,
		0,0,0,7,1,0,0,0,0,9,1,0,0,0,0,11,1,0,0,0,0,13,1,0,0,0,0,15,1,0,0,0,0,17,
		1,0,0,0,0,19,1,0,0,0,0,21,1,0,0,0,0,23,1,0,0,0,0,25,1,0,0,0,0,27,1,0,0,
		0,0,29,1,0,0,0,0,31,1,0,0,0,0,33,1,0,0,0,0,35,1,0,0,0,0,37,1,0,0,0,0,39,
		1,0,0,0,0,41,1,0,0,0,0,43,1,0,0,0,0,45,1,0,0,0,0,47,1,0,0,0,0,49,1,0,0,
		0,0,51,1,0,0,0,0,53,1,0,0,0,0,55,1,0,0,0,0,57,1,0,0,0,0,59,1,0,0,0,0,61,
		1,0,0,0,0,63,1,0,0,0,0,65,1,0,0,0,1,69,1,0,0,0,3,71,1,0,0,0,5,79,1,0,0,
		0,7,85,1,0,0,0,9,89,1,0,0,0,11,94,1,0,0,0,13,99,1,0,0,0,15,105,1,0,0,0,
		17,108,1,0,0,0,19,114,1,0,0,0,21,119,1,0,0,0,23,123,1,0,0,0,25,129,1,0,
		0,0,27,131,1,0,0,0,29,133,1,0,0,0,31,135,1,0,0,0,33,137,1,0,0,0,35,139,
		1,0,0,0,37,141,1,0,0,0,39,143,1,0,0,0,41,145,1,0,0,0,43,147,1,0,0,0,45,
		149,1,0,0,0,47,151,1,0,0,0,49,153,1,0,0,0,51,155,1,0,0,0,53,157,1,0,0,
		0,55,160,1,0,0,0,57,163,1,0,0,0,59,171,1,0,0,0,61,176,1,0,0,0,63,186,1,
		0,0,0,65,196,1,0,0,0,67,70,3,59,29,0,68,70,3,61,30,0,69,67,1,0,0,0,69,
		68,1,0,0,0,70,2,1,0,0,0,71,72,5,112,0,0,72,73,5,114,0,0,73,74,5,111,0,
		0,74,75,5,103,0,0,75,76,5,114,0,0,76,77,5,97,0,0,77,78,5,109,0,0,78,4,
		1,0,0,0,79,80,5,98,0,0,80,81,5,101,0,0,81,82,5,103,0,0,82,83,5,105,0,0,
		83,84,5,110,0,0,84,6,1,0,0,0,85,86,5,101,0,0,86,87,5,110,0,0,87,88,5,100,
		0,0,88,8,1,0,0,0,89,90,5,118,0,0,90,91,5,97,0,0,91,92,5,114,0,0,92,93,
		5,115,0,0,93,10,1,0,0,0,94,95,5,118,0,0,95,96,5,111,0,0,96,97,5,105,0,
		0,97,98,5,100,0,0,98,12,1,0,0,0,99,100,5,119,0,0,100,101,5,104,0,0,101,
		102,5,105,0,0,102,103,5,108,0,0,103,104,5,101,0,0,104,14,1,0,0,0,105,106,
		5,100,0,0,106,107,5,111,0,0,107,16,1,0,0,0,108,109,5,112,0,0,109,110,5,
		114,0,0,110,111,5,105,0,0,111,112,5,110,0,0,112,113,5,116,0,0,113,18,1,
		0,0,0,114,115,5,101,0,0,115,116,5,108,0,0,116,117,5,115,0,0,117,118,5,
		101,0,0,118,20,1,0,0,0,119,120,5,105,0,0,120,121,5,110,0,0,121,122,5,116,
		0,0,122,22,1,0,0,0,123,124,5,102,0,0,124,125,5,108,0,0,125,126,5,111,0,
		0,126,127,5,97,0,0,127,128,5,116,0,0,128,24,1,0,0,0,129,130,5,40,0,0,130,
		26,1,0,0,0,131,132,5,41,0,0,132,28,1,0,0,0,133,134,5,123,0,0,134,30,1,
		0,0,0,135,136,5,125,0,0,136,32,1,0,0,0,137,138,5,59,0,0,138,34,1,0,0,0,
		139,140,5,58,0,0,140,36,1,0,0,0,141,142,5,44,0,0,142,38,1,0,0,0,143,144,
		5,61,0,0,144,40,1,0,0,0,145,146,5,43,0,0,146,42,1,0,0,0,147,148,5,45,0,
		0,148,44,1,0,0,0,149,150,5,42,0,0,150,46,1,0,0,0,151,152,5,47,0,0,152,
		48,1,0,0,0,153,154,5,60,0,0,154,50,1,0,0,0,155,156,5,62,0,0,156,52,1,0,
		0,0,157,158,5,33,0,0,158,159,5,61,0,0,159,54,1,0,0,0,160,161,5,61,0,0,
		161,162,5,61,0,0,162,56,1,0,0,0,163,167,7,0,0,0,164,166,7,1,0,0,165,164,
		1,0,0,0,166,169,1,0,0,0,167,165,1,0,0,0,167,168,1,0,0,0,168,58,1,0,0,0,
		169,167,1,0,0,0,170,172,7,2,0,0,171,170,1,0,0,0,172,173,1,0,0,0,173,171,
		1,0,0,0,173,174,1,0,0,0,174,60,1,0,0,0,175,177,7,2,0,0,176,175,1,0,0,0,
		177,178,1,0,0,0,178,176,1,0,0,0,178,179,1,0,0,0,179,180,1,0,0,0,180,182,
		5,46,0,0,181,183,7,2,0,0,182,181,1,0,0,0,183,184,1,0,0,0,184,182,1,0,0,
		0,184,185,1,0,0,0,185,62,1,0,0,0,186,190,5,34,0,0,187,189,8,3,0,0,188,
		187,1,0,0,0,189,192,1,0,0,0,190,188,1,0,0,0,190,191,1,0,0,0,191,193,1,
		0,0,0,192,190,1,0,0,0,193,194,5,34,0,0,194,64,1,0,0,0,195,197,7,4,0,0,
		196,195,1,0,0,0,197,198,1,0,0,0,198,196,1,0,0,0,198,199,1,0,0,0,199,200,
		1,0,0,0,200,201,6,32,0,0,201,66,1,0,0,0,8,0,69,167,173,178,184,190,198,
		1,6,0,0
	]

	public
	static let _ATN: ATN = try! ATNDeserializer().deserialize(_serializedATN)
}