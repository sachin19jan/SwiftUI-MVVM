//
//  Endpoint.swift
//  TVProgrammes
//
//  Created by JEEVAN TIWARI on 02/12/24.
//

import Foundation

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    // You can add other HTTP methods if needed
}

enum Endpoint {
    case popularShows
    case tvShowDetails(id: Int)

    var url: URL {
        let baseURL = "https://api.themoviedb.org/3"
        let apiKey = "4f34c339d8bdc6ab7df92feee933b3d2" // Replace with your actual API key
        switch self {
        case .popularShows:
            return URL(string: "\(baseURL)/tv/popular?api_key=\(apiKey)&language=en-US&page=1")!
        case .tvShowDetails(let id):
            return URL(string: "\(baseURL)/tv/\(id)?api_key=\(apiKey)&language=en-US")!
        }
    }

    var method: HTTPMethod {
        return .get
    }
    
}
