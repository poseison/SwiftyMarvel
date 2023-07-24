//
//  PaginatedResponseModel.swift
//  SwiftUiMarvel
//
//  Created by Charilaos Laliotis on 17/7/23.
//

import Foundation

struct PaginatedResponseModel<T>: Codable  where T: Codable, T: DomainMapper {
    let offset, limit, total, count: Int?
    let results: [T]?
}
