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
                ForEach($cards){card in
                    CardView(card: card)
                        .onTapGesture {
                            //card.isFaceUp = true
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
        
}
