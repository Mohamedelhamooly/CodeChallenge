//
//  EndPoint.swift
//  CodeChallenge
//
//  Created by Mohamed Elhamoly on 12/23/20.
//  Copyright © 2020 mohamed Elhamoly. All rights reserved.
//
import Foundation
import UIKit
struct APP_URL {
    static var apiBaseURL: String {
        return "http://data.fixer.io/api/"
    }

    static var access_key: String {
        return "b9ee71e3798ae401ae9e2d7476814b65"
    }
}

enum Endpoints: String {
    case currenies = "latest"
}
/// Error
enum APIError: String, Error {
    case invalidURL             = "Invalid url"
    case invalidResponse        = "Invalid response"
    case decodeError            = "Decode error"
    case pageNotFound           = "Requested page not found!"
    case noNetwork              = "Internet connection not available!"
    case noData                 = "Oops! There are no matches for entered text."
    case unknownError           = "Unknown error"
    case serverError            = "Server error"
    case conversionIssue        = "Oops! Getting some conversion issue."
    
    static func checkErrorCode(_ errorCode: Int = 0) -> APIError {
        switch errorCode {
        case 400:
            return .invalidURL
        case 500:
            return .serverError
        case 404:
            return .pageNotFound
        default:
            return .unknownError
        }
    }
}


