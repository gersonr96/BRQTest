//
//  JokeViewModel.swift
//  BRQTest
//
//  Created by Gerson Vieira on 11/06/19.
//  Copyright © 2019 Gerson. All rights reserved.
//

import UIKit
import ImageLoad
protocol JokeBussinesLogic {
    func fetchCategories(category: String)
}
struct JokeViewModel{
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
        jokeText = joke.value!
    }
    
}

class JokeManageViewModel: JokeBussinesLogic{
    var apiManager: DevAPIManager?
    weak var viewController: JokeDisplayLogic?
    private(set) var jokeData: JokeViewModel?
    func fetchCategories(category: String) {
        apiManager = DevAPIManager()
        apiManager?.requestJoke(category: category, { [weak self](joke, error) in
            guard let jokeresponse = joke else{
                self?.viewController?.displayError(error: error)
                return
            }
            jokeData = JokeViewModel.init(currentJoke: jokeresponse)
            self?.viewController?.displayJoke(viewModel: jokeData!)
        })
    }
  
}
extension CategoryViewModel{
    private func setTitle(currentJoke: Joke)-> String{
        let genres = currentJoke.categories!.joined(separator: ",")
        genres.uppercased()
        return genres
    }
}
