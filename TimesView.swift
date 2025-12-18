//
//  SwiftUIView.swift
//  MemoryGame
//
//  Created by DIEGO CHAVEZ on 12/17/25.
//

import SwiftUI

struct TimesView: View {

    @Binding var bestSuperEasyTimes: [Int]
    @Binding var bestEasyTimes: [Int]
    @Binding var bestMediumTimes: [Int]
    @Binding var bestHardTimes: [Int]

    var body: some View {
        VStack {
            HStack {
                List {
                    Text("Super Easy")
                    ForEach(0..<bestSuperEasyTimes.count, id: \.self) { i in
                        Text(String(format: "%02d:%02d",
                                    bestSuperEasyTimes[i] / 60,
                                    bestSuperEasyTimes[i] % 60))
                    }
                }
                
                List {
                    Text("Easy")
                    ForEach(0..<bestEasyTimes.count, id: \.self) { i in
                        Text(String(format: "%02d:%02d",
                                    bestEasyTimes[i] / 60,
                                    bestEasyTimes[i] % 60))
                    }
                }
            }
            
            HStack{
                List {
                    Text("Medium")
                    ForEach(0..<bestMediumTimes.count, id: \.self) { i in
                        Text(String(format: "%02d:%02d",
                                    bestMediumTimes[i] / 60,
                                    bestMediumTimes[i] % 60))
                    }
                }
                
                List {
                    Text("Hard")
                    ForEach(0..<bestHardTimes.count, id: \.self) { i in
                        Text(String(format: "%02d:%02d",
                                    bestHardTimes[i] / 60,
                                    bestHardTimes[i] % 60))
                    }
                }
            }
        }
    }
}

#Preview {
    TimesView(bestSuperEasyTimes: .constant([]), bestEasyTimes: .constant([]), bestMediumTimes: .constant([]), bestHardTimes: .constant([]))
}
