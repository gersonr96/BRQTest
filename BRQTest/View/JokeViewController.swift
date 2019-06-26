//
//  JokeViewController.swift
//  BRQTest
//
//  Created by Gerson Vieira on 11/06/19.
//  Copyright © 2019 Gerson. All rights reserved.
//

import UIKit
import ImageLoader
import NVActivityIndicatorView
protocol JokeDisplayLogic {
    func displayJoke(viewModel: JokeViewModel)
    func displayError(error: String)
}
class JokeViewController: UIViewController, JokeDisplayLogic {

    @IBOutlet weak var jokeTitle: UILabel!
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var jokeText: UITextView!
    @IBOutlet weak var activityIndicatorJoke: NVActivityIndicatorView!
    var viewModelRequest: JokeBussinesLogic?
    
    var category: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        fechJoke()
        activityIndicatorJoke.startAnimating()
        
    }
    
    func displayError(error: String) {
        FeedBack.init().feedbackError(error: error!)
    }
    func displayJoke(viewModel: JokeViewModel) {
        self.displayJoke(joke: viewModel)
    }
    
    func fechJoke(){
        viewModelRequest?.fetchCategories(category: category!)
    }
    func displayJoke(joke: JokeViewModel){
        jokeTitle.text = joke.jokeTitle
        icon.image = joke.icon
        jokeText.text = joke.jokeText
    }
    
}
