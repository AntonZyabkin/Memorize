//
//  MemoryGame.swift
//  MemorizeApp
//
//  Created by Anton Zyabkin on 26.02.2023.
//

import Foundation


struct MemoryGame<CardContent> where CardContent: Equatable {
    private(set) var cards: Array<Card>
    
    private var indexOfOneAndOnlyFaceUpCard: Int? {
        get { cards.indices.filter { cards[$0].isFaceUp }.oneAndOnly }
        set { cards.indices.forEach { cards[$0].isFaceUp = ($0 == newValue) } }
    }
    
    mutating func choose(_ card: Card) {
        if
            let choosenIndex = cards.firstIndex(where: { $0.id == card.id }),
            !cards[choosenIndex].isFaceUp,
            !cards[choosenIndex].isMatched
        {
            if let potentionMarchedIndex = indexOfOneAndOnlyFaceUpCard {
                if cards[choosenIndex].content == cards[potentionMarchedIndex].content {
                    cards[choosenIndex].isMatched = true
                    cards[potentionMarchedIndex].isMatched = true

                }
                cards[choosenIndex].isFaceUp = true
            } else {
                indexOfOneAndOnlyFaceUpCard = choosenIndex
            }
        }
    }
    
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = []
        for pairIndex in 0..<numberOfPairsOfCards {
            let content: CardContent = createCardContent(pairIndex)
            cards.append(Card(content: content, id: pairIndex * 2))
            cards.append(Card(content: content, id: pairIndex * 2 + 1))
        }
    }
    
    struct Card: Identifiable {
        var isFaceUp = false
        var isMatched = false
        var content: CardContent
        var id: Int
    }
}


extension Array {
    var oneAndOnly: Element? {
        count == 1 ? first : nil
    }
}
