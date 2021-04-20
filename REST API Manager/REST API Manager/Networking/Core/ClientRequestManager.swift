//
//  ClientRequestManager.swift
//  Practo
//
//  Created by Manish Pandey on 16/02/21.
//  Copyright © 2021 Practo. All rights reserved.
//

import Foundation

class ClientRequestManager: NSObject, URLSessionTaskDelegate {
    // Properties
    private(set) lazy var session = URLSession(configuration: .default, delegate: self, delegateQueue: .main)

    // closures
    private(set) var uploadProgress: ProgressTask?
    private(set) var downloadProgress: ProgressTask?

    // types
    typealias ProgressTask = ((Double) -> Void)

    func urlSession(_ session: URLSession,
                    task: Foundation.URLSessionTask,
                    didSendBodyData bytesSent: Int64,
                    totalBytesSent: Int64,
                    totalBytesExpectedToSend: Int64) {
        self.uploadProgress?(Double(totalBytesSent) / Double(totalBytesExpectedToSend))
    }

    func urlSession(_ session: URLSession,
                    downloadTask: URLSessionDownloadTask,
                    didWriteData bytesWritten: Int64,
                    totalBytesWritten: Int64,
                    totalBytesExpectedToWrite: Int64) {
        self.downloadProgress?(Double(totalBytesWritten) / Double(totalBytesExpectedToWrite))
    }
}

// MARK: - Requests
extension ClientRequestManager {
    
    @discardableResult
    func data<RESPONSE: Codable>(_ responseType: RESPONSE.Type,
                                 config: DataRequestConfig,
                                 onComplete: ((RESPONSE?, Error?) -> Void)?) throws -> URLSessionDataTask {
        let jsonDataRequest = DataRequest()

        do {
            let request = try jsonDataRequest.request(with: self.session,
                                                      config: config) { (data, response, error) in
                onComplete?(DataProcessor<RESPONSE>().decode(rawData: data),
                            ResponseProcessor.process(response: response, error: error))
            }
            request.resume()

            return request
        } catch {
            throw error
        }
    }
    
    @discardableResult
    func upload<RESPONSE: Codable>(_ responseType: RESPONSE.Type,
                                   fileConfig: FileUploadRequestConfig,
                                   onProgress: ProgressTask?, onComplete: ((RESPONSE?, Error?) -> Void)?) throws -> URLSessionUploadTask {
        let uploadRequest = FileUploadRequest()
        self.uploadProgress = onProgress

        do {
            let request = try uploadRequest.request(with: self.session,
                                                    config: fileConfig) { data, response, error in
                onComplete?(DataProcessor<RESPONSE>().decode(rawData: data),
                            ResponseProcessor.process(response: response, error: error))
            }
            request.resume()

            return request
        } catch {
            throw error
        }
    }

    @discardableResult
    func download(fileConfig: ClientRequestConfig,
                  onProgress: ProgressTask?,
                  onComplete: ((URL?, Error?) -> Void)?) throws -> URLSessionDownloadTask {
        let downloadRequest = FileDownloadRequest()
        self.downloadProgress = onProgress

        do {
            let request = try downloadRequest.request(with: self.session,
                                                      config: fileConfig) { url, response, error in
                onComplete?(url, ResponseProcessor.process(response: response, error: error))
            }
            request.resume()

            return request
        } catch {
            throw error
        }
    }
}
