//
//  ComicsRequest.swift
//  SwiftUiMarvel
//
//  Created by Charilaos Laliotis on 17/7/23.
//

import Foundation

enum ComicsRequest: RequestProtocol {
    
    case getComicsByCharacterId(characterId: Int, offset: Int)
    
    
    var path: String {
        switch self {
        case .getComicsByCharacterId(let characterId, _):
            return "/v1/public/characters/\(characterId)/comics"
        }
    }
    
    // MARK: - URL Params -

    var urlParams: [String: String?] {
        switch self {
        case .getComicsByCharacterId(_, let offset):
            return ["offset": "\(offset)",
                    "limit": "\(APIConstants.defaultLimit)"]
        }
    }
    var requestType: RequestType {
        .GET
    }
}
