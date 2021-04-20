//
//  ResponseProcessor.swift
//  REST API Manager
//
//  Created by Manish Pandey on 20/04/21.
//

import Foundation

struct ResponseProcessor {
    
    static func process(response: URLResponse?, error: Error?) -> Error? {
        if error != nil { return error }
        
        if let httpResponse = response as? HTTPURLResponse {
            switch httpResponse.statusCode {
            case 200..<300:
                return nil
            case 401:
                return ResponseError.unAuthorized
            case 404:
                return ResponseError.resourceNotFound
            case 500..<600:
                return ResponseError.noServerResponse
                
            default:
                return ResponseError.unknown
            }
        }
        
        return ResponseError.unknown
    }
    
}
