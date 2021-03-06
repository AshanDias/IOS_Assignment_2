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
        
        Auth.auth().signIn(withEmail: txt_un.text!, password: txt_pwd.text!) { [weak self] authResult, error in
            guard let user = authResult?.user, error == nil else {
                createAlert(title: "Error", message: error!.localizedDescription)
                print(error)
                           return
                }
            self!.performSegue(withIdentifier: "homeIdentifire", sender: self)
            
        }
        
        func createAlert(title:String, message:String){
            let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        
        
        if isEnableLocation {
            let email=txt_un.text!
            let pwd=txt_pwd.text!
            //start login
          
//            Auth.auth().createUser(withEmail:email , password: pwd) { authResult, error in
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
//            end login
           // performSegue(withIdentifier: "homeIdentifire", sender: self)
        }else{
           // performSegue(withIdentifier: "locationIdentifire", sender: self)
        }
    }
    
}

