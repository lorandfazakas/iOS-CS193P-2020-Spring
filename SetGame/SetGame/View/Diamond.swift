//
//  Diamond.swift
//  SetGame
//
//  Created by Fazakas Loránd on 2020. 07. 15..
//  Copyright © 2020. Lorand Fazakas. All rights reserved.
//

import SwiftUI

struct Diamond: SwiftUI.Shape {
    
    private let shapeMargin: CGFloat = 0.15

    func path(in rect: CGRect) -> Path {
        let margin = min(rect.size.width, rect.size.height) * shapeMargin
        let topCenter = CGPoint(x: rect.midX, y: rect.minY + margin)
        let centerRight = CGPoint(x: rect.maxX - margin, y: rect.midY)
        let bottomCenter = CGPoint(x: rect.midX, y: rect.maxY - margin)
        let centerLeft = CGPoint(x: rect.minX + margin, y: rect.midY)
        var path = Path()
        path.move(to: topCenter)
        path.addLine(to: centerRight)
        path.addLine(to: bottomCenter)
        path.addLine(to: centerLeft)
        path.addLine(to: topCenter)
        return path
    }
}
