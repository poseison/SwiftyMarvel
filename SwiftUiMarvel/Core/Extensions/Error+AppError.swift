//
//  Error+AppError.swift
//  SwiftUiMarvel
//
//  Created by Charilaos Laliotis on 17/7/23.
//

import Foundation


extension Error {
    /// Converts any error to an `AppError` object.
    var toAppError: AppError {
        if self is NetworkError {
            return .networkError("Network Error")
        }
        return AppError.unknownError("Unknown Error")
    }
}
