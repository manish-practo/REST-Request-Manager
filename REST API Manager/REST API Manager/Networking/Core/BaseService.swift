//
//  BaseService.swift
//  REST API Manager
//
//  Created by Manish Pandey on 19/04/21.
//

import Foundation

class BaseService {
    
    // MARK: - Properties
    let baseURL: String
    // Every request should have one instance
    //let requestManager = ClientRequestManager()
    
    init(baseURL: String) {
        self.baseURL = baseURL
    }
    
}
