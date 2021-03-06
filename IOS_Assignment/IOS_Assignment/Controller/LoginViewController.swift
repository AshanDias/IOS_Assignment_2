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
    let ls=LocationService()
var isEnableLocation=false
    override func viewDidLoad() {
        super.viewDidLoad()
       
        isEnableLocation=ls.checkIfLocationIsEnbled()
        // Do any additional setup after loading the view.
    }

    @IBAction func SignUp(_ sender: Any) {
    
       performSegue(withIdentifier: "signupNavigator", sender: self)
    }
    @IBAction func btnLogin(_ sender: Any) {
      //  print("status",ls.status.rawValue)
        
    
        Auth.auth().signIn(withEmail: txt_un.text!, password: txt_pwd.text!) { [weak self] authResult, error in
            guard let user = authResult?.user, error == nil else {
                self!.createAlert(title: "Error", message: error!.localizedDescription)
                print(error)
                           return
                }

            switch self!.ls.status {
            case .notDetermined, .restricted, .denied  : do {
                self!.performSegue(withIdentifier: "locationIdentifire", sender: self)
            
              break
                    }
            case .authorizedAlways, .authorizedWhenInUse:do {
                self!.performSegue(withIdentifier: "homeIdentifire", sender: self)
              break
                }
                 
            }
            

        }
        
       
      
    }
    
    func createAlert(title:String, message:String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    
}

