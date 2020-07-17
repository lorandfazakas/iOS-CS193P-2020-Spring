//
//  Cardify.swift
//  SetGame
//
//  Created by Fazakas Loránd on 2020. 07. 14..
//  Copyright © 2020. Lorand Fazakas. All rights reserved.
//

import SwiftUI

struct Cardify: AnimatableModifier {
    
    var isSelected: Bool
    
    func body(content: Content) -> some View {
        ZStack {
            Group {
                RoundedRectangle(cornerRadius: cornerRadius).fill(SwiftUI.Color.white)
                RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLineWidth).foregroundColor(isSelected ? .orange : .black)
                content
            }
        }
    }
    
    private let cornerRadius: CGFloat = 10.0
    private let edgeLineWidth: CGFloat = 3
}

extension View {
    func cardify(isSelected: Bool) -> some View {
        self.modifier(Cardify(isSelected: isSelected))
    }
}
