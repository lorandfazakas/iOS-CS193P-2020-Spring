//
//  ShapeFeatures.swift
//  SetGame
//
//  Created by Fazakas Loránd on 2020. 07. 15..
//  Copyright © 2020. Lorand Fazakas. All rights reserved.
//

import Foundation

enum Color: CaseIterable {
    case blue, green, red
}

enum Shade: CaseIterable {
    case solid, shaded, unfilled
}

enum Shape: CaseIterable {
    case diamond, squiggle, circle
}

enum NumberOfElements: Int, CaseIterable {
    case one=1, two=2, three=3
}
