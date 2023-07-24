//
//  GetCharactersUC.swift
//  SwiftUiMarvel
//
//  Created by Charilaos Laliotis on 17/7/23.
//

import Foundation

struct GetCharactersParams {
    
    let offset: Int
    let searchKey: String?
}


protocol GetCharactersUC {

    func execute(with params: GetCharactersParams) async -> Result<PaginatedResponse<Character>, AppError>
}


class DefaultGetCharactersUC: GetCharactersUC {
    
    private var repository: CharactersRepository
    
    init(repository: CharactersRepository) {
        self.repository = repository
    }
    
    func execute(with params: GetCharactersParams) async -> Result<PaginatedResponse<Character>, AppError> {
        return await repository.getCharacters(from: params.offset, by: params.searchKey)
    }
    
}
