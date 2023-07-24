//
//  CharactersDataSource.swift
//  SwiftUiMarvel
//
//  Created by Charilaos Laliotis on 17/7/23.
//

import Foundation

typealias CharactersResponse = BaseResponseModel<PaginatedResponseModel<CharacterModel>>


protocol CharactersDataSource {
    func getCharacters(from offset: Int, by searchKey: String?) async throws -> PaginatedResponseModel<CharacterModel>
}


class DefaultCharactersDataSource: CharactersDataSource {
    private let requestManager: RequestManager
    init(requestManager: RequestManager) {
        self.requestManager = requestManager
    }
    func getCharacters(from offset: Int, by searchKey: String?) async throws -> PaginatedResponseModel<CharacterModel> {
        let request = CharactersRequest.getCharacters(offset: offset, searchKey: searchKey)
        let response: CharactersResponse = try await requestManager.makeRequest(with: request)
        return response.data
    }
}
