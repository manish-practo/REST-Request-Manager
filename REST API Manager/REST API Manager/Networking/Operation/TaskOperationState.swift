//
//  TaskOperationState.swift
//  REST API Manager
//
//  Created by Manish Pandey on 19/04/21.
//

import Foundation

enum TaskOperationState: String {
    case ready, executing, finished
    
    var key: String {
        return "is" + self.rawValue.capitalizingFirstLetter()
    }
}
