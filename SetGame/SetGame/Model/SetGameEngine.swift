//
//  SetGame.swift
//  SetGame
//
//  Created by Fazakas Loránd on 2020. 07. 14..
//  Copyright © 2020. Lorand Fazakas. All rights reserved.
//

import Foundation

struct SetGameEngine<FirstFeature, SecondFeature, ThirdFeature, FourthFeature> where
    FirstFeature: CaseIterable, FirstFeature: Equatable,
    SecondFeature: CaseIterable, SecondFeature: Equatable,
    ThirdFeature: CaseIterable, ThirdFeature: Equatable,
    FourthFeature: CaseIterable, FourthFeature: Equatable {
    
    private var indicesOfSelectedCards: [Int] {
        get { deck.indices.filter { deck[$0].isSelected } }
    }
    
    private var indicesOfDealtCards: [Int] {
        get { deck.indices.filter { deck[$0].isDealt } } 
    }
    
    private(set) var deck = Array<Card>()
//    private(set) var openCards = Array<Card<FirstFeature, SecondFeature, ThirdFeature, FourthFeature>>()
    private(set) var score = 0
    
    init() {
        FirstFeature.allCases.forEach {
            let firstFeature = $0
            SecondFeature.allCases.forEach {
                let secondFeature = $0
                ThirdFeature.allCases.forEach {
                    let thirdFeature = $0
                    FourthFeature.allCases.forEach {
                        let fourthFeature = $0
                        deck.append(Card(firstFeature: firstFeature, secondFeature: secondFeature, thirdFeature: thirdFeature, fourthFeature: fourthFeature))
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
    
    mutating func evaluateSet() {
        let selectedCards = indicesOfSelectedCards
        let isSet = self.isSet()
        if isSet {
            deck[selectedCards[0]].isInSet = true
            deck[selectedCards[1]].isInSet = true
            deck[selectedCards[2]].isInSet = true
        }
        deck[selectedCards[0]].isSelected = false
        deck[selectedCards[1]].isSelected = false
        deck[selectedCards[2]].isSelected = false
        
        score += isSet ? Score.validSet : Score.invalidSet
    }
    
    private func isSet() -> Bool {
        let selectedCards = indicesOfSelectedCards
        let card1 = deck[selectedCards[0]]
        let card2 = deck[selectedCards[1]]
        let card3 = deck[selectedCards[2]]
        let firstFeatureDifferent = card1.firstFeature != card2.firstFeature && card2.firstFeature != card3.firstFeature && card3.firstFeature != card1.firstFeature
        let secondFeatureDifferent = card1.secondFeature != card2.secondFeature && card2.secondFeature != card3.secondFeature && card3.secondFeature != card1.secondFeature
        let thirdFeatureDifferent = card1.thirdFeature != card2.thirdFeature && card2.thirdFeature != card3.thirdFeature && card3.thirdFeature != card1.thirdFeature
        let fourthFeatureDifferent = card1.fourthFeature != card2.fourthFeature && card2.fourthFeature != card3.fourthFeature && card3.fourthFeature != card1.fourthFeature
        return firstFeatureDifferent && secondFeatureDifferent && thirdFeatureDifferent && fourthFeatureDifferent
    }
    
    mutating func choose(card: Card) {
        let cardIndex = deck.firstIndex(matching: card)!
        deck[cardIndex].isSelected = !deck[cardIndex].isSelected
        if indicesOfSelectedCards.count == 3 {
            evaluateSet()
        }
    }
    
    struct Card: CustomStringConvertible, Identifiable {
        
        var id = UUID()
        var description: String {
            return "\(firstFeature), \(secondFeature), \(thirdFeature), \(fourthFeature)"
        }
        
        var firstFeature: FirstFeature
        var secondFeature: SecondFeature
        var thirdFeature: ThirdFeature
        var fourthFeature: FourthFeature
        var isSelected = false
        var isDealt = false
        var isInSet = false
        
        static func ==(lhs: Card, rhs: Card) -> Bool {
            return (
                (lhs.firstFeature == rhs.firstFeature) &&
                    (lhs.secondFeature == rhs.secondFeature) &&
                    (lhs.thirdFeature == rhs.thirdFeature) &&
                    (lhs.fourthFeature == rhs.fourthFeature)
            )
        }
    }

    
}

private struct Score {
    static let validSet = 3
    static let invalidSet = -5
}
