//
//  CharacterModel+DomainMapper.swift
//  SwiftUiMarvel
//
//  Created by Charilaos Laliotis on 17/7/23.
//

import Foundation

extension CharacterModel: DomainMapper {
    func toDomain() -> Character {
        return Character(id: id,
                         name: name,
                         description: description,
                         modified: modified,
                         thumbnail: thumbnail?.toDomain())
    }
}


extension ThumbnailModel: DomainMapper {
    func toDomain() -> Thumbnail {
        return Thumbnail(path: path,
                         thumbnailExtension: thumbnailExtension)
    }
}
