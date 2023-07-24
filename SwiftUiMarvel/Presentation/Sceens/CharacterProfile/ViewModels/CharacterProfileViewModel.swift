//
//  CharacterProfileViewModel.swift
//  SwiftUiMarvel
//
//  Created by Charilaos Laliotis on 17/7/23.
//

import Foundation

@MainActor
final class CharacterProfileViewModel: ViewModel {
    
    
    private let getComicsUC: any GetComicsUC
    
    private let favoriteStore = Favorites()
    
    
    private var currentOffset = 0
    
    
    @Published var comics: [Comic] = []
    
  
    
    init(getComicsUC: any GetComicsUC) {
        self.getComicsUC = getComicsUC
    }
}


extension CharacterProfileViewModel {
    
    func loadComics(forCharacter id: Int) async {
        state = .loading
        let result = await getComicsUC.execute(with: GetComicsParams(offset: 0, characterID: id))
        switch result {
        case .success(let data):
            comics.append(contentsOf: data.results ?? [])
            state = .success
        case .failure(let err):
            state = .error(err.localizedDescription)
        }
    }
 
    
    
}
