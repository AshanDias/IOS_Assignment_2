//
//  SignUpViewController.swift
//  IOS_Assignment
//
//  Created by Ashan Dias on 2021-02-28.
//

import UIKit
import Firebase

class SignUpViewController: UIViewController {

    @IBOutlet var lbl_message:UILabel!
    @IBOutlet var txt_un:UITextField!
    @IBOutlet var txt_pwd:UITextField!
    @IBOutlet var txt_confirmPwd:UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onClickSignUp(_ sender: Any) {
        //do sign up
       
        if txt_pwd.text == txt_confirmPwd.text {
            
            Auth.auth().createUser(withEmail: txt_un.text!, password: txt_pwd.text!) { authResult, error in
                guard let user = authResult?.user, error == nil else {
                    self.lbl_message.text=error!.localizedDescription
                    print(error)
                               return
                    }
                self.lbl_message.text=user.email
            }
        }else{
            lbl_message.text="Confirm password does not matched!"
        }
     

       
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
