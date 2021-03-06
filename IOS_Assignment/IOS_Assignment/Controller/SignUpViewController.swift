//
//  SignUpViewController.swift
//  IOS_Assignment
//
//  Created by Ashan Dias on 2021-02-28.
//

import UIKit
import Firebase

class SignUpViewController: UIViewController {

   
    @IBOutlet var txt_un:UITextField!
    @IBOutlet var txt_pwd:UITextField!
    @IBOutlet var txt_confirmPwd:UITextField!
    let ls=LocationService()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onClickSignUp(_ sender: Any) {
        //do sign up
       
        if txt_pwd.text == txt_confirmPwd.text {
            
            Auth.auth().createUser(withEmail: txt_un.text!, password: txt_pwd.text!) { authResult, error in
                guard let user = authResult?.user, error == nil else {
                   
                    self.createAlert(title: "Error", message: error!.localizedDescription)
                               return
                    }
                self.performSegue(withIdentifier: "signupNavHome", sender: self)
                
                switch self.ls.status {
                case .notDetermined, .restricted, .denied  : do {
                    self.performSegue(withIdentifier: "locationIdentifire", sender: self)
                
                  break
                        }
                case .authorizedAlways, .authorizedWhenInUse:do {
                    self.performSegue(withIdentifier: "signupNavHome", sender: self)
                  break
                    }
                     
                }
            }
        }else{
            self.createAlert(title: "Error", message: "Confirm password does not matched!")
          
        }
     

       
    }
    
    func createAlert(title:String, message:String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
 
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
