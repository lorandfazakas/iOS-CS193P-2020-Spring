//
//  ShapeSetGame.swift
//  SetGame
//
//  Created by Fazakas Loránd on 2020. 07. 14..
//  Copyright © 2020. Lorand Fazakas. All rights reserved.
//

import SwiftUI

class ShapeSetGame: ObservableObject{
    
    @Published private var setGame: SetGameEngine<Shape, Color, Shade, NumberOfElements>
    
    var initialNumberOfCards = 9
    
    init() {
        setGame = SetGameEngine()
        setGame.draw(numberOfCards: initialNumberOfCards)
    }
    
    // MARK: - Access to the Model
    
    var faceUpCards: Array<Card<Shape, Color, Shade, NumberOfElements>> {
        Array(setGame.faceUpCards)
    }
    
    func path(forShape shape: Shape) -> AnyShape {
        switch shape {
        case .diamond: return AnyShape(Diamond())
        case .circle: return AnyShape(Circle())
        case .squiggle: return AnyShape(Squiggle())
        }
    }
    
    // MARK: - Intent(s)
    
    func draw(numberOfCards: Int) {
        setGame.draw(numberOfCards: numberOfCards)
    }
    
    func newGame() {
        setGame = SetGameEngine()
        setGame.draw(numberOfCards: initialNumberOfCards)
    }
    
    
}
