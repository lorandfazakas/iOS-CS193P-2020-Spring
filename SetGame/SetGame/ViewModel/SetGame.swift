//
//  ShapeSetGame.swift
//  SetGame
//
//  Created by Fazakas Loránd on 2020. 07. 14..
//  Copyright © 2020. Lorand Fazakas. All rights reserved.
//

import SwiftUI

typealias ShapeSetGame = SetGameEngine<SetGame.Shape,  SetGame.ShapeCount, SetGame.Shade, SetGame.Color>

class SetGame: ObservableObject{
        
    @Published private var setGame: ShapeSetGame
    
    var initialNumberOfCards = 12
    
    init() {
        setGame = SetGameEngine()
        setGame.draw(numberOfCards: initialNumberOfCards)
    }
    
    // MARK: - Access to the Model
    
    var faceUpCards: Array<ShapeSetGame.Card> {
        setGame.deck.filter { $0.isDealt && (!($0.isInSet ?? false) || ($0.isSelected && $0.isInSet ?? true)) }
    }
    
    var score: Int {
        setGame.score
    }
    
    
    // MARK: - Intent(s)
    
    func draw(numberOfCards: Int) {
        setGame.draw(numberOfCards: numberOfCards)
    }
    
    func choose(card: ShapeSetGame.Card) {
        setGame.choose(card: card)
    }
    
    func newGame() {
        setGame = SetGameEngine()
        setGame.draw(numberOfCards: initialNumberOfCards)
    }
    
    enum Color: CaseIterable {
        case blue, green, red
    }

    enum Shade: CaseIterable {
        case solid, semitransparent, unfilled
    }

    enum Shape: CaseIterable {
        case diamond, squiggle, circle
    }

    enum ShapeCount: Int, CaseIterable {
        case one=1, two, three
    }

    
    
}
