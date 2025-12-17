// 
//  SwiftUIView.swift
//  MemoryGame
//
//  Created by SHANE COFFEY on 12/9/25.
//

import SwiftUI

struct GameView: View {

    @State var cards: [Card]
    @State var numColumns: Int
    @State var numRows: Int
    @State var selected: Int = -1
    @State var numCardsLeft: Int = 0


    var body: some View {
        ZStack {
            VStack {
                
                // makes a GridItem for each column
                let columns = Array(
                    repeating: GridItem(.flexible()),
                    count: numColumns
                )
                LazyVGrid(columns: columns) {
                    ForEach(cards.indices) { i in
                        CardView(card: cards[i])
                            .frame(maxWidth: 100, maxHeight: 150)
                            .onTapGesture {
                                if !cards[i].isFaceUp && selected == -1 {
                                    selected = i
                                    cards[i].isFaceUp = true
                                    print(
                                        "card \(i) is \(cards[i].isFaceUp) face up"
                                    )
                                } else if !cards[i].isFaceUp {
                                    cards[i].isFaceUp = true
                                    DispatchQueue.main.asyncAfter(
                                        deadline: .now() + 1
                                    ) {  // delays for one second
                                        if cards[selected].imageName
                                            == cards[i].imageName
                                        {
                                            cards[i].isMatched = true
                                            cards[selected].isMatched = true
                                            numCardsLeft -= 2
                                        } else {
                                            cards[i].isFaceUp = false
                                            cards[selected].isFaceUp = false
                                        }
                                        selected = -1
                                    }
                                }
                            }
                    }
                }
            }
            
            if numCardsLeft == 0 {
                VStack {
                    Text("You Win!")
                        .font(.largeTitle)
                        .bold()
                        .foregroundStyle(.green)
                }
                .padding()
                .background(.ultraThinMaterial) // this is cool, provides a small background behind text
                .cornerRadius(20)
            }
        }
        .onAppear {
            numCardsLeft = cards.count
        }
    }
}

#Preview {
    GameView(
        cards: [
            Card(imageName: "AceSpades"), Card(imageName: "AceSpades"),
            Card(imageName: "AceSpades"), Card(imageName: "AceSpades"),
        ],
        numColumns: 2,
        numRows: 2
    )
}
