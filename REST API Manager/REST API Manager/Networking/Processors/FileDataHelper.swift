//
//  FileDataHelper.swift
//  Practo
//
//  Created by Manish Pandey on 17/02/21.
//  Copyright © 2021 Practo. All rights reserved.
//

import UIKit

struct FileDataHelper {
    func getImageData(from image: UIImage?, with compression: CGFloat?) throws -> Data {
        guard var safeImage = image else {
            throw FileDataError.noData
        }

        if let safeCompression = compression {
            safeImage = safeImage.compressed(compressionQuality: safeCompression)
        }

        if let safeData = safeImage.pngData() {
            return safeData
        } else {
            throw FileDataError.noData
        }
    }

    func getFileData(from url: URL) throws -> Data {
        guard let safeData = try? Data(contentsOf: url) else {
            throw FileDataError.fileNotFound
        }

        return safeData
    }
}
