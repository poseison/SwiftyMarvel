//
//  BaseResponse.swift
//  SwiftUiMarvel
//
//  Created by Charilaos Laliotis on 17/7/23.
//

import Foundation

struct BaseResponse<T> {
    let code: Int
    let status: String
    let data: T
}
