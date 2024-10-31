//
//  SemanticCube.swift
//  LittleDuckCompiler
//
//  Created by Aleksandr Morozov on 30/10/24.
//

/* MARK: - Semantic Cube
 The Semantic Cube is a data structure that defines valid operations
 between different types and the resulting type of each operation.
 This helps in type checking and validating operations at the semantic level.

 Usage: During parsing, when an operation is encountered (e.g., "+"),
 check the operand types using the semantic cube to validate the operation
 and determine the resulting type.

 Example:
 let resultType = semanticCube["int"]?["float"]?["+"]
 */


// MARK: - Implementation

// SemanticCube
/// This struct contains a static property representing the semantic cube data, defining valid operations between types and their resulting types.
struct SemanticCube {
    
    static let cube: [String: [String: [String: String]]] = [
        "int": [
            "int": [
                "+": "int",
                "-": "int",
                "*": "int",
                "/": "int",
                "<": "boolean",
                ">": "boolean",
                "==": "boolean",
                "!=": "boolean"
            ],
            "float": [
                "+": "float",
                "-": "float",
                "*": "float",
                "/": "float",
                "<": "boolean",
                ">": "boolean",
                "==": "boolean",
                "!=": "boolean"
            ]
        ],
        
        "float": [
            "int": [
                "+": "float",
                "-": "float",
                "*": "float",
                "/": "float",
                "<": "boolean",
                ">": "boolean",
                "==": "boolean",
                "!=": "boolean"
            ],
            "float": [
                "+": "float",
                "-": "float",
                "*": "float",
                "/": "float",
                "<": "boolean",
                ">": "boolean",
                "==": "boolean",
                "!=": "boolean"
            ]
        ]
    ]
}
