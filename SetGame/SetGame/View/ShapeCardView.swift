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
    
    var card: SetGameEngine<Shape, Color, Shade, NumberOfElements>.Card

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
        .cardify(isSelected: card.isSelected)
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
        Group {
            if card.firstFeature == .diamond {
                ZStack {
                    Diamond().fill(color()).opacity(shade())
                    Diamond().stroke(color(), lineWidth: edgeLineWidth)
                }
            } else if card.firstFeature == .circle {
                ZStack {
                    Circle().fill(color()).opacity(shade())
                    Circle().stroke(color(), lineWidth: edgeLineWidth)
                }
            } else if card.firstFeature == .squiggle {
                ZStack {
                    Squiggle().fill(color()).opacity(shade())
                    Squiggle().stroke(color(), lineWidth: edgeLineWidth)
                }
            }
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
    
    func shade() -> Double {
        switch card.thirdFeature {
        case .shaded:
            return 0.3
        case .solid:
            return 1
        case .unfilled:
            return 0
        }
    }
    
    private let edgeLineWidth: CGFloat = 3
}

struct ShapeCardView_Previews: PreviewProvider {
    static var previews: some View {
        let game = ShapeSetGame()
        return ShapeCardView(shapeSetGame: game, card: game.faceUpCards[1])
    }
}



