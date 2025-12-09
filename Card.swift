//
//  File.swift
//  MemoryGame
//
//  Created by SHANE COFFEY on 12/9/25.
//

import Foundation
import SwiftUI

class Card {
    var isFaceUp: Bool
    var imageName: String
    init(imageName: String, isFaceUp: Bool = false) {
        self.imageName = imageName
        self.isFaceUp = isFaceUp
    }
}
