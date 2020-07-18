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
        VStack {
            Grid(shapeSetGame.faceUpCards) { card in
                CardView(card: card)
                .onTapGesture {
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
                }, label: {Text("Deal 3 more cards")} )
            }
            .padding()
        }
    }
}

struct ShapeSetGameView_Previews: PreviewProvider {
    static var previews: some View {
        SetGameView(shapeSetGame: SetGame())
    }
}
