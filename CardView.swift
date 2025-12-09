//
//  SwiftUIView.swift
//  MemoryGame
//
//  Created by SHANE COFFEY on 12/9/25.
//

import SwiftUI

struct CardView: View {
    @Binding var card: Card
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 5)
                .foregroundStyle(.blue)
            
            if card.isFaceUp {
                Image(card.imageName)
            } else {
                Image("FaceDownCard")
            }
        }
    }
}
