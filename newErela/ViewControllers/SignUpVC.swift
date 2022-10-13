//
//  SignUpVC.swift
//  newErela
//
//  Created by oskarGuest on 2017-11-22.
//  Copyright © 2017 oskarGuest. All rights reserved.
//

import UIKit
import Firebase

class SignUpVC: UIViewController {

    @IBOutlet weak var  userNameTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

    }

    func handeleRegister(){
        
        guard let email = emailTextField.text, let password = passwordTextField.text, let username = userNameTextField.text else {
            return
            
            
        }
        
        Auth.auth().createUser(withEmail: email, password: password,  completion: { (user: User?, error) in
            if error != nil{
                    print(error)
                return
            }
        
            guard let uid = user?.uid else{
                return
            }
            
            
            let ref = Database.database().reference(fromURL: "https://erela-83183.firebaseio.com/")
            let usersRefernce = ref.child("users").child(uid)
            let values = ["username": username, "email": email]
            usersRefernce.updateChildValues(values, withCompletionBlock: { (error, ref) in
                if error != nil {
                print(error)
                return
            }
            
        })
 
    })
    
    
}
    @IBAction func registerClicked(_ sender: Any) {
        handeleRegister()
    }
}
