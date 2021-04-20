//
//  DataProcessor.swift
//  Practo
//
//  Created by Manish Pandey on 16/02/21.
//  Copyright © 2021 Practo. All rights reserved.
//

import Foundation

struct DataProcessor<DATA: Codable> {
    func decode(rawData: Data?) -> DATA? {
        guard let safeData = rawData else { return nil }

        let decoder = JSONDecoder()

        do {
            return try decoder.decode(DATA.self, from: safeData)
        } catch {
            //Utils.recordNonFatalError(error)
            assertionFailure(error.localizedDescription)
            return nil
        }
    }
}
