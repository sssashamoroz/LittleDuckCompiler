//
//  Errors.swift
//  LittleDuckCompiler
//
//  Created by Aleksandr Morozov on 17/11/24.
//

enum CompilerError: Error {
    case missingValueForAssignment(variable: String)
    case stackUnderflow
    case undefinedBehavior(message: String)
}
