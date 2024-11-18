//
//  VariableTable.swift
//  LittleDuckCompiler
//
//  Created by Aleksandr Morozov on 30/10/24.
//

/* MARK: - VariableTable
  This file defines the `VariableTable` component for managing variables within different scopes
  in the LittleDuck language. It helps in handling variable declarations and ensuring unique names
  within each scope, while providing type validation and easy retrieval of variable information.
  
  ### VariableTable
  The `VariableTable` is a data structure that stores information about variables within a specific
  scope. Each variable is represented by a `VariableInfo` struct, which holds the variable's type
  and an optional memory address.
  
  ** Purpose **: `VariableTable` helps track all variables within a given scope, such as the global
  scope or a function's local scope. It ensures that variables are unique within each scope, validates
  types, and allows for easy retrieval of variable information during parsing and semantic analysis.
  
  - `VariableInfo` struct: Represents an individual variable's type and optional memory address.
  - `VariableTable` class: Manages the collection of `VariableInfo` instances for a specific scope.
  
  ** Usage **:
  - Add a variable: `VariableTable.addVariable(name:type:memoryAddress:)`
  - Retrieve variable type: `VariableTable.getVariableType(name:)`
  - Check if a variable exists: `VariableTable.variableExists(name:)`
  - Validate variable type: `VariableTable.matchesType(name:expectedType:)`
  
  ** Example **:
  ```swift
  let globalVariableTable = VariableTable()
  globalVariableTable.addVariable(name: "x", type: "int")
  
  if globalVariableTable.variableExists(name: "x") {
      print("Variable 'x' exists in global scope.")
  }
*/

// MARK: - Implementation

// VariableInfo
/// Represents individual variable details, like type and optionally a memory address.
struct VariableInfo {
    
    var type: String
    var memoryAddress: Int? // Optional for memory management, if needed
    
    init(type: String, memoryAddress: Int? = nil) {
        self.type = type
        self.memoryAddress = memoryAddress
    }
    
    /// Checks if the variable's type matches an expected type.
    func matchesType(_ expectedType: String) -> Bool {
        return type == expectedType
    }
}

// VariableTable
/// Manages a collection of variables for a specific scope (e.g., global or local to a function).
class VariableTable {
    
    static let shared = VariableTable() // Singleton instance
    private var variables: [String: VariableInfo] = [:]
    
    /// Adds a variable to the table if it doesn't already exist.
    /// - Returns: `true` if the variable was added successfully, `false` if it already exists.
    func addVariable(name: String, type: String) -> Bool {
        if variables[name] == nil {
            print("Adding variable: \(name) of type \(type)")
            variables[name] = VariableInfo(type: type)
            return true // Successfully added
        }
        print("Variable \(name) already declared.")
        return false // Variable already exists
    }
    
    /// Retrieves the type of a variable if it exists.
    func getVariableType(name: String) -> String? {
        return variables[name]?.type
    }
    
    /// Checks if a variable exists in the table.
    func variableExists(name: String) -> Bool {
        return variables[name] != nil
    }
    
    /// Validates if a variable's type matches the expected type.
    func matchesType(name: String, expectedType: String) -> Bool {
        return variables[name]?.matchesType(expectedType) ?? false
    }
    
    /// Extracts variable names from an `idList` context.
    func extractVariableNames(_ ctx: LittleDuckParser.IdListContext?) -> [String] {
        var names = [String]()
        
        // Add primary ID if present
        if let primaryID = ctx?.ID()?.getText() {
            names.append(primaryID)
        }
        
        // Add any additional IDs from `moreIds`
        if let additionalIDs = ctx?.moreIds() {
            names.append(contentsOf: extractAdditionalIDs(additionalIDs))
        }
        
        return names
    }

    /// Helper method to extract additional IDs from `moreIds` context.
    private func extractAdditionalIDs(_ ctx: LittleDuckParser.MoreIdsContext?) -> [String] {
        var ids = [String]()
        var currentContext = ctx
        
        // Traverse through `moreIds` linked list to collect IDs
        while let context = currentContext {
            if let id = context.ID()?.getText() {
                ids.append(id)
            }
            currentContext = context.moreIds()  // Move to next `moreIds` context
        }
        
        return ids
    }
    
    func reset() {
        variables.removeAll()
        print("VariableTable cleared.")
    }
}

extension VariableTable {
    var description: String {
        guard !variables.isEmpty else { return "Variable Table is empty." }
        var output = "Variable Table:\n"
        for (name, info) in variables {
            output += "\(name): \(info.type)\n"
        }
        return output
    }
}
