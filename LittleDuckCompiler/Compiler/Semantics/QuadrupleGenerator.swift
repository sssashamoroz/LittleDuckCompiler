//
//  QuadrupleGenerator.swift
//  LittleDuckCompiler
//
//  Created by Aleksandr Morozov on 10/11/24.
//

import Foundation

struct Quadruple {
    var op: String
    var operand1: String
    var operand2: String
    var result: String
}

class QuadrupleGenerator {
    static let shared = QuadrupleGenerator()
    private var quadruples: [Quadruple] = []
    
    private init() {}
    
    func reset() {
        quadruples.removeAll()
        print("🧹 Quadruples cleared.")
    }
    
    func addPlaceholderJump(condition: String) -> Int {
        return addQuadruple(op: "GotoF", operand1: condition, operand2: "_", result: "_") // Provide empty operand2
    }
    
    func addUnconditionalJump() -> Int {
        return addQuadruple(op: "Goto", operand1: "_", operand2: "_", result: "_") // Provide empty operand2
    }
    
    func getQuadruples() -> [Quadruple] {
        return quadruples
    }
    
    var currentQuadrupleIndex: Int {
        return quadruples.count
    }
    
    func addQuadruple(op: String, operand1: String, operand2: String, result: String) -> Int {
        let quad = Quadruple(op: op, operand1: operand1, operand2: operand2, result: result)
        quadruples.append(quad)
        print("Quadruple Added: (\(quad.op), \(quad.operand1), \(quad.operand2), \(quad.result))")
        return quadruples.count - 1 // Return the index
    }
    
    func fillJumpTarget(_ index: Int, with target: Int) {
        guard index < quadruples.count else {
            fatalError("Invalid jump index \(index) for backpatching")
        }
        quadruples[index].result = "\(target)"
        print("Backpatched quadruple at index \(index) with target \(target)")
    }
    
}
