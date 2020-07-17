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
    
    var faceUpCards: Array<SetGameEngine<Shape, Color, Shade, NumberOfElements>.Card> {
        setGame.deck.filter { $0.isDealt && !$0.isInSet }
    }
    
    var score: Int {
        setGame.score
    }
    
    
    // MARK: - Intent(s)
    
    func draw(numberOfCards: Int) {
        setGame.draw(numberOfCards: numberOfCards)
    }
    
    func choose(card: SetGameEngine<Shape, Color, Shade, NumberOfElements>.Card) {
        setGame.choose(card: card)
    }
    
    func newGame() {
        setGame = SetGameEngine()
        setGame.draw(numberOfCards: initialNumberOfCards)
    }
    
    
}
