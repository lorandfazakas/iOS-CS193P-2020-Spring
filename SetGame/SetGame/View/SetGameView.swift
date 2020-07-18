//
//  SetGameView.swift
//  SetGame
//
//  Created by Fazakas Loránd on 2020. 07. 14..
//  Copyright © 2020. Lorand Fazakas. All rights reserved.
//

import SwiftUI

struct SetGameView: View {
    @ObservedObject var shapeSetGame: SetGame
    
    var body: some View {
        GeometryReader { geometry in
            self.body(for: geometry.size)
        }
    }
    
    private func body(for size: CGSize) -> some View {
        VStack {
            Grid(shapeSetGame.faceUpCards) { card in
                CardView(card: card)
                .onTapGesture {
                    withAnimation(.easeInOut(duration: 0.5)) {
                        self.shapeSetGame.choose(card: card)
                    }
                }
                .aspectRatio(2/3, contentMode: .fit)
                .padding(5)
                .transition(AnyTransition.offset(self.generateRandomOffset(for: size)))
            }
            .onAppear(perform: {
                withAnimation(.easeInOut(duration: 1.5)) {
                    self.shapeSetGame.newGame()
                }
            })
            .padding()
            
            
            HStack {
                Button(action: {
                    withAnimation(.easeInOut(duration: 1.5)) {
                        self.shapeSetGame.newGame()
                    }
                }, label: {Text("New Game")} )
                Text("Score: \(self.shapeSetGame.score)")
                Button(action: {
                    withAnimation(.spring()) {
                        self.shapeSetGame.draw(numberOfCards: 3)
                    }
                }, label: {Text("Deal 3 more cards")} )
                    .disabled(self.shapeSetGame.remainingCardsInDeck == 0)
            }
            .padding()
        }
    }
    
    private func generateRandomOffset(for size: CGSize) -> CGSize {
        let radius = 1.5 * sqrt(pow(size.width, 2) + pow(size.height, 2))
        let centerX = size.width/2
        let centerY = size.height/2
        
        let randomAngle = CGFloat(Double.random(in: 0..<360))
        let x = centerX + radius * cos(randomAngle * CGFloat(Double.pi) / 180)
        let y = centerY + radius * sin(randomAngle * CGFloat(Double.pi) / 180)
        
        return CGSize(width: x, height: y)
    }
}

struct ShapeSetGameView_Previews: PreviewProvider {
    static var previews: some View {
        SetGameView(shapeSetGame: SetGame())
    }
}
