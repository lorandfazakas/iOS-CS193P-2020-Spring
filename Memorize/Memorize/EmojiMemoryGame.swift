//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Fazakas Loránd on 2020. 07. 04..
//  Copyright © 2020. Lorand Fazakas. All rights reserved.
//

import SwiftUI


class EmojiMemoryGame {
    private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    static func createMemoryGame() -> MemoryGame<String> {
        let emojis = ["🎃", "👻", "🕷"]
        return MemoryGame<String>(numberOfPairsOfCards: emojis.count)  { pairIndex in
            return emojis[pairIndex]
        }
    }
        
    // MARK: - Access to the Model
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    // MARK: - Intent(s)
    
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
}

