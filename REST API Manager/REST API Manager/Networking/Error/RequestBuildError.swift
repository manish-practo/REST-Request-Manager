//
//  RequestBuildError.swift
//  Practo
//
//  Created by Manish Pandey on 16/02/21.
//  Copyright © 2021 Practo. All rights reserved.
//

import Foundation

enum RequestBuildError: Error {
    case invalidURL
    case invalidParam
    case invalidData
}
