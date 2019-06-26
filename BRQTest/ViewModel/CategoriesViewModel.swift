//
//  CategoriesViewModel.swift
//  BRQTest
//
//  Created by Gerson Vieira on 10/06/19.
//  Copyright © 2019 Gerson. All rights reserved.
//

import UIKit
protocol CategoriesBussinesLogic {
    func fetchCategories()
}

class CategoriesManagerViewModel: CategoriesDisplayLogic {
    var apiManager: DevAPIManager?
    var viewController: CategoriesDisplayLogic?

    func fetchCategories(){
        apiManager?.requestMovieDetail({ [weak self] (categories, error) in
            guard let category = categories else{
                self?.viewController?.displayError(error: error)
                return
            }
            viewController?.displayCategories(viewModel: category)
        })
    }

}


