//
//  ConditionHelpers.swift
//  Practo
//
//  Created by Manish Pandey on 16/02/21.
//  Copyright © 2021 Practo. All rights reserved.
//

import Foundation

func isNilOrEmpty<COLLECTION: Collection>(_ collection: COLLECTION?) -> Bool {
    return collection?.isEmpty ?? true
}
