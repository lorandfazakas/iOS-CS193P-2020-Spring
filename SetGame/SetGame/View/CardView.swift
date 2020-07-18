//
//  CardView.swift
//  SetGame
//
//  Created by Fazakas Loránd on 2020. 07. 15..
//  Copyright © 2020. Lorand Fazakas. All rights reserved.
//

import SwiftUI

struct CardView: View {
    
    var card: ShapeSetGame.Card

    var body: some View {
        GeometryReader { geometry in
            self.body(for: geometry.size)
        }
    }
    
    @ViewBuilder
    private func body(for size: CGSize) -> some View {
        ZStack {
                RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
                RoundedRectangle(cornerRadius: cornerRadius).stroke(cardStrokeColor, lineWidth: edgeLineWidth)
            VStack {
                ForEach((1...card.shapeCount.rawValue), id: \.self) {_ in
                        self.shape(for: size)
                            .frame(maxWidth: .infinity)
                            .aspectRatio(contentMode: .fit)
                            .padding(5)
                }
            }
        }
    }
    
    func shape(for size: CGSize) -> some View {
        var shape: AnyShape
        switch card.shape {
        case .diamond:
                shape = AnyShape(Diamond())
        case .squiggle:
                shape = AnyShape(Squiggle())
        case .circle:
                shape = AnyShape(Circle())
        }
        return ZStack {
            shape.fill(Color.white)
            shape.fill(shapeColor).opacity(shapeShade)
            shape.stroke(shapeColor).opacity(card.shade == .unfilled ? 1 : shapeShade)
        }
    }
    
    private var shapeColor: Color {
        switch card.color {
        case .blue:
            return Color(.blue)
        case .green:
            return Color(.green)
        case .red:
            return Color(.red)
        }
    }
    
    private var shapeShade: Double {
        switch card.shade {
        case .semitransparent:
            return 0.3
        case .solid:
            return 1
        case .unfilled:
            return 0
        }
    }
    
    private var cardStrokeColor: Color {
        if card.isInSet == nil && !card.isSelected {
            return .black
        }
        
        if let isInSet = card.isInSet {
            if isInSet {
                return .green
            } else {
                return .red
            }
        } else {
            return .orange
        }
    }
    
    private let edgeLineWidth: CGFloat = 3
    private let cornerRadius: CGFloat = 10.0
}

struct ShapeCardView_Previews: PreviewProvider {
    static var previews: some View {
        let game = SetGame()
        return CardView(card: game.faceUpCards[1])
    }
}



