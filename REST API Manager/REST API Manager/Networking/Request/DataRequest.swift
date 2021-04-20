//
//  DataRequest.swift
//  REST API Manager
//
//  Created by Manish Pandey on 19/04/21.
//

import Foundation

class DataRequest: DataRequestable {
    
    func request(with session: URLSession,
                 config: DataRequestConfig,
                 onResponse: @escaping (Data?, URLResponse?, Error?) -> Void) throws -> URLSessionDataTask {
        let requestBuilder = DataRequestBuilder()

        do {
             let request = try requestBuilder.set(config.url)
                                .set(config.method)
                                .set(config.headers)
                                .set(config.params, file: nil)
                                .getRequest()
            
            return session.dataTask(with: request) { data, response, error in
                onResponse(data, response, error)
            }
        } catch {
            throw error
        }
    }
}
