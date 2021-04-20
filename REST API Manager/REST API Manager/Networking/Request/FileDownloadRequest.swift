//
//  FileDownloadRequest.swift
//  PractoBusiness
//
//  Created by Manish Pandey on 24/02/21.
//  Copyright © 2021 Practo Technologies Private Limited. All rights reserved.
//

import Foundation

class FileDownloadRequest: DownloadDataRequestable {
    func request(with session: URLSession,
                 config: ClientRequestConfig,
                 onResponse: @escaping (URL?, URLResponse?, Error?) -> Void) throws -> URLSessionDownloadTask {
        let requestBuilder = FileDownloadRequestBuilder()

        do {
             let request = try requestBuilder.set(config.url)
                                .set(config.method)
                                .set(config.headers)
                                .set(config.params, file: nil)
                                .getRequest()
            //DebugURLRequest.debug(request)
            return session.downloadTask(with: request) { url, response, error in
                onResponse(url, response, error)
            }
        } catch {
            throw error
        }
    }
}
