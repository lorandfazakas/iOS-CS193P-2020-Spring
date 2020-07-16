//
//  ShapeSetGame.swift
//  SetGame
//
//  Created by Fazakas Loránd on 2020. 07. 14..
//  Copyright © 2020. Lorand Fazakas. All rights reserved.
//

import Foundation

class ShapeSetGame: ObservableObject{
    
    @Published private var setGame: SetGame = SetGame<Shape, Color, Shade, NumberOfElements>()
    
    
    // MARK: - Access to the Model
    
    var faceUpCards: Set<Card<Shape, Color, Shade, NumberOfElements>> {
        setGame.faceUpCards
    }
    
    // MARK: - Intent(s)
    
    func draw(numberOfCards: Int) {
        setGame.draw(numberOfCards: numberOfCards)
    }
    
    
}
