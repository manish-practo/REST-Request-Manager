//
//  Requestable.swift
//  Practo
//
//  Created by Manish Pandey on 16/02/21.
//  Copyright © 2021 Practo. All rights reserved.
//

import Foundation

protocol DataRequestable {
    associatedtype REQUESTCONFIG: ClientRequestConfig
    func request(with session: URLSession, config: REQUESTCONFIG, onResponse: @escaping (Data?, URLResponse?, Error?) -> Void) throws -> URLSessionDataTask
}

protocol UploadDataRequestable {
    func request(with session: URLSession, config: FileUploadRequestConfig, onResponse: @escaping (Data?, URLResponse?, Error?) -> Void) throws -> URLSessionUploadTask
}

protocol DownloadDataRequestable {
    func request(with session: URLSession, config: ClientRequestConfig, onResponse: @escaping (URL?, URLResponse?, Error?) -> Void) throws -> URLSessionDownloadTask
}
