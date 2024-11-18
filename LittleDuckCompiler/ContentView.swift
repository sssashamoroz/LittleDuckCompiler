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
    }
    end
    """
    @State private var parseTreeOutput: String = "" // For displaying the Parse Tree
    @State private var quadrupleOutput: String = "" // For displaying the Quadruples
    @State private var rootNode: PTNode? = nil

    var body: some View {
        VStack {
            Text("LittleDuck Compiler")
                .font(.title)
                .padding()

            TextEditor(text: $sourceCode)
                .border(Color.gray, width: 1)
                .padding()
                .frame(height: 150)

            Button(action: {
                do {
                    // Clear previous outputs
                    self.parseTreeOutput = ""
                    self.quadrupleOutput = ""

                    // Parse the source code
                    let (parseTree, _, quadruples) = try parseCode(sourceCode)

                    // Update the Parse Tree output
                    self.parseTreeOutput = parseTree

                    // Update the Quadruples output
                    for quad in quadruples {
                        self.quadrupleOutput += "(\(quad.op), \(quad.operand1), \(quad.operand2), \(quad.result))\n"
                    }
                } catch CompilerError.missingValueForAssignment(let variable) {
                    self.parseTreeOutput = "Error: Missing value for assignment to '\(variable)'."
                } catch CompilerError.stackUnderflow {
                    self.parseTreeOutput = "Error: Stack underflow encountered."
                } catch CompilerError.undefinedBehavior(let message) {
                    self.parseTreeOutput = "Error: \(message)"
                } catch {
                    self.parseTreeOutput = "Unexpected error: \(error)"
                }
            }) {
                Text("Parse Code")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            
            

            ScrollView {
                Text(quadrupleOutput)
                    .padding()
                    .border(Color.gray, width: 1)
                    .frame(maxWidth: .infinity)
            }

        }
        .padding()
    }
}

#Preview {
    ContentView()
}

// Updated parseCode function to return both the text output and root PTNode
func parseCode(_ input: String) -> (String, PTNode?, [Quadruple]) {
    do {
        let inputStream = ANTLRInputStream(input)
        let lexer = LittleDuckLexer(inputStream)
        let tokenStream = CommonTokenStream(lexer)
        let parser = try LittleDuckParser(tokenStream)
        let parseTree = try parser.program()

        // Retrieve quadruples from QuadrupleGenerator
        let quadruples = QuadrupleGenerator.shared.getQuadruples()

        // Root PTNode for graphical parse tree view
        let rootNode = PTNode(node: parseTree)

        return (parseTree.toStringTree(parser), rootNode, quadruples)
    } catch {
        return ("Error parsing input: \(error)", nil, [])
    }
}
