//
//  ContentView.swift
//  MemorizeApp
//
//  Created by Anton Zyabkin on 16.02.2023.
//





import SwiftUI

struct ContentView: View {
    var emojies = ["🎠", "⛱", "🏟", "🏰", "🚧", "🚥", "🎆", "🏖", "🧧", "🗒", "📉", "🖇", "❤️", "❣️", "❎", "❌", "📪", "🎈", "🎏", "🎊", "🏮", ]
    @State var emojiCounter = 20
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))]) {

                    ForEach(emojies[0..<emojiCounter], id: \.self) { emoji in
                        CardView(content: emoji, isFaceUp: true).aspectRatio(2/3, contentMode: .fill)
                    }
                }
            }
            Spacer()
            HStack {
                remove
                Spacer()
                add
            }
            .font(.largeTitle)
            .padding(.horizontal)
        }
        .padding(.horizontal)
        .foregroundColor(.red)
    }
    var remove: some View {
        Button(action: {
            if emojiCounter > 1 {
                emojiCounter -= 1
            }
        }) {
            VStack{
                Image(systemName: "minus.circle")
            }
        }
    }
    var add: some View {
        Button(action: {
            if emojiCounter < emojies.count {
                emojiCounter += 1
            }
        }) {
            VStack{
                Image(systemName: "plus.circle")
            }
        }
    }

}



struct CardView: View {
    var content: String = ""
    @State var isFaceUp = true
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 25)
            if isFaceUp {
                shape.fill(.white)
//                shape.stroke(lineWidth: 3)
                shape.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            } else {
                shape.fill(.red)
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
        ContentView()
            .preferredColorScheme(.dark)
    }
}
