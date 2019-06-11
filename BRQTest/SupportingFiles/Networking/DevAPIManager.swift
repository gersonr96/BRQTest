//
//  NetworkingAPIManage.swift
//  BRQTest
//
//  Created by Gerson Vieira on 10/06/19.
//  Copyright © 2019 Gerson. All rights reserved.
//

import Moya


class DevAPIManager
{
    let provider =  MoyaProvider<DevAPI>(plugins: [NetworkLoggerPlugin(verbose: false)])
    typealias responseHandler = (_ category: [String]?
        , _ error: String?) -> Void
    func requestMovieDetail(_ completionHandler: @escaping (responseHandler))
    {
        
        provider.request(.Category) { (result) in
            switch result{
            case let  .success(moyaResponse):
                do{
                    let data = try JSONDecoder().decode([String].self, from: moyaResponse.data)
                    completionHandler(data, nil)
                } catch let error{
                    completionHandler(nil, error.localizedDescription)
                }
            case let .failure(error):
                completionHandler(nil, error.localizedDescription)
                
            }
        }
        
    }
    
    typealias responseHandlerJoke = (_ joke: Joke?
        , _ error: String?) -> Void
    func requestJoke(category: String,_ completionHandler: @escaping (responseHandlerJoke))
    {
        provider.request(.Joke(category: category)) { (result) in
            switch result{
                
            case let .success(moyaResponse):
                do{
                    let data = try JSONDecoder().decode(Joke.self, from: moyaResponse.data)
                    completionHandler(data, nil)
                }catch let error{
                    completionHandler(nil, error.localizedDescription)
                }
            case let .failure(error):
                completionHandler(nil, error.localizedDescription)
            }
        }
    }
}
