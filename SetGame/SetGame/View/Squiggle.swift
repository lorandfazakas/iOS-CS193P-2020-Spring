//
//  Squiggle.swift
//  SetGame
//
//  Created by Fazakas Loránd on 2020. 07. 15..
//  Copyright © 2020. Lorand Fazakas. All rights reserved.
//

import SwiftUI

struct Squiggle: SwiftUI.Shape {
 
    func path(in rect: CGRect) -> Path {
        var path = Path()
        var point, cp1, cp2: CGPoint
        
        point = CGPoint(x: rect.origin.x + rect.size.width*0.05, y: rect.origin.y + rect.size.height*0.40)
        path.move(to: point)
        
        point = CGPoint(x: rect.origin.x + rect.size.width*0.35, y: rect.origin.y + rect.size.height*0.25)
        cp1 = CGPoint(x: rect.origin.x + rect.size.width*0.09, y: rect.origin.y + rect.size.height*0.15)
        cp2 = CGPoint(x: rect.origin.x + rect.size.width*0.18, y: rect.origin.y + rect.size.height*0.10)
        path.addCurve(to: point, control1: cp1, control2: cp2)
        
        point = CGPoint(x: rect.origin.x + rect.size.width*0.75, y: rect.origin.y + rect.size.height*0.30)
        cp1 = CGPoint(x: rect.origin.x + rect.size.width*0.40, y: rect.origin.y + rect.size.height*0.30)
        cp2 = CGPoint(x: rect.origin.x + rect.size.width*0.60, y: rect.origin.y + rect.size.height*0.45)
        path.addCurve(to: point, control1: cp1, control2: cp2)
        
        point = CGPoint(x: rect.origin.x + rect.size.width*0.97, y: rect.origin.y + rect.size.height*0.35)
        cp1 = CGPoint(x: rect.origin.x + rect.size.width*0.87, y: rect.origin.y + rect.size.height*0.15)
        cp2 = CGPoint(x: rect.origin.x + rect.size.width*0.98, y: rect.origin.y + rect.size.height*0.00)
        path.addCurve(to: point, control1: cp1, control2: cp2)
        
        point = CGPoint(x: rect.origin.x + rect.size.width*0.45, y: rect.origin.y + rect.size.height*0.85)
        cp1 = CGPoint(x: rect.origin.x + rect.size.width*0.95, y: rect.origin.y + rect.size.height*1.10)
        cp2 = CGPoint(x: rect.origin.x + rect.size.width*0.50, y: rect.origin.y + rect.size.height*0.95)
        path.addCurve(to: point, control1: cp1, control2: cp2)
        
        point = CGPoint(x: rect.origin.x + rect.size.width*0.25, y: rect.origin.y + rect.size.height*0.85)
        cp1 = CGPoint(x: rect.origin.x + rect.size.width*0.40, y: rect.origin.y + rect.size.height*0.80)
        cp2 = CGPoint(x: rect.origin.x + rect.size.width*0.35, y: rect.origin.y + rect.size.height*0.75)
        path.addCurve(to: point, control1: cp1, control2: cp2)
        
        point = CGPoint(x: rect.origin.x + rect.size.width*0.05, y: rect.origin.y + rect.size.height*0.40)
        cp1 = CGPoint(x: rect.origin.x + rect.size.width*0.00, y: rect.origin.y + rect.size.height*1.10)
        cp2 = CGPoint(x: rect.origin.x + rect.size.width*0.005, y: rect.origin.y + rect.size.height*0.60)
        path.addCurve(to: point, control1: cp1, control2: cp2)
        return path
    }
    
}
