//
//  ShapeCardView.swift
//  SetGame
//
//  Created by Fazakas Loránd on 2020. 07. 15..
//  Copyright © 2020. Lorand Fazakas. All rights reserved.
//

import SwiftUI

struct ShapeCardView: View {
    @ObservedObject var shapeSetGame: ShapeSetGame
    
    var card: Card<Shape, Color, Shade, NumberOfElements>

    var body: some View {
        GeometryReader { geometry in
            self.body(for: geometry.size)
        }
    }
    
    @ViewBuilder
    private func body(for size: CGSize) -> some View {
        VStack {
            cardContent()
                .foregroundColor(color())
        }
        .cardify()
    }
    
    @ViewBuilder
    func cardContent() -> some View {
        ForEach((1...card.fourthFeature.rawValue), id: \.self) {_ in
            self.shape()
                .frame(maxWidth: .infinity)
                .aspectRatio(contentMode: .fit)
                .padding(5)
        }
    }
    
    @ViewBuilder
    func shape() -> some View {
        if card.firstFeature == .diamond {
            Diamond()
        } else if card.firstFeature == .circle {
            Circle()
        } else if card.firstFeature == .squiggle {
            Squiggle()
        } else {
            EmptyView()
        }
    }
    
    func color() -> SwiftUI.Color {
        switch card.secondFeature {
        case .blue:
            return SwiftUI.Color(.blue)
        case .green:
            return SwiftUI.Color(.green)
        case .red:
            return SwiftUI.Color(.red)
        }
    }
}

struct ShapeCardView_Previews: PreviewProvider {
    static var previews: some View {
        let game = ShapeSetGame()
        return ShapeCardView(shapeSetGame: game, card: game.faceUpCards[1])
    }
}



