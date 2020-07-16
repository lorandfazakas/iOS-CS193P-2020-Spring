//
//  BasicSetGame.swift
//  SetGame
//
//  Created by Fazakas Loránd on 2020. 07. 14..
//  Copyright © 2020. Lorand Fazakas. All rights reserved.
//

import Foundation

class ShapeSetGame: ObservableObject{
    
    enum Color: CaseIterable {
        case blue, green, red
    }
    
    enum Shade: CaseIterable {
        case solid, shaded, unfilled
    }
    
    enum NumberOfElements: CaseIterable {
        case one, two, three
    }
    
    enum Shape: CaseIterable {
        case diamond, squiggle, oval
    }
    
    
}
