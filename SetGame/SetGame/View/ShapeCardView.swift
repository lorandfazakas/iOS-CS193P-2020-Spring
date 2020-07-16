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
    
    var card: Card<Shape, Color, Shade, NumberOfElements>
    
    var body: some View {
        GeometryReader { geometry in
            for _ in getElementContainers(for: geometry, numberOfElements: card.fourthFeature.rawValue) {
                
            }
            self.shapeSetGame.path(forShape: self.card.firstFeature)
        }
    }
    
    
    
    private func getElementContainers(for geometry: GeometryProxy, numberOfElements: NumberOfElements) -> [CGRect] {
        let maxWidthAndHeight = max(geometry.size.width, geometry.size.height)
        let eachRectSize = CGSize(width: maxWidthAndHeight/3, height: maxWidthAndHeight/3)
        var containers = [CGRect]()
        switch numberOfElements {
        case .one:
            containers.append(containerForOneElement(for: geometry, sizeOfEachRect: eachRectSize))
        case .two:
            containers += containerForTwoElements(for: geometry, sizeOfEachRect: eachRectSize)
        case .three:
            containers += containerForThreeElements(for: geometry, sizeOfEachRect: eachRectSize)
        }
        return containers
    }
    
    
    private func containerForOneElement(for geometry: GeometryProxy, sizeOfEachRect: CGSize) -> CGRect {
        let x = geometry.frame(in: .local).midX - sizeOfEachRect.width / 2
        let y = geometry.frame(in: .local).midY - sizeOfEachRect.height / 2
        let originPoint = CGPoint(x: x, y: y)
        return CGRect(origin: originPoint, size: sizeOfEachRect)
    }
    
    private func containerForTwoElements(for geometry: GeometryProxy,sizeOfEachRect: CGSize) -> [CGRect] {
        let rectForOne = containerForOneElement(for: geometry, sizeOfEachRect: sizeOfEachRect)
        let rect1, rect2: CGRect
        if geometry.frame(in: .local).width > geometry.frame(in: .local).height {
            rect1 = rectForOne.offsetBy(dx: sizeOfEachRect.width/2, dy: 0)
            rect2 = rectForOne.offsetBy(dx: -(sizeOfEachRect.width/2), dy: 0)
        }
        else {
            rect1 = rectForOne.offsetBy(dx: 0, dy: sizeOfEachRect.height/2)
            rect2 = rectForOne.offsetBy(dx: 0, dy: -(sizeOfEachRect.height/2))
        }
        return [rect1, rect2]
    }
    
    private func containerForThreeElements(for geometry: GeometryProxy,sizeOfEachRect: CGSize) -> [CGRect] {
        let centerRect = containerForOneElement(for: geometry, sizeOfEachRect: sizeOfEachRect)
        let rect1, rect2: CGRect
        if geometry.frame(in: .local).width > geometry.frame(in: .local).height {
            rect1 = CGRect(x: centerRect.minX - sizeOfEachRect.width,
                           y: centerRect.minY,
                           width: sizeOfEachRect.width,
                           height: sizeOfEachRect.height)
            
            rect2 = CGRect(x: centerRect.maxX,
                           y: centerRect.minY,
                           width: sizeOfEachRect.width,
                           height: sizeOfEachRect.height)
        }
        else {
            rect1 = CGRect(x: centerRect.minX,
                           y: centerRect.minY - sizeOfEachRect.height,
                           width: sizeOfEachRect.width,
                           height: sizeOfEachRect.height)
            
            rect2 = CGRect(x: centerRect.minX,
                           y: centerRect.maxY,
                           width: sizeOfEachRect.width,
                           height: sizeOfEachRect.height)
        }
        return [centerRect, rect1, rect2]
    }
    
    
    
    
    
}

struct ShapeCardView_Previews: PreviewProvider {
    static var previews: some View {
        let game = ShapeSetGame()
        return ShapeCardView(shapeSetGame: game, card: game.faceUpCards[0])
    }
}
