//
//  String+Capitalize.swift
//  REST API Manager
//
//  Created by Manish Pandey on 20/04/21.
//

import Foundation

extension String {
    func capitalizingFirstLetter() -> String {
        if self.isEmpty { return self }
        
        return prefix(1).capitalized + dropFirst()
    }

    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}
