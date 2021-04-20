//
//  AbstractRequestBuilder.swift
//  Practo
//
//  Created by Manish Pandey on 16/02/21.
//  Copyright © 2021 Practo. All rights reserved.
//

import Foundation

protocol AbstractRequestBuilder: AnyObject {
    /// Actual request configured using given url
    /// - URL must be supplied from parent
    var urlRequest: URLRequest! { get set }

    /// Creates url request with given url
    /// - Parameter url: fully qualified url for request
    /// - Must be called before anyother setter
    func set(_ url: String) throws -> Self
    func set(_ method: RequestMethod) throws -> Self
    func set(_ headers: [RequestHeader]?) throws -> Self
    func set(_ bodyParams: [RequestParameter]?, file: FileInfo?) throws -> Self
    func getRequest() -> URLRequest
}

extension AbstractRequestBuilder {
    func set(_ url: String) throws -> Self {
        guard let safeURL = URL(string: url), !url.isEmpty else {
            throw RequestBuildError.invalidURL
        }

        self.urlRequest = URLRequest(url: safeURL)
        return self
    }

    func set(_ method: RequestMethod) throws -> Self {
        self.urlRequest.httpMethod = method.rawValue
        return self
    }

    func set(_ headers: [RequestHeader]?) throws -> Self {
        if !isNilOrEmpty(headers) {
            headers?.forEach {
                self.urlRequest.addValue($0.value, forHTTPHeaderField: $0.key)
            }
        }

        return self
    }

    func set(_ bodyParams: [RequestParameter]?, file: FileInfo?) throws -> Self {
        let boundary = UUID().uuidString
        self.urlRequest.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")

        let postData = BodyDataFactory().create(from: boundary, params: bodyParams, file: file)
        self.urlRequest.httpBody = postData

        return self
    }

    func getRequest() -> URLRequest {
        return self.urlRequest
    }
}
