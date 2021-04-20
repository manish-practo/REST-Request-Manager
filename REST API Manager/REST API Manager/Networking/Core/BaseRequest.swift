//
//  BaseRequest.swift
//  REST API Manager
//
//  Created by Manish Pandey on 19/04/21.
//

import Foundation

protocol BaseRequest {
    var route: (path: String, method: RequestMethod) { get }
}
