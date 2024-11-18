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

    private init() {} // Private init ensures singleton pattern

    func addQuadruple(op: String, operand1: String, operand2: String, result: String) {
        let quad = Quadruple(op: op, operand1: operand1, operand2: operand2, result: result)
        quadruples.append(quad)
    }

    func getQuadruples() -> [Quadruple] {
        return quadruples
    }

    func printQuadruples() {
        for (index, quad) in quadruples.enumerated() {
            print("\(index): (\(quad.op), \(quad.operand1), \(quad.operand2), \(quad.result))")
        }
    }
}
