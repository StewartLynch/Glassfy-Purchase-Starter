//
// Created for Glassfy Purchase
// by Stewart Lynch on 2022-04-19
// Using Swift 5.0
//
// Follow me on Twitter: @StewartLynch
// Subscribe on YouTube: https://youTube.com/StewartLynch
//

import SwiftUI

struct EmojiPicker: View {
    private let columns: [GridItem] = [GridItem(.flexible()),
                                      GridItem(.flexible()),
                                      GridItem(.flexible()),
                                      GridItem(.flexible()),
                                      GridItem(.flexible())]
    @ObservedObject var viewModel: ViewModel
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 10) {
                        ForEach(viewModel.filteredEmojis) { emoji in
                            Text(emoji.char)
                                .font(.largeTitle)
                                .onTapGesture {
                                    viewModel.selectedEmoji = emoji
                                    viewModel.togglePicker()
                                }
                                .border(viewModel.selectedEmoji == emoji
                                        ? Color.accentColor
                                        : Color.clear)
                        }
                    }
                }.padding()
                    .frame(width: 350, height: 350)
                    .background(RoundedRectangle(cornerRadius: 10)
                        .fill(Color(.systemBackground)))
                    .shadow(color: .black.opacity(0.3),
                            radius: 3,
                            x: 3,
                            y: 3)
                Spacer()
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle(viewModel.selectedGroup.rawValue)
        }
        .searchable(text: $viewModel.searchFilter)
        .onAppear {
            viewModel.searchFilter = ""
        }
    }
}

struct EmojiPicker_Previews: PreviewProvider {
    static var previews: some View {
        EmojiPicker(viewModel: ViewModel())
    }
}
