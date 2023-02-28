//
//  EmojiMemoryGame.swift
//  MemorizeApp
//
//  Created by Anton Zyabkin on 26.02.2023.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    static let emojies = ["🎠", "⛱", "🏟", "🏰", "🚧", "🚥", "🎆", "🏖", "🧧", "🗒", "📉", "🖇", "❤️", "❣️", "❎", "❌", "📪", "🎈", "🎏", "🎊", "🏮", ]
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame(numberOfPairsOfCards: 4) { pairIndex in
            EmojiMemoryGame.emojies[pairIndex]
        }
    }
    @Published private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    
    //MARK: - Intent
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}
