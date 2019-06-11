//
//  CategoriesViewController.swift
//  BRQTest
//
//  Created by Gerson Vieira on 10/06/19.
//  Copyright © 2019 Gerson. All rights reserved.
//

import UIKit
import  NVActivityIndicatorView
class CategoriesViewController: UIViewController {

    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var activityCat: NVActivityIndicatorView!
    var ViewModel: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerNibFiles()
        fetchData()
        activityCat.startAnimating()

        // Do any additional setup after loading the view.
    }
  
    func fetchData(){
        CategoriesViewModel.init().fetchCategories { (categories) in
            self.ViewModel = categories!
            self.activityCat.stopAnimating()
            self.tableview.reloadData()
        }
    }

     // MARK: View lifecycle
    private func registerNibFiles(){
        let cell = UINib(nibName: "ListCell", bundle: nil)
        tableview.register(cell
            , forCellReuseIdentifier: "ListCell")
    }
    

}
extension CategoriesViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ViewModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell", for: indexPath) as! ListTableViewCell
        cell.name.text = ViewModel[indexPath.row].uppercased()
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard = UIStoryboard(name: "Main", bundle:nil)
         let jokeView  = storyBoard.instantiateViewController(withIdentifier: "Joke") as! JokeViewController
        jokeView.category = ViewModel[indexPath.row]
        self.navigationController?.pushViewController(jokeView, animated: true)
    }

    
}
