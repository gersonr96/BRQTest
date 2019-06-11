//
//  File.swift
//  BRQTest
//
//  Created by Gersinho on 10/06/19.
//  Copyright © 2019 Gerson. All rights reserved.
//

import Moya

enum DevAPI {
    case Category
    case Joke(category: String)
}

extension DevAPI  : TargetType {
    
    var baseURL: URL {
        return URL(string: Constants.baseUrl)!
    }
    
    var path: String {
        switch self {
        case .Category:
            return "/categories"
        case.Joke:
            return "/random"
        }
    }
    
    var method: Method {
        switch self {
        case .Category:
            return .get
        case .Joke:
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
            
        case .Category:
            return .requestPlain
        case .Joke(let category):
            var parameters: [String: Any] = [:]
            parameters["category"] = category
            return .requestParameters(parameters: parameters, encoding: URLEncoding.default)
    
        }
    }
    
    var headers: [String : String]? {
        switch self {
            
        case .Category:
            return ["content-type": "application/json"]
        case .Joke:
            return ["content-type": "application/json"]
        }
    }
    
}


