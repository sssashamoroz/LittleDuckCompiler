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
    
    var callStack: [(memory: [String: Any], returnAddress: Int)] = [] // Activation Records Stack

    init(quadruples: [Quadruple]) {
        self.quadruples = quadruples
    }
    
    
    func resolveOperand(_ operand: String) -> Any {
        // Check the current function's local memory
        if let currentRecord = callStack.last, let localValue = currentRecord.memory[operand] {
            print("Resolved \(operand) to \(localValue) from local memory")
            return localValue
        }
        
        // Check global memory if not found in local memory
        if let globalValue = memory[operand] {
            print("Resolved \(operand) to \(globalValue) from global memory")
            return globalValue
        }
        
        // Handle constants
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
        // Check if we're in a function and update local memory
        if let currentRecordIndex = callStack.indices.last {
            callStack[currentRecordIndex].memory[key] = value
            print("Local Memory Update: \(key) = \(value)")
            return
        }

        // Otherwise, update global memory
        memory[key] = value
        print("Global Memory Update: \(key) = \(value)")
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
    
    
    
    //FUNCTIONS
    
    func handleERA(_ quad: Quadruple) {
        // Push a new activation record (empty local memory for now)
        callStack.append((memory: [:], returnAddress: -1)) // Temporary returnAddress
        print("Activation record created for function \(quad.operand1)")
    }
    
    func handlePARAM(_ quad: Quadruple) {
        guard let currentRecord = callStack.last else {
            fatalError("No active function record for PARAM")
        }
        
        // Resolve the value of the parameter
        let value = resolveOperand(quad.operand1)
        
        // Add the parameter to the function's local memory
        let paramName = quad.result // Typically `param1`, `param2`, etc.
        callStack[callStack.count - 1].memory[paramName] = value
        print("Parameter \(paramName) set to \(value)")
    }
    
    func handleGOSUB(_ quad: Quadruple) {
        guard let currentRecordIndex = callStack.indices.last else {
            fatalError("No active function record for GOSUB")
        }
        
        // Save the return address (next instruction after GOSUB)
        callStack[currentRecordIndex].returnAddress = ip + 1

        // Jump to the function's starting quadruple
        guard let target = Int(quad.result) else {
            fatalError("Invalid GOSUB target: \(quad.result)")
        }
        ip = target - 1 // Adjust for increment after execution
        print("Jumping to function \(quad.operand1) at quadruple \(target)")
    }
    
    func handleENDFunc(_ quad: Quadruple) {
        guard let record = callStack.popLast() else {
            fatalError("ENDFunc called with no active function record")
        }

        // Restore the instruction pointer to the return address
        ip = record.returnAddress - 1 // Adjust for increment after execution
        print("Returning to instruction \(ip + 1) after function")
    }
    
    
}


