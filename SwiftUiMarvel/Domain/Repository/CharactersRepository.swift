//
//  CharactersRepository.swift
//  SwiftUiMarvel
//
//  Created by Charilaos Laliotis on 17/7/23.
//

import Foundation

protocol CharactersRepository {

  
    func getCharacters(from offset: Int, by searchKey: String?) async -> Result<PaginatedResponse<Character>, AppError>
}
