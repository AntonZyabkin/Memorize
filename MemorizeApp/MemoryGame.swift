//
//  MemoryGame.swift
//  MemorizeApp
//
//  Created by Anton Zyabkin on 26.02.2023.
//

import Foundation


struct MemoryGame<CardContent> {
    var cards: Array<Card>
    func choose(_ card: Card) {
        
    }
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCards {
            let content: CardContent = createCardContent(numberOfPairsOfCards)
            cards.append(Card(content: content))
            cards.append(Card(content: content))
        }
    }
    
    struct Card {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
    }
}