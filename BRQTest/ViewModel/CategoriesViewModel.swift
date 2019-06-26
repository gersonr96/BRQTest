//
//  CategoriesViewModel.swift
//  BRQTest
//
//  Created by Gerson Vieira on 10/06/19.
//  Copyright © 2019 Gerson. All rights reserved.
//

import UIKit
protocol CategoriesBussinesLogic {
    func fetchCategories(category: String)
}
struct CategoriesViewModel{
    let Categories: String
    private (set) var category: String
 
    
    init(currentCategory: String) {
        self.Categories = Categories
        loadJoke()
    }
    
//    private mutating func loadJoke(){
//        jokeTitle = setTitle(currentJoke: joke)
//        icon.load.request(with: joke.icon_url!)
//        jokeText = joke.value!
//    }
    
}

class CategoriesManagerViewModel {
    var apiManager: DevAPIManager?
    var viewController: CategoriesDisplayLogic?
    private func fetchCategories(completion: @escaping ([String]?)->Void){
        apiManager = DevAPIManager()
        apiManager?.requestMovieDetail( { (categories, error) in
            guard let category = categories else{
                self.viewController?.displayError(error: error)
                return
            }
            completion(category)
        })
    }
    
  
    
    
}


