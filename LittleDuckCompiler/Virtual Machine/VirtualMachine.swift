//
//  VirtualMachine.swift
//  LittleDuckCompiler
//
//  Created by Aleksandr Morozov on 20/11/24.
//

import Foundation


class VirtualMachine {
    var memory: [String: Any] = [:]   // Stores variables and temporary values
    var ip: Int = 0                  // Instruction Pointer
    var quadruples: [Quadruple] = [] // Quadruples to execute

    init(quadruples: [Quadruple]) {
        self.quadruples = quadruples
    }
    
    
    func resolveOperand(_ operand: String) -> Any {
        if let value = memory[operand] {
            print("Resolved \(operand) to \(value) from memory")
            return value
        }
        
        if let intValue = Int(operand) {
            print("Resolved \(operand) to constant \(intValue)")
            return intValue
        } else if let doubleValue = Double(operand) {
            print("Resolved \(operand) to constant \(doubleValue)")
            return doubleValue
        }
        
        fatalError("Undefined operand: \(operand)")
    }

    // Helper to read/write memory
    func getValue(for key: String) -> Any? {
        return memory[key]
    }

    func setValue(for key: String, value: Any) {
        memory[key] = value
        print("Memory Update: \(key) = \(value)")
    }
    
    func execute() {
        while ip < quadruples.count {
            let quad = quadruples[ip]
            print("Executing Quadruple: \(quad)")

            switch quad.op {
            case "=":
                handleAssignment(quad)
            case "+":
                handleArithmetic(quad, operation: +)
            case "-":
                handleArithmetic(quad, operation: -)
            case "*":
                handleArithmetic(quad, operation: *)
            case "/":
                handleArithmetic(quad, operation: /)
            case "<", ">", "==", "!=":
                handleComparison(quad)
            case "Goto":
                handleGoto(quad)
            case "GotoF":
                handleGotoF(quad)
            default:
                fatalError("Unknown operation: \(quad.op)")
            }

            // Increment IP unless modified by control flow
            ip += 1
        }
    }
}

extension VirtualMachine {
    
    func handleAssignment(_ quad: Quadruple) {
        let value = resolveOperand(quad.operand1)
        setValue(for: quad.result, value: value)
    }
    
    func handleArithmetic(_ quad: Quadruple, operation: (Double, Double) -> Double) {
        // Resolve operands and convert them to Double
        let leftResolved = resolveOperand(quad.operand1)
        let rightResolved = resolveOperand(quad.operand2)

        guard let left = (leftResolved as? Double) ?? (leftResolved as? Int).map(Double.init),
              let right = (rightResolved as? Double) ?? (rightResolved as? Int).map(Double.init) else {
            fatalError("Operands are not numeric: \(leftResolved), \(rightResolved)")
        }

        // Perform the arithmetic operation
        let result = operation(left, right)

        // Store the result
        setValue(for: quad.result, value: result)
    }
    
    func handleComparison(_ quad: Quadruple) {
        let leftResolved = resolveOperand(quad.operand1)
        let rightResolved = resolveOperand(quad.operand2)
        
        // Debug log
        print("Left Operand: \(leftResolved), Right Operand: \(rightResolved)")
        
        // Convert operands to Double
        guard let left = (leftResolved as? Double) ?? (leftResolved as? Int).map(Double.init),
              let right = (rightResolved as? Double) ?? (rightResolved as? Int).map(Double.init) else {
            fatalError("Operands are not numbers: \(leftResolved), \(rightResolved)")
        }

        let result: Bool
        switch quad.op {
        case "<": result = left < right
        case ">": result = left > right
        case "==": result = left == right
        case "!=": result = left != right
        default: fatalError("Invalid comparison operator: \(quad.op)")
        }

        setValue(for: quad.result, value: result)
    }
    
    func handleGoto(_ quad: Quadruple) {
        guard let target = Int(quad.result) else {
            fatalError("Invalid Goto target: \(quad.result)")
        }
        ip = target - 1 // Subtract 1 since the loop increments IP
    }

    func handleGotoF(_ quad: Quadruple) {
        guard let condition = getValue(for: quad.operand1) as? Bool else {
            fatalError("Invalid condition for GotoF: \(quad.operand1)")
        }
        print("GotoF condition: \(condition), Target: \(quad.result)")

        if !condition {
            guard let target = Int(quad.result) else {
                fatalError("Invalid GotoF target: \(quad.result)")
            }
            print("Jumping to instruction \(target)")
            ip = target - 1
        } else {
            print("Continuing to next instruction")
        }
    }
    
    
}


