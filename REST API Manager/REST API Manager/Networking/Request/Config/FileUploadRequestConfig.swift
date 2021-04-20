//
//  FileUploadRequestConfig.swift
//  Practo
//
//  Created by Manish Pandey on 16/02/21.
//  Copyright © 2021 Practo. All rights reserved.
//

import Foundation

struct FileUploadRequestConfig: ClientRequestConfig {
    var url: String
    var headers: [RequestHeader]?
    var params: [RequestParameter]?
    var method: RequestMethod
    var fileData: FileInfo
}
