//
//  PaginatedResponseModel+DomainMapper.swift
//  SwiftUiMarvel
//
//  Created by Charilaos Laliotis on 17/7/23.
//

import Foundation

extension PaginatedResponseModel {
    typealias EntityType = PaginatedResponse
    func toDomain<T>(dataType: T.Type) -> PaginatedResponse<T> {
        return PaginatedResponse<T>(offset: offset,
                                    limit: limit,
                                    total: total,
                                    count: count,
                                    results: results?.map({$0.toDomain() as! T}
                                                         )
        )
    }
}
