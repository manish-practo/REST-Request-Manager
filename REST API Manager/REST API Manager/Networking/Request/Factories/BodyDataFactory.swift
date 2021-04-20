//
//  BodyDataFactory.swift
//  Practo
//
//  Created by Manish Pandey on 16/02/21.
//  Copyright © 2021 Practo. All rights reserved.
//

import Foundation

struct BodyDataFactory {
    func create(from boundary: String, params: [RequestParameter]?, file: FileInfo?) -> Data {
        let openBoundary = "\r\n--\(boundary)\r\n".data(using: .utf8)!
        // Use at then end of data
        let closeBoundary = "\r\n--\(boundary)--\r\n".data(using: .utf8)!

        var data = Data()

        params?.forEach {
            data.append(openBoundary)
            data.append(self.generateContentDisposition(from: $0.key))
            data.append(self.generateData(from: $0.value))
        }

        // image
        if let safeFile = file {
            data.append(openBoundary)
            data.append("Content-Disposition: form-data; name=\"\(safeFile.paramName)\"; filename=\"\(safeFile.fileName)\"\r\n".data(using: .utf8)!)
            data.append("Content-Type: \(safeFile.type.mimeType)\r\n\r\n".data(using: .utf8)!)
            data.append(safeFile.data)
        }

        data.append(closeBoundary)

        return data
    }
}

extension BodyDataFactory {
    private func generateContentDisposition(from key: String) -> Data {
        return "Content-Disposition: form-data; name=\"\(key)\"\r\n\r\n".data(using: .utf8)!
    }

    private func generateData(from value: String) -> Data {
        return "\(value)".data(using: .utf8)!
    }
}
