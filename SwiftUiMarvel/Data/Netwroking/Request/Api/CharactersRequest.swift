//
//  CharactersRequest.swift
//  SwiftUiMarvel
//
//  Created by Charilaos Laliotis on 17/7/23.
//

import Foundation

enum CharactersRequest: RequestProtocol {
case getCharacters(offset: Int, searchKey: String?)
    var path: String {
        "/v1/public/characters"
    }
    var urlParams: [String: String?] {
        switch self {
        case .getCharacters(let offset, let searchKey):
            var params = ["offset": "\(offset)", "limit": "\(APIConstants.defaultLimit)"]
            if let searchKey {
                params["nameStartsWith"] = searchKey
            }
            return params
        }
    }
    var requestType: RequestType {
        .GET
    }
}
