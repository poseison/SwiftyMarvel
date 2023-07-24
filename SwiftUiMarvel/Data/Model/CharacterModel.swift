//
//  CharacterModel.swift
//  SwiftUiMarvel
//
//  Created by Charilaos Laliotis on 17/7/23.
//

import Foundation

struct CharacterModel: Codable {
    let id: Int?
    let name, description: String?
    let modified: String?
    let thumbnail: ThumbnailModel?
    
    init(id: Int? = nil,
         name: String? = nil,
         description: String? = nil,
         modified: String? = nil,
         thumbnail: ThumbnailModel? = nil) {
        self.id = id
        self.name = name
        self.description = description
        self.modified = modified
        self.thumbnail = thumbnail
    }
}

// MARK: - ThumbnailModel -

struct ThumbnailModel: Codable {
    let path: String?
    let thumbnailExtension: String?

    enum CodingKeys: String, CodingKey {
        case path
        case thumbnailExtension = "extension"
    }
}
