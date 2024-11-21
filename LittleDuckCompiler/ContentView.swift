//
//  ContentView.swift
//  LittleDuckCompiler
//
//  Created by Aleksandr Morozov on 30/10/24.
//

import SwiftUI
import Antlr4
import CodeEditorView
import LanguageSupport


struct ContentView: View {
    
    @State private var text:     String                    = "My awesome code..."
    @State private var position: CodeEditor.Position       = CodeEditor.Position()
    @State private var messages: Set<TextLocated<Message>> = Set()

    @Environment(\.colorScheme) private var colorScheme: ColorScheme
    
    
    @State private var sourceCode: String = """
    program testFunctions;
    vars
        x : int;
        y : int;

    begin
    {
        x = 0;
        y = 5;
        
        while ( x < y ) do 
        {
            x = x + 1;
        }
    
    }
    end
    """
    
    @State private var parseTreeOutput: String = "" // For displaying the Parse Tree
    @State private var quadrupleOutput: String = "" // For displaying the Quadruples
    @State private var variableTableOutput: String = "" // For displaying the Variable
    
    @State private var executionOutput: String = "" // For displaying VM execution results
    
    @State private var memory: [String: Any] = [:] // Memory state for display
    
    
    var body: some View {
    
        
        VStack{
            
            ZStack{
                
                CodeEditor(text: $sourceCode, position: $position, messages: $messages, language: .none)
                      .environment(\.codeEditorTheme,
                                   colorScheme == .dark ? Theme.defaultDark : Theme.defaultLight)
                      .border(Color.gray, width: 1)
                
                HStack{
                    
                    Spacer()
                    VStack{
                        
                        Spacer()
                        
                        Button(action: {
                            // Parse the source code
                            handleParsing()
                        }) {
                            Text("Parse Code")
                                .frame(width: 130, height: 50)
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(8)
                        }
                        .padding(.top, 8)
                        
                        Button(action: {
                            // Execute the parsed quadruples
                            handleExecution()
                        }) {
                            Text("Run Code")
                                .frame(width: 130, height: 50)
                                .background(Color.green)
                                .foregroundColor(.white)
                                .cornerRadius(8)
                        }
                        .padding(.top, 8)
                    }
                }

                
            }
            


            
            HStack(alignment: .top, spacing: 20) {
            
                
                // Outputs: Quadruples & Variable Table
                VStack(spacing: 20) {
                    // Quadruples Section
                    VStack(alignment: .leading) {
                        Text("Generated Quadruples")
                            .font(.headline)
                            .padding(.bottom, 8)
                        
                        ScrollView {
                            Text(quadrupleOutput)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding()
                        }
                        .border(Color.gray, width: 1)
                    }
                    
                    // Variable Table Section
                    VStack(alignment: .leading) {
                        Text("Variable Table")
                            .font(.headline)
                            .padding(.bottom, 8)
                        
                        ScrollView {
                            Text(variableTableOutput)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding()
                        }
                        .border(Color.gray, width: 1)
                        
                    }
                    .frame(height: 100)
                    
                }
                
                VStack(alignment: .leading) {
                    Text("Execution Output")
                        .font(.headline)
                        .padding(.bottom, 8)
                    
                    ScrollView {
                        VStack(alignment: .leading) {
                            HStack {
                                Text("Variable")
                                    .fontWeight(.bold)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                Text("Value")
                                    .fontWeight(.bold)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                            .padding(.bottom, 8)
                            
                            ForEach(memory.sorted(by: { $0.key < $1.key }), id: \.key) { key, value in
                                HStack {
                                    Text(key)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                    Text("\(value)")
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                }
                            }
                        }
                        .padding()
                    }
                    .border(Color.gray, width: 1)
                }
                
            }
            
        }
        .padding()

    }
    
    /// Generates line numbers based on the number of lines in the source code
    private func lineNumbers() -> [Int] {
        let lineCount = sourceCode.components(separatedBy: "\n").count
        return Array(1...lineCount)
    }
    
    /// Handle parsing the source code, updating all relevant outputs
    private func handleParsing() {
        do {
            // Clear previous outputs
            self.parseTreeOutput = ""
            self.quadrupleOutput = ""
            self.variableTableOutput = ""
            
            // Parse the source code
            let (parseTree, quadruples) = try parseCode(sourceCode)
            
            // Update the parse tree
            self.parseTreeOutput = parseTree
            
            // Update the quadruples output
            quadruples.forEach { quad in
                self.quadrupleOutput += "(\(quad.op), \(quad.operand1), \(quad.operand2), \(quad.result))\n"
            }
            
            // Update the variable table output
            self.variableTableOutput = VariableTable.shared.description
            
        } catch CompilerError.missingValueForAssignment(let variable) {
            self.quadrupleOutput = "Error: Missing value for assignment to '\(variable)'."
        } catch CompilerError.stackUnderflow {
            self.quadrupleOutput = "Error: Stack underflow encountered."
        } catch CompilerError.undefinedBehavior(let message) {
            self.quadrupleOutput = "Error: \(message)"
        } catch {
            self.quadrupleOutput = "Unexpected error: \(error)"
        }
    }
    
    private func handleExecution() {
        do {
            // Fetch the quadruples from the previous parsing step
            let quadruples = QuadrupleGenerator.shared.getQuadruples()
            
            // Initialize the Virtual Machine
            let vm = VirtualMachine(quadruples: quadruples)
            
            // Clear previous execution output
            self.executionOutput = ""
            
            // Execute the quadruples
            vm.execute()
            
            // Update the memory state for display
            self.memory = vm.memory
            
            // Update the output with VM memory state
            self.executionOutput = "Execution Complete\nMemory State:\n\(vm.memory)"
            
        } catch {
            self.executionOutput = "Error during execution: \(error)"
        }
    }
}

#Preview {
    ContentView()
}

// Updated parseCode function to return both the parse tree and variable table
func parseCode(_ input: String) -> (String, [Quadruple]) {
    do {
        
        ParserHelper.shared.reset()
        VariableTable.shared.reset()
        FunctionDirectory.shared.reset()
        ParameterTable.shared.reset()
        QuadrupleGenerator.shared.reset()
        
        let inputStream = ANTLRInputStream(input)
        let lexer = LittleDuckLexer(inputStream)
        let tokenStream = CommonTokenStream(lexer)
        let parser = try LittleDuckParser(tokenStream)
        let parseTree = try parser.program()
        
        // Retrieve quadruples from QuadrupleGenerator
        let quadruples = QuadrupleGenerator.shared.getQuadruples()
        print("Quadruples Retrieved from Generator: \(quadruples)")
        
        // Root PTNode for graphical parse tree view
        
        return (parseTree.toStringTree(parser), quadruples)
    } catch {
        return ("Error parsing input: \(error)", [])
    }
}
