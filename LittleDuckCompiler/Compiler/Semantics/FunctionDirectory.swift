//
//  VariableTable.swift
//  LittleDuckCompiler
//
//  Created by Aleksandr Morozov on 30/10/24.
//


/* MARK: - FunctionDirectory
 
 This file defines the `FunctionDirectory` component for managing functions and their associated
 metadata within the LittleDuck language. It provides structure for handling function declarations,
 parameter validation, and local variable scope management for each function.
 
 ### FunctionDirectory
 The `FunctionDirectory` is a data structure that manages function definitions, including parameters,
 return types, and a local variable table within each function scope. Each function is represented
 by a `FunctionInfo` struct, which holds information about the function's parameters, return type,
 and a `VariableTable` instance for managing its local variables.
 
 ** Purpose **: `FunctionDirectory` ensures that functions are uniquely defined, checks parameter
 types and return types for validity, and manages each function's local scope through its own
 `VariableTable`. This organization allows the interpreter to validate function calls and prevent
 duplicate or undeclared functions.

 - `FunctionInfo` struct: Represents a single function's metadata, including parameter types,
   return type, and a local `VariableTable`.
 - `FunctionDirectory` class: Manages all `FunctionInfo` instances, supporting the addition,
   retrieval, and validation of functions.
 
 ** Usage *:
 - Add a function: `FunctionDirectory.addFunction(name:parameterTypes:returnType:)`
 - Retrieve function information: `FunctionDirectory.getFunctionInfo(name:)`
 - Check if a function exists: `FunctionDirectory.functionExists(name:)`
 - Validate parameter types: `FunctionDirectory.matchesParameterTypes(name:parameterTypes:)`
 - Validate return type: `FunctionDirectory.validateReturnType(name:expectedType:)`
 
 ** Example **:
 ```swift
 let functionDirectory = FunctionDirectory()
 functionDirectory.addFunction(name: "myFunction", parameterTypes: ["int", "float"], returnType: "int")
 
 if functionDirectory.functionExists(name: "myFunction") {
     print("Function 'myFunction' is defined in the program.")
 }
 
 if functionDirectory.matchesParameterTypes(name: "myFunction", parameterTypes: ["int", "float"]) {
     print("Parameter types match for 'myFunction'.")
 }
*/

// MARK: - Implementation

// FunctionInfo
/// Represents a single function's metadata, including parameters, return type, and local variables.
struct FunctionInfo {
    var parameterTypes: [String]
    var returnType: String
    var variableTable: VariableTable // Each function has its own variable table for local variables
    
    init(parameterTypes: [String], returnType: String) {
        self.parameterTypes = parameterTypes
        self.returnType = returnType
        self.variableTable = VariableTable() // Initialize an empty variable table for local variables
    }
    
    /// Checks if the provided parameter types match the function's parameter types.
    func matchesParameterTypes(_ types: [String]) -> Bool {
        return parameterTypes == types
    }
    
    /// Validates if the return type of a function matches the expected type.
    func validateReturnType(_ expectedType: String) -> Bool {
        return returnType == expectedType
    }
}

// FunctionDirectory
/// Manages a collection of functions, allowing for the addition, retrieval, and validation of function metadata.
class FunctionDirectory {
    private var functions: [String: FunctionInfo] = [:]
    
    /// Adds a function to the directory if it doesn't already exist.
    /// - Returns: `true` if the function was added successfully, `false` if it already exists.
    func addFunction(name: String, parameterTypes: [String], returnType: String) -> Bool {
        if functions[name] == nil {
            functions[name] = FunctionInfo(parameterTypes: parameterTypes, returnType: returnType)
            return true
        }
        return false // Function already exists
    }
    
    /// Retrieves the `FunctionInfo` for a given function name, if it exists.
    func getFunctionInfo(name: String) -> FunctionInfo? {
        return functions[name]
    }
    
    /// Checks if a function with the given name exists in the directory.
    func functionExists(name: String) -> Bool {
        return functions[name] != nil
    }
    
    /// Validates if the parameter types for a function call match the expected types.
    func matchesParameterTypes(name: String, parameterTypes: [String]) -> Bool {
        return functions[name]?.matchesParameterTypes(parameterTypes) ?? false
    }
    
    /// Checks if the return type of a function matches the expected type.
    func validateReturnType(name: String, expectedType: String) -> Bool {
        return functions[name]?.validateReturnType(expectedType) ?? false
    }
}
