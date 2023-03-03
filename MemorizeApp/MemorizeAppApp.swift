//
//  MemorizeAppApp.swift
//  MemorizeApp
//
//  Created by Anton Zyabkin on 16.02.2023.
//

import SwiftUI

@main
struct MemorizeAppApp: App {
    let game = EmojiMemoryGame()
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(game: game)
        }
    }
}
