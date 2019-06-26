//
//  CategoriesViewModel.swift
//  BRQTest
//
//  Created by Gerson Vieira on 10/06/19.
//  Copyright © 2019 Gerson. All rights reserved.
//

import UIKit
import ImageLoad
struct CategoryViewModel{
    let joke: Joke
    private (set) var jokeTitle: String
    private (set) var icon: UIImage
    private (set) var jokeText: String
    
    init(currentJoke: Joke) {
        self.joke = joke
        loadJoke()
    }
    
    private mutating func loadJoke(){
        jokeTitle = setTitle(currentJoke: joke)
        icon.load.request(with: joke.icon_url!)
        jokeText = joke.value
    }
    
    private func setTitle(currentJoke: Joke)-> String{
         let genres = joke.categories!.joined(separator: ",")
        return genres
    }
}
class CategoriesViewModel {
    var apiManager: DevAPIManager?
    var view: CategoriesViewController?
    func fetchCategories(completion: @escaping ([String]?)->Void){
        apiManager = DevAPIManager()
        apiManager?.requestMovieDetail( { (categories, error) in
            guard let category = categories else{
                self.view?.present(FeedBack.init().feedbackError(error: error!), animated: true, completion: nil)
                return
            }
            completion(category)
        })
   
    }
}
