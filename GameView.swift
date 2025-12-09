//
//  SwiftUIView.swift
//  MemoryGame
//
//  Created by SHANE COFFEY on 12/9/25.
//

import SwiftUI

struct GameView: View {
    
    @State var cards: [Card]
    @State var columns: Int
    @State var rows: Int
    
    var body: some View {
        // display cards in grid
        let columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
        LazyVGrid(columns: columns){
            ForEach(cards, id: \.self){ card in
                
            }
        }
    }
}
