//
//  FileUploadRequest.swift
//  Practo
//
//  Created by Manish Pandey on 16/02/21.
//  Copyright © 2021 Practo. All rights reserved.
//

import Foundation

class FileUploadRequest: UploadDataRequestable {
    func request(with session: URLSession,
                 config: FileUploadRequestConfig,
                 onResponse: @escaping (Data?, URLResponse?, Error?) -> Void) throws -> URLSessionUploadTask {
        let requestBuilder = FileUploadRequestBuilder()

        do {
             let request = try requestBuilder.set(config.url)
                                .set(config.method)
                                .set(config.headers)
                                .set(config.params, file: config.fileData)
                                .getRequest()

            return session.uploadTask(with: request, from: request.httpBody) { data, response, error in
                onResponse(data, response, error)
            }
        } catch {
            throw error
        }
    }
}
