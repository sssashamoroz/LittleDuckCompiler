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
    var name: String
    var type: String
    var paramCount: Int
    var localVarCount: Int
    var tempVarCount: Int
    var startQuadruple: Int
    var parameterTypes: [String]
}

class FunctionDirectory {
    
    static let shared = FunctionDirectory() // Singleton instance
    private var functions: [String: FunctionInfo] = [:] // Stores functions by name
    
    private init() {}

    /// Adds a function to the directory if it doesn't exist
    func addFunction(name: String, type: String, startQuadruple: Int) -> Bool {
        if functions[name] == nil {
            let parameterTypes = ParameterTable.shared.getParametersForFunction(name).map { $0.type }
            functions[name] = FunctionInfo(
                name: name,
                type: type,
                paramCount: parameterTypes.count,
                localVarCount: 0,
                tempVarCount: 0,
                startQuadruple: startQuadruple,
                parameterTypes: parameterTypes
            )
            print("Added function: \(name) with parameter types: \(parameterTypes)")
            return true
        }
        print("Function \(name) already declared.")
        return false
    }

    /// Updates the parameter count for a given function
    func updateParameterCount(name: String, count: Int) {
        guard var function = functions[name] else {
            fatalError("Function \(name) not found in directory.")
        }
        function.paramCount = count
        functions[name] = function // Save the updated function
        print("Updated parameter count for function \(name) to \(count)")
    }

    /// Updates the starting quadruple index for a given function
    func updateStartQuadruple(name: String, startQuadruple: Int) {
        guard var function = functions[name] else {
            fatalError("Function \(name) not found in directory.")
        }
        function.startQuadruple = startQuadruple
        functions[name] = function // Save the updated function
        print("Updated start quadruple for function \(name) to \(startQuadruple)")
    }

    /// Updates the local variable count for a given function
    func updateLocalVarCount(name: String, count: Int) {
        guard var function = functions[name] else {
            fatalError("Function \(name) not found in directory.")
        }
        function.localVarCount = count
        functions[name] = function // Save the updated function
        print("Updated local variable count for function \(name) to \(count)")
    }

    /// Retrieves information for a specific function
    func getFunctionInfo(name: String) -> FunctionInfo? {
        return functions[name]
    }
    
    func getFunction(name: String) -> FunctionInfo? {
        return functions[name]
    }
    
    func getFunctionStart(name: String) -> Int? {
        return functions[name]?.startQuadruple
    }
    
    /// Resets the directory (useful between compilation runs)
    func reset() {
        functions.removeAll()
        print("FunctionDirectory cleared.")
    }
}

/// Stores parameters for each function to construct function signatures
class ParameterTable {
    
    static let shared = ParameterTable() // Singleton instance
    private var parameters: [String: [ParameterInfo]] = [:] // Dictionary of function names to their parameter info

    private init() {}

    /// Adds a parameter to a function's parameter list
    /// - Parameters:
    ///   - functionName: The name of the function
    ///   - parameterName: The name of the parameter
    ///   - parameterType: The type of the parameter
    func addParameter(forFunction functionName: String, parameterName: String, parameterType: String) {
        if parameters[functionName] == nil {
            parameters[functionName] = [] // Initialize parameter list if it doesn't exist
        }
        parameters[functionName]?.append(ParameterInfo(name: parameterName, type: parameterType))
        print("Added parameter \(parameterName) of type \(parameterType) to function \(functionName)")
    }

    /// Retrieves the parameter list for a given function
    /// - Parameter functionName: The name of the function
    /// - Returns: An array of `ParameterInfo` for the function, or an empty array if none exist
    func getParametersForFunction(_ functionName: String) -> [ParameterInfo] {
        return parameters[functionName] ?? []
    }

    /// Clears all stored parameter information (useful between compiler runs)
    func reset() {
        parameters.removeAll()
        print("ParameterTable cleared.")
    }
}

/// Represents a single parameter's metadata
struct ParameterInfo {
    let name: String
    let type: String
}
