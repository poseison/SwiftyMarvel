//
//  ComicModel+DomainMapper.swift
//  SwiftUiMarvel
//
//  Created by Charilaos Laliotis on 17/7/23.
//

import Foundation

extension ComicModel: DomainMapper {
    
    func toDomain() -> Comic {
        return Comic(
            id: id,
            title: title,
            description: description,
            modified: modified,
            isbn: isbn,
            upc: upc,
            diamondCode: diamondCode,
            ean: ean,
            issn: issn,
            format: format,
            thumbnail: thumbnail?.toDomain()
        )
    }
}
