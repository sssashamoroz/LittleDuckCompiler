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
    program test;
    begin
    {
        a = (20 + 10) * (20 - 10) / 2;
    }
    end
    """
    @State private var parseTreeOutput: String = ""
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
                    // Parse the source code
                    let (_, _, quadruples) = try parseCode(sourceCode)

                    // Display the quadruples only
                    self.parseTreeOutput = ""
                    for quad in quadruples {
                        self.parseTreeOutput += "(\(quad.op), \(quad.operand1), \(quad.operand2), \(quad.result))\n"
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
                Text(parseTreeOutput)
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
