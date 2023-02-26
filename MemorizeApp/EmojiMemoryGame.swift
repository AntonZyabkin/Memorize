//
//  EmojiMemoryGame.swift
//  MemorizeApp
//
//  Created by Anton Zyabkin on 26.02.2023.
//

import SwiftUI

class EmojiMemoryGame {
    static let emojies = ["🎠", "⛱", "🏟", "🏰", "🚧", "🚥", "🎆", "🏖", "🧧", "🗒", "📉", "🖇", "❤️", "❣️", "❎", "❌", "📪", "🎈", "🎏", "🎊", "🏮", ]
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame(numberOfPairsOfCards: 4) { pairIndex in
            EmojiMemoryGame.emojies[pairIndex]
        }
    }
    private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
}
