//
//  MemoryGame.swift
//  Memorize
//
//  Created by Fazakas Loránd on 2020. 07. 04..
//  Copyright © 2020. Lorand Fazakas. All rights reserved.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable  {
    var cards: Array<Card>
    private var seenCards: Set<Int> = []
    var score: Int
    
    var indexOfOneAndOnlyFaceUpCard: Int? {
        get { cards.indices.filter { cards[$0].isFaceUp }.only }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = index == newValue
            }
        }
    }
    
    mutating func choose(card: Card) {
        if let chosenIndex = cards.firstIndex(matching: card), !cards[chosenIndex].isFaceUp, !cards[chosenIndex].isMatched {
            if let potentialMatchIndex = indexOfOneAndOnlyFaceUpCard {
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                    score += Points.foundMatch
                } else {
                    if seenCards.contains(chosenIndex) {
                        score += Points.missMatch
                    }
                    if seenCards.contains(potentialMatchIndex) {
                        score += Points.missMatch
                    }
                }
                seenCards.insert(chosenIndex)
                seenCards.insert(potentialMatchIndex)
                self.cards[chosenIndex].isFaceUp = true
            } else {
                indexOfOneAndOnlyFaceUpCard = chosenIndex
            }
        }
    }
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        score = 0
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
        }
        cards.shuffle()
    }
    
    struct Card: Identifiable {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }
    
}

private struct Points {
    static let missMatch = -1
    static let foundMatch = 2
}
