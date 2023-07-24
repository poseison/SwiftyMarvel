//
//  HomeView.swift
//  SwiftUiMarvel
//
//  Created by Charilaos Laliotis on 17/7/23.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = Resolver.shared.resolve(HomeViewModel.self)
    var body: some View {
        NavigationStack {
            ZStack {
                BaseStateView(
                    viewModel: viewModel,
                    successView: AnyView(
                        ScrollView {
                            LazyVStack {
                                ForEach(viewModel.characters) { item in
                                    NavigationLink(
                                        destination: CharacterProfileView(character: item)) {
                                            CharacterView(character: item)
                                                .task {
                                                    await viewModel.loadMoreCharactersIfNeeded(currentItem: item)
                                                }
                                        }
                                }
                            }
                        }
                            .padding()
                            .navigationTitle("SwiftyMarvel")
                            .searchable(text: $viewModel.searchText, prompt: "Type character name...")
                            .onChange(of: viewModel.debouncedSearchText, perform: { _ in
                                Task {
                                    await viewModel.searchCharacters()
                                }
                            })
                    )//: AnyView
                )//: BaseStateView
            } //: ZStack
        } //: NavigationStack
        .task {
            await viewModel.loadCharacters()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
