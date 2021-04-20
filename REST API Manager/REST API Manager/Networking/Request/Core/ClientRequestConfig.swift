//
//  ClientRequestConfig.swift
//  Practo
//
//  Created by Manish Pandey on 16/02/21.
//  Copyright © 2021 Practo. All rights reserved.
//

import Foundation

protocol ClientRequestConfig {
    /// Full url
    var url: String { get set }
    var headers: [RequestHeader]? { get set }
    var params: [RequestParameter]? { get set }
    var method: RequestMethod { get set }
}
