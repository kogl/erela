//
//  LoginVC.swift
//  newErela
//
//  Created by oskarGuest on 2017-11-17.
//  Copyright © 2017 oskarGuest. All rights reserved.
//

import UIKit
import Firebase
import FacebookLogin
import FBSDKLoginKit
import FacebookCore



class LoginVC: UIViewController {


    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var facebookLgoinButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        
    }
    @IBAction func LoginButtonClicked(_ sender: Any) {
        handleLogin()
        
    }
    
    @IBAction func facebookLoginButtonClick(_ sender: Any) {
        
        let facebookLogin = FBSDKLoginManager()
        
        facebookLogin.logIn(withReadPermissions: ["email"], from: self) { (result, error) in
            if error != nil{
                print("OSKAR: Unable to login useing facebook - \(error)")
            } else if result?.isCancelled == true{
                print("OSKAR:USer canceldfacebook auth")

            } else {
                print("OSKAR: SUccessfully")
                let credential = FacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
                self.firebaseAuth(credential)
                }
                
                
            }
        }
    
    func firebaseAuth(_ credential: AuthCredential) {
        Auth.auth().signIn(with: credential, completion: { (user, error) in
            if error != nil {
            print("OSKAR:unable to authenticte wit firebase -\(error)")
        } else {
            
                print("OSKAR: success authenticate with firebase")
                
        }
        
            })
        }
    func handleLogin() {
        guard let email = emailTextField.text, let password = passwordTextField.text else {
            return
            
        }
        
        
        Auth.auth().signIn(withEmail: email, password: password, completion: { (user, error) in
            
            if error != nil{
            print(error)
            return
        }
            
            //inloggad
        self.dismiss(animated: true, completion: nil)
            
        
    })
    
    }
}


