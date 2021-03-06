//
//  ViewController.swift
//  IOS_Assignment
//
//  Created by Ashan Dias on 2021-02-21.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
  
   
    @IBOutlet var txt_un:UITextField!
    @IBOutlet var txt_pwd:UITextField!
var isEnableLocation=false
    override func viewDidLoad() {
        super.viewDidLoad()
        let ls=LocationService()
        isEnableLocation=ls.checkIfLocationIsEnbled()
        // Do any additional setup after loading the view.
    }

    @IBAction func SignUp(_ sender: Any) {
    
       performSegue(withIdentifier: "signupNavigator", sender: self)
    }
    @IBAction func btnLogin(_ sender: Any) {
        if isEnableLocation {
            //start login
          
//            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
//                       // [START_EXCLUDE]
//                guard let strongSelf = self else { return }
//                strongSelf.hideSpinner {
//                         guard let user = authResult?.user, error == nil else {
//                           strongSelf.showMessagePrompt(error!.localizedDescription)
//                           return
//                         }
//                         print("\(user.email!) created")
//                         strongSelf.navigationController?.popViewController(animated: true)
//                       }
//                       // [END_EXCLUDE]
//                     }
            //end login
            performSegue(withIdentifier: "homeIdentifire", sender: self)
        }else{
            performSegue(withIdentifier: "locationIdentifire", sender: self)
        }
    }
    
}

