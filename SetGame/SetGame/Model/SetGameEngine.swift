//
//  SetGame.swift
//  SetGame
//
//  Created by Fazakas Loránd on 2020. 07. 14..
//  Copyright © 2020. Lorand Fazakas. All rights reserved.
//

import Foundation

struct SetGameEngine<FirstFeature, SecondFeature, ThirdFeature, FourthFeature> where
    FirstFeature: CaseIterable, FirstFeature: Hashable,
    SecondFeature: CaseIterable, SecondFeature: Hashable,
    ThirdFeature: CaseIterable, ThirdFeature: Hashable,
    FourthFeature: CaseIterable, FourthFeature: Hashable {
    
    private(set) var deck = Set<Card<FirstFeature, SecondFeature, ThirdFeature, FourthFeature>>()
    private(set) var faceUpCards = Set<Card<FirstFeature, SecondFeature, ThirdFeature, FourthFeature>>()
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
                        deck.insert(Card<FirstFeature, SecondFeature, ThirdFeature, FourthFeature>(firstFeature: firstFeature, secondFeature: secondFeature, thirdFeature: thirdFeature, fourthFeature: fourthFeature))
                    }
                }
            }
        }
    }
    
    @discardableResult
    mutating func draw(numberOfCards: Int) -> Set<Card<FirstFeature, SecondFeature, ThirdFeature, FourthFeature>> {
        var drawnCards = Set<Card<FirstFeature, SecondFeature, ThirdFeature, FourthFeature>>()
        for _ in 1...numberOfCards {
            if let drawnCard = deck.randomElement() {
                drawnCards.insert(drawnCard)
                faceUpCards.insert(drawnCard)
                deck.remove(drawnCard)
            } else {
                break
            }
        }
        return drawnCards
    }
    
    mutating func evaluateSet(_ card1: Card<FirstFeature, SecondFeature, ThirdFeature, FourthFeature>, _ card2: Card<FirstFeature, SecondFeature, ThirdFeature, FourthFeature>, _ card3: Card<FirstFeature, SecondFeature, ThirdFeature, FourthFeature>) -> Bool {
        guard faceUpCards.contains(card1) && faceUpCards.contains(card2) && faceUpCards.contains(card3) else {
            return false
        }
        let isSet = self.isSet(card1, card2, card3)
        if isSet {
            faceUpCards.remove(card1)
            faceUpCards.remove(card2)
            faceUpCards.remove(card3)
        }
        score += isSet ? Score.validSet : Score.invalidSet
        return isSet
    }
    
    private func isSet(_ card1: Card<FirstFeature, SecondFeature, ThirdFeature, FourthFeature>, _ card2: Card<FirstFeature, SecondFeature, ThirdFeature, FourthFeature>, _ card3: Card<FirstFeature, SecondFeature, ThirdFeature, FourthFeature>) -> Bool {
        let firstFeatureDifferent = card1.firstFeature != card2.firstFeature && card2.firstFeature != card3.firstFeature && card3.firstFeature != card1.firstFeature
        let secondFeatureDifferent = card1.secondFeature != card2.secondFeature && card2.secondFeature != card3.secondFeature && card3.secondFeature != card1.secondFeature
        let thirdFeatureDifferent = card1.thirdFeature != card2.thirdFeature && card2.thirdFeature != card3.thirdFeature && card3.thirdFeature != card1.thirdFeature
        let fourthFeatureDifferent = card1.fourthFeature != card2.fourthFeature && card2.fourthFeature != card3.fourthFeature && card3.fourthFeature != card1.fourthFeature
        return firstFeatureDifferent && secondFeatureDifferent && thirdFeatureDifferent && fourthFeatureDifferent
    }
    
    
    
}

private struct Score {
    static let validSet = 3
    static let invalidSet = -5
}
