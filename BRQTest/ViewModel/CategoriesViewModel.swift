//
//  CategoriesViewModel.swift
//  BRQTest
//
//  Created by Gersinho on 10/06/19.
//  Copyright © 2019 Gerson. All rights reserved.
//

import UIKit
import RxSwift
class CategoriesViewModel {
    var apiManager: DevAPIManager?
    
    func fetchCategories(completion: @escaping ([String]?)->Void){
        apiManager = DevAPIManager()
        apiManager?.requestMovieDetail( { (categories, error) in
            guard let category = categories else{
                //FeedBack.init().feedbackError(error: error!)
                return
            }
            completion(category)
        })
   
    }
}
