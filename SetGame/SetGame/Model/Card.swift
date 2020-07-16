//
//  Card.swift
//  SetGame
//
//  Created by Fazakas Loránd on 2020. 07. 15..
//  Copyright © 2020. Lorand Fazakas. All rights reserved.
//

import Foundation

struct Card<FirstFeature, SecondFeature, ThirdFeature, FourthFeature>: CustomStringConvertible, Hashable, Identifiable where
    FirstFeature: Hashable, SecondFeature: Hashable, ThirdFeature: Hashable, FourthFeature: Hashable {
    
    var id = UUID()
    var description: String {
        return "\(firstFeature), \(secondFeature), \(thirdFeature), \(fourthFeature)"
    }
    
    var firstFeature: FirstFeature
    var secondFeature: SecondFeature
    var thirdFeature: ThirdFeature
    var fourthFeature: FourthFeature
    
    static func ==(lhs: Card, rhs: Card) -> Bool {
        return (
            (lhs.firstFeature == rhs.firstFeature) &&
                (lhs.secondFeature == rhs.secondFeature) &&
                (lhs.thirdFeature == rhs.thirdFeature) &&
                (lhs.fourthFeature == rhs.fourthFeature)
        )
    }
}
