//
// Created for Glassfy Purchase
// by Stewart Lynch on 2022-04-19
// Using Swift 5.0
//
// Follow me on Twitter: @StewartLynch
// Subscribe on YouTube: https://youTube.com/StewartLynch
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ViewModel()
    var body: some View {
        ZStack {
            NavigationView {
                VStack {
                    HStack {
                        Picker("Group", selection: $viewModel.selectedGroup) {
                            ForEach(EmojiGroup.allCases) { group in
                                Text(group.rawValue).tag(group)
                            }
                        }
                        Button {
                            viewModel.togglePicker()
                        } label: {
                            Image(systemName: "magnifyingglass")
                        }
                        .buttonStyle(.bordered)
                    }
                    VStack {
                        Text(viewModel.selectedEmoji?.name ?? "")
                            .font(.largeTitle)
                            .padding()
                            .minimumScaleFactor(0.5)
                        Text(viewModel.selectedEmoji?.char ?? "")
                            .font(.system(size: 250))
                            .padding(.top, 30)
                    }
                    Spacer()
                }
                .navigationTitle("Emoji Picker")
                .disabled(viewModel.chooseEmoji)
            }
            .navigationViewStyle(.stack)
            if viewModel.chooseEmoji {
                EmojiPicker(viewModel: viewModel)
            }
        }
        .onChange(of: viewModel.selectedGroup) { _ in
            viewModel.togglePicker()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
