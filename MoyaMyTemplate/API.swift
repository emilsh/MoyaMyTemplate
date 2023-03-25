//
//  API.swift
//  Moya
//
//  Created by Emil Shafigin on 25/3/23.
//

import Foundation
import Moya

enum API {
    case popular
    case movie(movieId: String)
    case search(query: String)
}

extension API: TargetType {
    
    var baseURL: URL {
        guard let url = URL(string: "https://api.themoviedb.org/3/") else { fatalError() }
        return url
    }
    
    var path: String {
        switch self {
        case .popular:
            return "movie/popular"
        case .movie(let movieId):
            return "movie/\(movieId)"
        case .search:
            return "search/movie"
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .popular, .movie:
            return .requestParameters(parameters: ["api_key": ApiKey.apiKey],
                                      encoding: URLEncoding.queryString)
        case .search(let query):
            return .requestParameters(parameters: ["query": query, "api_key": ApiKey.apiKey],
                                      encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String: String]? {
        return nil
    }
    
}
