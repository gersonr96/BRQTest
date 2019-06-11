//
//  JokeViewModel.swift
//  BRQTest
//
//  Created by Gerson Vieira on 11/06/19.
//  Copyright © 2019 Gerson. All rights reserved.
//

import UIKit
class JokeViewModel{
    var apiManager: DevAPIManager?
    var view: JokeViewController?
    func fetchCategories(category: String,completion: @escaping (Joke?)->Void){
        apiManager = DevAPIManager()
        apiManager?.requestJoke(category: category, { (joke, error) in
            guard let joke = joke else{
                self.view?.present(FeedBack.init().feedbackError(error: error!), animated: true, completion: nil)
                return
            }
            completion(joke)
        })

        
    }

}
