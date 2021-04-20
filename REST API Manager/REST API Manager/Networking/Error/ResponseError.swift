//
//  ResponseError.swift
//  REST API Manager
//
//  Created by Manish Pandey on 20/04/21.
//

import Foundation

enum ResponseError: Error {
    case noServerResponse
    case unAuthorized
    case resourceNotFound
    case unknown
}
