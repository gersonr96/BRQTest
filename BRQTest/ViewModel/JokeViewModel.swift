//
//  JokeViewModel.swift
//  BRQTest
//
//  Created by Gersinho on 11/06/19.
//  Copyright © 2019 Gerson. All rights reserved.
//

import UIKit
class JokeViewModel{
    var apiManager: DevAPIManager?
    
    func fetchCategories(category: String,completion: @escaping (Joke?)->Void){
        apiManager = DevAPIManager()
        apiManager?.requestJoke(category: category, { (joke, error) in
            guard let joke = joke else{
                return
            }
            completion(joke)
        })

        
    }

}
