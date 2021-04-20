//
//  FileDownloadRequestConfig.swift
//  PractoBusiness
//
//  Created by Manish Pandey on 24/02/21.
//  Copyright © 2021 Practo Technologies Private Limited. All rights reserved.
//

import Foundation

struct FileDownloadRequestConfig: ClientRequestConfig {
    var url: String
    var headers: [RequestHeader]?
    var params: [RequestParameter]?
    var method: RequestMethod
}
