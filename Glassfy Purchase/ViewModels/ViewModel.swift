//
// Created for Glassfy Purchase
// by Stewart Lynch on 2022-04-19
// Using Swift 5.0
//
// Follow me on Twitter: @StewartLynch
// Subscribe on YouTube: https://youTube.com/StewartLynch
//

import SwiftUI

class ViewModel: ObservableObject {
    @Published var selectedGroup: EmojiGroup = .objects
    @Published var selectedEmoji: EmojiObject?
    @Published var chooseEmoji = false
    @Published var searchFilter: String = ""

    var emojis: [EmojiObject] {
        EmojiManager().emojis.filter {$0.group == selectedGroup}
    }

    var filteredEmojis: [EmojiObject] {
        if searchFilter == "" {
            return emojis
        } else {
            return emojis.filter {$0.name.lowercased().contains(searchFilter.lowercased())}
        }
    }

    func togglePicker() {
        withAnimation {
            chooseEmoji.toggle()
        }
    }
}
