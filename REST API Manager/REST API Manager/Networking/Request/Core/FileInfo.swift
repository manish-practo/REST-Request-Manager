//
//  FileInfo.swift
//  Practo
//
//  Created by Manish Pandey on 16/02/21.
//  Copyright © 2021 Practo. All rights reserved.
//

import Foundation

struct FileInfo {
    let paramName: String
    let fileName: String
    let type: FileType
    let data: Data
}

extension FileInfo {
    static func detectFileType(from fullName: String) -> FileType {
        // Including .
        let jpegExtCount = 5
        let pngJpgExtCount = 4

        if fullName.isEmpty || fullName.count <= pngJpgExtCount {
            return .none
        }

        // Detect type
        if fullName.suffix(jpegExtCount) == ImageType.jpeg.mimeType {
            return FileType.image(type: .jpeg)
        }

        if fullName.suffix(pngJpgExtCount) == ImageType.jpg.mimeType {
            return FileType.image(type: .jpg)
        }

        if fullName.suffix(pngJpgExtCount) == ImageType.png.mimeType {
            return FileType.image(type: .jpeg)
        }

        if fullName.suffix(pngJpgExtCount) == FileType.pdf.mimeType {
            return FileType.pdf
        }

        return .none
    }
}
