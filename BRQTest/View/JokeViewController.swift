//
//  JokeViewController.swift
//  BRQTest
//
//  Created by Gersinho on 11/06/19.
//  Copyright © 2019 Gerson. All rights reserved.
//

import UIKit
import ImageLoader
class JokeViewController: UIViewController {

    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var jokeText: UITextView!
    var category: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        fechJoke()
       
    }
    func fechJoke(){
        JokeViewModel.init().fetchCategories(category: category!) { (joke) in
            self.displayJoke(joke: joke!)
        }
    }
    func displayJoke(joke: Joke){
        icon.load.request(with: joke.icon_url!)
        jokeText.text = joke.value
    }
    
}
