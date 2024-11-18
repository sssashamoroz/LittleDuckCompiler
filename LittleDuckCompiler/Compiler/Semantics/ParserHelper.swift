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
    
    private(set) var typeStack: [String] = [] // For type checking
    private(set) var jumpStack: [Int] = [] // To manage jump targets

    private init() {}

    // Reset method
    func reset() {
        operandStack = []
        operatorStack = []
        typeStack = []
        jumpStack = []
        tempCounter = 0
    }
    
    // Check the Semantic Cube for operation validity
    func validateOperation(operand1Type: String, operand2Type: String, operator: String) throws -> String {
        guard let resultType = SemanticCube.cube[operand1Type]?[operand2Type]?[`operator`] else {
            throw CompilerError.typeMismatch(
                expected: "Valid operation between \(operand1Type) and \(operand2Type)",
                found: `operator`
            )
        }
        return resultType
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
        guard ["+", "-", "*", "/", "<", ">", "!=", "=="].contains(`operator`) else {
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

        // Retrieve types for the operands
        guard let type2 = typeStack.popLast(), let type1 = typeStack.popLast() else {
            fatalError("Type stack underflow while generating quadruple")
        }

        // Validate the operation using the Semantic Cube
        guard let resultType = try? validateOperation(operand1Type: type1, operand2Type: type2, operator: `operator`) else {
            fatalError("Invalid operation: \(`operator`) between \(type1) and \(type2)")
        }

        // Generate a temporary variable for the result
        let temp = generateTemp()
        QuadrupleGenerator.shared.addQuadruple(op: `operator`, operand1: operand1, operand2: operand2, result: temp)

        // Push the result back onto the operand and type stacks
        pushOperand(temp)
        pushType(resultType)

        print("Generated quadruple: (\(`operator`), \(operand1), \(operand2), \(temp))")
        return temp
    }

    func clearStacks() {
        print("Clearing stacks. Operand Stack: \(operandStack), Operator Stack: \(operatorStack)")
        operandStack.removeAll()
        operatorStack.removeAll()
    }
    
    
    func enterIfBlock() {
        print("Entering IF block...")
        // Additional logic for handling nested IFs (if needed)
    }

    func exitIfBlock() {
        print("Exiting IF block...")
        // Additional cleanup if needed
    }
    

    func pushType(_ type: String) {
        typeStack.append(type)
        print("Pushed type: \(type), Type Stack: \(typeStack)")
    }

    func popType() -> String? {
        guard let type = typeStack.popLast() else {
            print("Error: Type stack is empty")
            return nil
        }
        print("Popped type: \(type), Type Stack: \(typeStack)")
        return type
    }

    func pushJump(_ index: Int) {
        jumpStack.append(index)
        print("Pushed jump: \(index), Jump Stack: \(jumpStack)")
    }

    func popJump() -> Int? {
        guard let jump = jumpStack.popLast() else {
            print("Error: Jump stack is empty")
            return nil
        }
        print("Popped jump: \(jump), Jump Stack: \(jumpStack)")
        return jump
    }
    
    func resetTypeStack() {
        print("Resetting Type Stack: \(typeStack)")
        typeStack.removeAll()
    }
}
