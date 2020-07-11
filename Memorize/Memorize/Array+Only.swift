//
//  Array+Only.swift
//  Memorize
//
//  Created by Fazakas Loránd on 2020. 07. 11..
//  Copyright © 2020. Lorand Fazakas. All rights reserved.
//

import Foundation

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
