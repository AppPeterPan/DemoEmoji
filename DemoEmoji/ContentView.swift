//
//  ContentView.swift
//  DemoEmoji
//
//  Created by Peter Pan on 2023/8/14.
//

import SwiftUI
import GeneratedClient

struct ContentView: View {
    @State private var emojis = [Components.Schemas.Emoji]()
    
    var body: some View {
        List(emojis, id:\.character) { emoji in
            HStack {
                Text(emoji.character ?? "")
                Text(emoji.unicodeName ?? "")
            }
            .font(.largeTitle)
        }
        .task {
            do {
                emojis = try await EmojiClient().searchEmojis(search: "computer")
            } catch {
                
            }
        }
    }
}

#Preview {
    ContentView()
}
