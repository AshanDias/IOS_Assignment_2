//
//  ViewController.swift
//  IOS_Assignment
//
//  Created by Ashan Dias on 2021-02-21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func SignUp(_ sender: Any) {
       performSegue(withIdentifier: "signupNavigator", sender: self)
    }
    
}

