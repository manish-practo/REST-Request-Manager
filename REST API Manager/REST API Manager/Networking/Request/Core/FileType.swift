//
//  FileType.swift
//  Practo
//
//  Created by Manish Pandey on 16/02/21.
//  Copyright © 2021 Practo. All rights reserved.
//

import Foundation

enum FileType {
    case none
    case image(type: ImageType)
    case pdf

    var mimeType: String {
        switch self {
        case .none: return String()
            case .image(let type): return type.mimeType
            case .pdf: return "application/pdf"
        }
    }
}

enum ImageType {
    case jpeg
    case jpg
    case png

    var mimeType: String {
        switch self {
        case .jpeg, .jpg:
            return "image/jpeg"
        case .png:
            return "image/png"
        }
    }
}
