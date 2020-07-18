//
//  SetGame.swift
//  SetGame
//
//  Created by Fazakas Loránd on 2020. 07. 14..
//  Copyright © 2020. Lorand Fazakas. All rights reserved.
//

import Foundation

struct SetGameEngine<Shape, ShapeCount, Shade, Color> where
    Shape: CaseIterable & Equatable, ShapeCount: CaseIterable & Equatable,
    Shade: CaseIterable & Equatable, Color: CaseIterable & Equatable {
    
    private(set) var deck = Array<Card>()
    private(set) var score = 0
    
    private var indicesOfSelectedCards: [Int] {
        get { deck.indices.filter { deck[$0].isSelected } }
    }
    
    private var indicesOfDealtCards: [Int] {
        get { deck.indices.filter { deck[$0].isDealt } } 
    }
    
    
    
    init() {
        Shape.allCases.forEach {
            let firstFeature = $0
            ShapeCount.allCases.forEach {
                let secondFeature = $0
                Shade.allCases.forEach {
                    let thirdFeature = $0
                    Color.allCases.forEach {
                        let fourthFeature = $0
                        deck.append(Card(shape: firstFeature, shapeCount: secondFeature, shade: thirdFeature, color: fourthFeature))
                    }
                }
            }
        }
        deck.shuffle()
    }
    
    mutating func draw(numberOfCards: Int) {
        var drawnCardCount = 0
        var i = 0
        while (drawnCardCount < numberOfCards && i < deck.count) {
            if !deck[i].isDealt {
                deck[i].isDealt = true
                drawnCardCount+=1
            }
            i += 1
        }
    }
    
    mutating func evaluateSet() -> Bool {
        let selectedCards = indicesOfSelectedCards
        let isSet = self.isSet()
//        let isSet = true
        if isSet {
            deck[selectedCards[0]].isInSet = true
            deck[selectedCards[1]].isInSet = true
            deck[selectedCards[2]].isInSet = true
        } else {
            deck[selectedCards[0]].isInSet = false
            deck[selectedCards[1]].isInSet = false
            deck[selectedCards[2]].isInSet = false
        }
        
        score += isSet ? Score.validSet : Score.invalidSet
        return isSet
    }
    
    private func isSet() -> Bool {
        let selectedCards = indicesOfSelectedCards
        let card1 = deck[selectedCards[0]]
        let card2 = deck[selectedCards[1]]
        let card3 = deck[selectedCards[2]]
        let firstFeatureDifferent = card1.shape != card2.shape && card2.shape != card3.shape && card3.shape != card1.shape
        let secondFeatureDifferent = card1.shapeCount != card2.shapeCount && card2.shapeCount != card3.shapeCount && card3.shapeCount != card1.shapeCount
        let thirdFeatureDifferent = card1.shade != card2.shade && card2.shade != card3.shade && card3.shade != card1.shade
        let fourthFeatureDifferent = card1.color != card2.color && card2.color != card3.color && card3.color != card1.color
        return firstFeatureDifferent && secondFeatureDifferent && thirdFeatureDifferent && fourthFeatureDifferent
    }
    
    mutating func choose(card: Card) -> Bool? {
        let selectedCards = indicesOfSelectedCards
        if indicesOfSelectedCards.count == 3 {
            deck[selectedCards[0]].isSelected = false
            deck[selectedCards[1]].isSelected = false
            deck[selectedCards[2]].isSelected = false
            if !(deck[selectedCards[0]].isInSet! && deck[selectedCards[1]].isInSet! && deck[selectedCards[2]].isInSet!) {
                deck[selectedCards[0]].isInSet = nil
                deck[selectedCards[1]].isInSet = nil
                deck[selectedCards[2]].isInSet = nil
            }
        }
        let cardIndex = deck.firstIndex(matching: card)!
        deck[cardIndex].isSelected = !deck[cardIndex].isSelected
        if indicesOfSelectedCards.count == 3 {
            return evaluateSet()
        }
        return nil
    }
    
    struct Card: CustomStringConvertible, Identifiable {
        
        var id = UUID()
        var description: String {
            return "\(shape), \(shapeCount), \(shade), \(color)"
        }
        
        var shape: Shape
        var shapeCount: ShapeCount
        var shade: Shade
        var color: Color
        
        var isSelected = false
        var isDealt = false
        var isInSet: Bool?
        
        static func ==(lhs: Card, rhs: Card) -> Bool {
            return (
                (lhs.shape == rhs.shape) &&
                    (lhs.shapeCount == rhs.shapeCount) &&
                    (lhs.shade == rhs.shade) &&
                    (lhs.color == rhs.color)
            )
        }
    }

    
}

private struct Score {
    static let validSet = 3
    static let invalidSet = -5
}
