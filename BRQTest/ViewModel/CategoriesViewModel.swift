//
//  CategoriesViewModel.swift
//  BRQTest
//
//  Created by Gerson Vieira on 10/06/19.
//  Copyright © 2019 Gerson. All rights reserved.
//

import UIKit

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
