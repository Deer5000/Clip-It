//
//  ErrorCases.swift
//  ClipIt
//
//  Created by Khidr Brinkley on 12/21/24.
//

import Foundation

enum ErrorCases: LocalizedError {
    case invalidData
    case invalidUrl
    case invalidResponse
    
    var errorDescription: String {
        switch self {
        case .invalidUrl:
            return "URL is Invalid."
        case .invalidData:
            return "Data is invalid."
        case .invalidResponse:
           return "Response is invalid."
        }
    }
}
