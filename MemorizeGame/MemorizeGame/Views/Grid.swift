//
//  Grid.swift
//  MemorizeGame
//
//  Created by Findaaron on 2020/6/14.
//  Copyright © 2020 Findaaron. All rights reserved.
//

import SwiftUI

struct Grid<Item, ItemView>: View where Item: Identifiable, ItemView: View {
    var items: [Item]
    var viewForItem:(Item) -> ItemView
    
    init(_ items: [Item], viewForItem: @escaping (Item) -> ItemView) {
        self.items = items
        self.viewForItem = viewForItem
    }
    
    var body: some View {
        GeometryReader { geometry in
            self.body(for: GridLayout(itemCount: self.items.count, in: geometry.size))
        }
    }
    
    func body(for layout: GridLayout) -> some View {
        ForEach(items){ item in
            self.body(for: item, in: layout)
            
        }
    }
    
    func body(for item: Item, in layout: GridLayout) -> some View {
        
        let index = items.firstIndex(matching: item)!
        return viewForItem(item)
                .frame(width: layout.itemSize.width, height: layout.itemSize.height)
                .position(layout.location(ofItemAt: index))
            
        
    }
}



