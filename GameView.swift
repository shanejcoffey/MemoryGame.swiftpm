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
    @State var cardShown: [Bool]
    var amountOfCards: Int {
        return numRows * numColumns
    }
    
    var body: some View {
        VStack{
            
            // makes a GridItem for each column
            let columns = Array(repeating: GridItem(.flexible()), count: numColumns)
            
            
            LazyVGrid(columns: columns){
                ForEach(cards.indices){ i in
                    if(!cards[i].isMatched) {
                        CardView(card: cards[i])
                            .frame(maxWidth: 100, maxHeight: 150)
                            .onTapGesture {
                                if !cards[i].isFaceUp && selected == -1 {
                                    selected = i
                                    cards[i].isFaceUp = true
                                    print("card \(i) is \(cards[i].isFaceUp) face up")
                                 } else if !cards[i].isFaceUp {
                                     if cards[selected].imageName == cards[i].imageName {
                                            cards[i].isFaceUp = true
                                            withAnimation(.easeIn(duration: 0.3).delay(1)) {
                                                    print("hiding cards")
                                                cardShown[i] = false
                                                cardShown[selected] = false
                                                print("maybe done hiding")
                                                selected = -1
                                            }
                                     }
                                 }
                            }
                        /* if selected == nil {
                                    selected = i
                                    cards[i].isFaceUp = true
                                } else if let first = selected, first != i {
                                    if cards[first].imageName == cards[i].imageName {
                                        cards[i].isFaceUp = true
                                        //chatgpt
                                   // DispatchQueue.main.asyncAfter(deadline: .now() + 1)
                                        //{
                                            //withAnimation(.easeIn(duration: 0.3).delay(1)) {
                                                cards[i].isMatched = true
                                                cards[first].isMatched = true
                                                selected = nil
                                        //}

                                       // }
                                        
                                    } else {
                                        selected = nil
                                    }
                                }
                                 */
                            }
                    }
                }
            }
            /*.onAppear(){
                cardShown = Array(repeating: true, count: amountOfCards)
            }*/
        }
    func amountOfCardsUp() -> Int {
                    var count = 0
                    for i in 0..<cards.count{
                        if cards[i].isFaceUp {
                            count += 1
                        }
                    }
                    return count
                }
        
    }
    

    #Preview {
        GameView(cards: [Card(imageName: "AceSpades"), Card(imageName: "AceSpades"), Card(imageName: "AceSpades"), Card(imageName: "AceSpades")], numColumns: 2, numRows: 2, cardShown: [true,true,true, true])
    }

