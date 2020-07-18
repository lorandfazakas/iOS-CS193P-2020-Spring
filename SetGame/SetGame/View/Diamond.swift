//
//  Diamond.swift
//  SetGame
//
//  Created by Fazakas Loránd on 2020. 07. 15..
//  Copyright © 2020. Lorand Fazakas. All rights reserved.
//

import SwiftUI

struct Diamond: Shape {

    func path(in rect: CGRect) -> Path {
        let topCenter = CGPoint(x: rect.midX, y: rect.minY)
        let centerRight = CGPoint(x: rect.maxX, y: rect.midY)
        let bottomCenter = CGPoint(x: rect.midX, y: rect.maxY)
        let centerLeft = CGPoint(x: rect.minX, y: rect.midY)
        var path = Path()
        path.move(to: topCenter)
        path.addLine(to: centerRight)
        path.addLine(to: bottomCenter)
        path.addLine(to: centerLeft)
        path.addLine(to: topCenter)
        return path
    }
}
