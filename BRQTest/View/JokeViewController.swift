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
class JokeViewController: UIViewController {

    @IBOutlet weak var jokeTitle: UILabel!
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var jokeText: UITextView!
    @IBOutlet weak var activityIndicatorJoke: NVActivityIndicatorView!
    
    
    var category: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        fechJoke()
        activityIndicatorJoke.startAnimating()
        
        
       
    }
    func fechJoke(){
        JokeViewModel.init().fetchCategories(category: category!) { (joke) in
            self.activityIndicatorJoke.stopAnimating()
            self.displayJoke(joke: joke!)
        }
    }
    func displayJoke(joke: Joke){
         let genres = joke.categories!.joined(separator: ",")
        jokeTitle.text = genres.uppercased()
        icon.load.request(with: joke.icon_url!)
        jokeText.text = joke.value
    }
    
}
