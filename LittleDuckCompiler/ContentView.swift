//
//  ContentView.swift
//  LittleDuckCompiler
//
//  Created by Aleksandr Morozov on 30/10/24.
//

import SwiftUI
import Antlr4


struct ContentView: View {
    @State private var sourceCode: String = """
    program prueba;
    vars 
        x, y : int;
        z : float;
    begin
    {
        x = 10;
        y = 5;
        z = (x + y) * (x - y) / 2;
        if (z > 20.0) 
        {
            z = 300;
        }
    }
    end
    """
    @State private var parseTreeOutput: String = "" // For displaying the Parse Tree
    @State private var quadrupleOutput: String = "" // For displaying the Quadruples
    @State private var variableTableOutput: String = "" // For displaying the Variable Table

    var body: some View {
        GeometryReader { geometry in
            HStack(spacing: 20) {
                // Source Code Editor
                VStack {
                    Text("Source Code")
                        .font(.headline)
                        .padding(.bottom, 8)
                    
                    TextEditor(text: $sourceCode)
                        .border(Color.gray, width: 1)
                        .frame(height: geometry.size.height * 0.4)
                    
                    Button(action: {
                        // Parse the source code
                        handleParsing()
                    }) {
                        Text("Parse Code")
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                    .padding(.top, 8)
                }
                .frame(width: geometry.size.width * 0.3)

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
                                .border(Color.gray, width: 1)
                        }
                    }
                    .frame(height: geometry.size.height * 0.45)

                    // Variable Table Section
                    VStack(alignment: .leading) {
                        Text("Variable Table")
                            .font(.headline)
                            .padding(.bottom, 8)
                        
                        ScrollView {
                            Text(variableTableOutput)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding()
                                .border(Color.gray, width: 1)
                        }
                    }
                }
                .frame(width: geometry.size.width * 0.35)
            }
            .padding()
        }
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
}

#Preview {
    ContentView()
}

// Updated parseCode function to return both the parse tree and variable table
func parseCode(_ input: String) -> (String, [Quadruple]) {
    do {
        VariableTable.shared.reset()
        ParserHelper.shared.reset()
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
