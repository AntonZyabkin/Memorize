//
//  EmojiMemoryGame.swift
//  MemorizeApp
//
//  Created by Anton Zyabkin on 26.02.2023.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    typealias Card = MemoryGame<String>.Card
    private static let emojies = ["🎠", "⛱", "🏟", "🏰", "🚧", "🚥", "🎆", "🏖", "🧧", "🗒", "📉", "🖇", "❤️", "❣️", "❎", "❌", "📪", "🎈", "🎏", "🎊", "🏮", ]
    private static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame(numberOfPairsOfCards: 6) { pairIndex in
            emojies[pairIndex]
        }
    }
    @Published private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    
    //MARK: - Intent
    
    func choose(_ card: Card) {
        model.choose(card)
    }
}
