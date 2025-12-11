//
//  SwiftUIView.swift
//  MemoryGame
//
//  Created by SHANE COFFEY on 12/9/25.
//

import SwiftUI

struct GameView: View {
    
    @State var cards: [Card] = [Card(imageName: "aceSpades")]
    @State var columns: Int
    @State var rows: Int
    @Binding var amountOfCards: Int
    var body: some View {
        // display cards in grid
        VStack{
            
            var columnss = Array(repeating: GridItem(.flexible()), count: columns)
            
            LazyVGrid(columns: columnss){
                ForEach(cards.indices){i in
                    CardView(card: $cards[i])
                        .onTapGesture {
                            cards[i].isFaceUp.toggle()
                        }
                }
            }
        }
        .onAppear(){
            for _ in 0..<(columns*rows){
                cards.append(Card(imageName: "aceSpades"))
            }
        }
    }
    func amountOfCardsUp(){
        var count = 0
        for i in 0..<cards.count{
            if cards[i].isFaceUp{
                count += 1
            }
        }
        if count >= 2{
            
        }
    }
}
