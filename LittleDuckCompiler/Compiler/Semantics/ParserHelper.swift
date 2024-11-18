//
//  ParserHelper.swift
//  LittleDuckCompiler
//
//  Created by Aleksandr Morozov on 17/11/24.
//

import Foundation

// Singleton to manage parser-related semantic actions
class ParserHelper {
    static let shared = ParserHelper()

    // Stacks for operands, operators, and types
    private(set) var operandStack: [String] = []
    private(set) var operatorStack: [String] = []
    private var tempCounter: Int = 0

    private init() {}

    // Reset helper (useful for testing)
    func reset() {
        operandStack = []
        operatorStack = []
        tempCounter = 0
    }

    // Generate a unique temporary variable
    func generateTemp() -> String {
        tempCounter += 1
        return "T\(tempCounter)"
    }

    func pushOperand(_ operand: String) {
        operandStack.append(operand)
        print("Pushed operand: \(operand), Operand Stack: \(operandStack)")
    }
    
    func popOperand() -> String? {
        let operand = operandStack.popLast()
        print("Popped operand: \(operand ?? "nil"), Operand Stack: \(operandStack)")
        return operand
    }

    func pushOperator(_ operator: String) {
        guard ["+", "-", "*", "/"].contains(`operator`) else {
            fatalError("Invalid operator pushed: \(`operator`)")
        }
        operatorStack.append(`operator`)
        print("Pushed operator: \(`operator`), Operator Stack: \(operatorStack)")
    }

    func popAndGenerateQuadruple() -> String {
        print("Before generating quadruple: Operand Stack: \(operandStack), Operator Stack: \(operatorStack)")

        // Check for stack underflow
        guard !operatorStack.isEmpty, operandStack.count >= 2 else {
            fatalError("Stack underflow: Operator Stack: \(operatorStack), Operand Stack: \(operandStack)")
        }

        // Pop the operator and operands
        guard let `operator` = operatorStack.popLast(),
              let operand2 = operandStack.popLast(),
              let operand1 = operandStack.popLast() else {
            fatalError("Stack underflow while generating quadruple")
        }

        // Generate a temporary variable for the result
        let temp = generateTemp()
        QuadrupleGenerator.shared.addQuadruple(op: `operator`, operand1: operand1, operand2: operand2, result: temp)

        // Push the result back onto the operand stack
        pushOperand(temp)
        print("Generated quadruple: (\(`operator`), \(operand1), \(operand2), \(temp))")
        return temp
    }
    
    func clearStacks() {
        operandStack.removeAll()
        operatorStack.removeAll()
        print("Cleared operand and operator stacks")
    }
}
