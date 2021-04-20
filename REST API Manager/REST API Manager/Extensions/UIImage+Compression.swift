//
//  UIImage+Compression.swift
//  REST API Manager
//
//  Created by Manish Pandey on 19/04/21.
//

import UIKit

public extension UIImage {
    /// UIImage data compression helper method
    /// - Parameters:
    ///   - compressionQuality: Compression quality of current image, defaults to 0.6 (60% of the original image data)
    ///   - maxWidth: Max width used to create aspect ratio, defaults to 864
    /// - Returns: Compressed UIImage
    func compressed(compressionQuality: CGFloat = 0.6,
                    maxWidth: CGFloat = 864) -> UIImage {
        let imageCopy = self
        let actualHeight = imageCopy.size.height
        let actualWidth = imageCopy.size.width
        let imgRatio = actualWidth / actualHeight
        let resizedHeight = maxWidth / imgRatio
        let rect = CGRect(x: 0, y: 0, width: maxWidth, height: resizedHeight)
        UIGraphicsBeginImageContext(rect.size)
        imageCopy.draw(in: rect)
        let img = UIGraphicsGetImageFromCurrentImageContext()!
        let imageData = img.jpegData(compressionQuality: compressionQuality)!
        UIGraphicsEndImageContext()
        let finalImage = UIImage(data: imageData)!
        return finalImage
    }
}
