//
//  Array+Identifiable.swift
//  Memorize
//
//  Created by Fazakas Loránd on 2020. 07. 08..
//  Copyright © 2020. Lorand Fazakas. All rights reserved.
//

import Foundation

extension Array where Element: Identifiable {
    func firstIndex(matching: Element) -> Int? {
        for index in 0..<self.count {
            if self[index].id == matching.id {
                return index
            }
        }
        return nil
    }
}
