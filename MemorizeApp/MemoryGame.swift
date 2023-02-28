//
//  MemoryGame.swift
//  MemorizeApp
//
//  Created by Anton Zyabkin on 26.02.2023.
//

import Foundation


struct MemoryGame<CardContent> where CardContent: Equatable {
    private(set) var cards: Array<Card>
    
    private var indexOfOneAndOnlyFaceUpCard: Int?
    
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
                indexOfOneAndOnlyFaceUpCard = nil
            } else {
                for index in cards.indices {
                    cards[index].isFaceUp = false
                }
                indexOfOneAndOnlyFaceUpCard = choosenIndex
            }
            
            cards[choosenIndex].isFaceUp.toggle()
        }
    }
    
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCards {
            let content: CardContent = createCardContent(pairIndex)
            cards.append(Card(content: content, id: pairIndex * 2))
            cards.append(Card(content: content, id: pairIndex * 2 + 1))
        }
    }
    
    struct Card: Identifiable {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }
}
