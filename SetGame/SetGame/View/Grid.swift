//
//  Grid.swift
//  SetGame
//
//  Created by Fazakas Loránd on 2020. 07. 08..
//  Copyright © 2020. Lorand Fazakas. All rights reserved.
//

import SwiftUI

struct Grid<Item, ItemView>: View where Item: Identifiable, ItemView: View {
    private var items: Array<Item>
    private var viewForItem: (Item) -> ItemView
    
    init(_ items: Array<Item>, viewForItem: @escaping (Item) -> ItemView) {
        self.items = items
        self.viewForItem = viewForItem
    }
    
    var body: some View {
        GeometryReader { geometry in
            self.body(for: GridLayout(itemCount: self.items.count, in: geometry.size))
        }
    }
    
    private func body(for layout: GridLayout) -> some View {
//        var viewForItems = [View]
//        for item in items {
//            viewForItems.append(self.body(for: item, in: layout))
//        }
//        return viewForItems
        ForEach(items) { item in
            self.body(for: item, in: layout)
        }
    }
    
    private func body(for item: Item, in layout: GridLayout) -> some View {
        let index = items.firstIndex(matching: item)!
        return viewForItem(item)
            .frame(width: layout.itemSize.width, height: layout.itemSize.height)
            .position(layout.location(ofItemAt: index))
    }
    
}
