//
// Created for Glassfy Purchase
// by Stewart Lynch on 2022-04-19
// Using Swift 5.0
//
// Follow me on Twitter: @StewartLynch
// Subscribe on YouTube: https://youTube.com/StewartLynch
//

import Foundation

class EmojiManager {
    var emojis: [EmojiObject] = []
    init() {
        decodeJSON()
    }
    func decodeJSON() {
        if let url = Bundle.main.url(forResource: "emoji", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                do {
                    let emoji: [EmojiObject] = try JSONDecoder().decode([EmojiObject].self, from: data)
                    self.emojis = emoji
                } catch {
                    print("Emoji file corrupt or missing")
                }
            } catch {
                print("error:\(error)")
            }
        }
    }
}

struct EmojiObject: Decodable, Hashable, Identifiable {
    let codes, char, name, category: String
    let subgroup: String
    let group: EmojiGroup
    var id: String { codes }
}

enum EmojiGroup: String, CaseIterable, Codable, Identifiable {
    case smileys = "Smileys & Emotion"
    case people = "People & Body"
    case animals = "Animals & Nature"
    case foodAndDrink = "Food & Drink"
    case travel = "Travel & Places"
    case activities = "Activities"
    case objects = "Objects"
    case symbols = "Symbols"
    case flags = "Flags"
    var id: String { rawValue }
}
