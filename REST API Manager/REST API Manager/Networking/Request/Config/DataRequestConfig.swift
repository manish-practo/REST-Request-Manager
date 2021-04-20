//
//  DataRequestConfig.swift
//  REST API Manager
//
//  Created by Manish Pandey on 19/04/21.
//

import Foundation

struct DataRequestConfig: ClientRequestConfig {
    var url: String
    var headers: [RequestHeader]?
    var params: [RequestParameter]?
    var method: RequestMethod
}
