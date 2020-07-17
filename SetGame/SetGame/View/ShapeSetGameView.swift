//
//  ShapeSetGameView.swift
//  SetGame
//
//  Created by Fazakas Loránd on 2020. 07. 14..
//  Copyright © 2020. Lorand Fazakas. All rights reserved.
//

import SwiftUI

struct ShapeSetGameView: View {
    @ObservedObject var shapeSetGame: ShapeSetGame
    
    var body: some View {
        VStack {
            Grid(shapeSetGame.faceUpCards) { card in
                ShapeCardView(shapeSetGame: self.shapeSetGame, card: card).onTapGesture {
                    self.shapeSetGame.choose(card: card)
                }
                .aspectRatio(2/3, contentMode: .fit)
                .padding(5)
            }
            .padding()
            
            HStack {
                Button(action: {
                    self.shapeSetGame.newGame()
                }, label: {Text("New Game")} )
                Text("Score: \(self.shapeSetGame.score)")
                Button(action: {
                    self.shapeSetGame.draw(numberOfCards: 3)
                }, label: {Text("Draw")} )
            }
            .padding()
        }
    }
}

struct ShapeSetGameView_Previews: PreviewProvider {
    static var previews: some View {
        ShapeSetGameView(shapeSetGame: ShapeSetGame())
    }
}
