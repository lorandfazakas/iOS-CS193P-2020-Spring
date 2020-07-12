//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Fazakas Loránd on 2020. 07. 04..
//  Copyright © 2020. Lorand Fazakas. All rights reserved.
//

import SwiftUI


class EmojiMemoryGame: ObservableObject {
    
    @Published private var model: MemoryGame<String>
    private(set) var theme = themes.randomElement()!
    
    static var themes = [
        Theme(name: "Halloween", emojis: ["🎃", "👻", "🕷", "👹", "💀"], numberOfPairsOfCards: 4, color: .orange),
        Theme(name: "Animals", emojis: ["🦓", "🦘", "🦧", "🦔", "🦒"], numberOfPairsOfCards: nil, color: .green),
        Theme(name: "Sports", emojis: ["🏄🏻‍♀️", "🏓", "🏈", "⚽️", "🥎", "🏑", "🏹"], numberOfPairsOfCards: nil, color: .blue),
        Theme(name: "Faces", emojis: ["😀", "😃", "🤪", "🥶", "🤣"], numberOfPairsOfCards: 5, color: .yellow),
        Theme(name: "Vehicles", emojis: ["🚗", "🚤", "🚠", "🛳"], numberOfPairsOfCards: 3, color: .gray),
        Theme(name: "Flags", emojis: ["🇦🇷", "🇭🇺", "🇨🇦", "🇪🇸", "🇬🇧", "🇭🇷", "🇯🇵"], numberOfPairsOfCards: 4, color: .red),
    ]
    
    init() {
        model = EmojiMemoryGame.createMemoryGame(with: theme)
    }
    
    static func createMemoryGame(with theme: Theme) -> MemoryGame<String> {
        let numberOfPairsOfCard = theme.numberOfPairsOfCards ?? Int.random(in: 2...theme.emojis.count)
        return MemoryGame<String>(numberOfPairsOfCards: numberOfPairsOfCard)  { theme.emojis[$0] }
    }
    
    func newGame() {
        self.theme = Self.themes.randomElement()!
        model = Self.createMemoryGame(with: theme)
    }
    
    // MARK: - Access to the Model
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    var score: Int {
        model.score
    }
    
    // MARK: - Intent(s)
    
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
    
    struct Theme {
        var name: String
        var emojis: [String]
        var numberOfPairsOfCards: Int?
        var color: Color
        
        init(name: String, emojis: [String], numberOfPairsOfCards: Int?, color: Color) {
            self.name = name
            self.emojis = emojis
            self.numberOfPairsOfCards = numberOfPairsOfCards
            self.color = color
        }
    }
}


