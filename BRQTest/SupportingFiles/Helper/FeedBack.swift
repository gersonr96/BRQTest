//
//  FeedBack.swift
//  BRQTest
//
//  Created by Gersinho on 11/06/19.
//  Copyright © 2019 Gerson. All rights reserved.
//

import UIKit
class FeedBack{
    
    func feedbackError(error: String)->UIAlertController{
        let alert = UIAlertController(title: "Alerta", message: error, preferredStyle:  UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "OK", style:  UIAlertAction.Style.default){
            UIAlertAction in
        })
        return alert
    }
}
