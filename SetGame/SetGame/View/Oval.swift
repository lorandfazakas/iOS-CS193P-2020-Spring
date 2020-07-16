//
//  Oval.swift
//  SetGame
//
//  Created by Fazakas Loránd on 2020. 07. 15..
//  Copyright © 2020. Lorand Fazakas. All rights reserved.
//

import SwiftUI

struct Oval: SwiftUI.Shape {
    
    private let shapeMargin: CGFloat = 0.15

    func path(in rect: CGRect) -> Path {
        let margin = min(rect.size.width, rect.size.height) * shapeMargin
        let rectWithMargin = CGRect(x: rect.origin.x + margin,
                                    y: rect.origin.y + margin,
                                    width: rect.size.width - (margin * 2),
                                    height: rect.size.height - (margin * 2))
        return Path(ovalIn: rectWithMargin)
    }
}
