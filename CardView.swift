//
//  SwiftUIView.swift
//  MemoryGame
//
//  Created by SHANE COFFEY on 12/9/25.
//

import SwiftUI

struct CardView: View {
    @ObservedObject var card: Card
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 5)
                .foregroundStyle(.blue)
            
            if card.isFaceUp {
                Image(card.imageName)
                    .resizable()
            } else {
                Image("FaceDownCard")
                    .resizable()
            }
        }
    }
}
