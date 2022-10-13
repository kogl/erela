//
//  ProfileVC.swift
//  newErela
//
//  Created by oskarGuest on 2017-11-19.
//  Copyright © 2017 oskarGuest. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController, UIImagePickerControllerDelegate , UINavigationControllerDelegate{
    @IBOutlet weak var profileImageView: UIImageViewX!
    
    @IBOutlet weak var blurscreenCover: UIVisualEffectViewX!
    
    @IBOutlet weak var screenCover: UIButton!
    
    @IBOutlet weak var changeProfileImage: UIButtonX!
    
    @IBOutlet weak var changeBackgroundImage: UIButtonX!
    
    @IBOutlet weak var changeProfleBio: UIButtonX!
    
    var changeProfileCenter: CGPoint!
    var ProfileImageCenter: CGPoint!
    var changeBioCenter: CGPoint!
    var changebgImageCenter: CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        profileStart()

    }
    @IBAction func screenCover(_ sender: Any) {
    }
    
    @IBAction func backButton(_ sender: Any) {
        
    }
  
    
    @IBAction func profileImageTapped(_ sender: Any) {
        print("take a hit bitch")
        animateProfile()
        
    }
    
    @IBOutlet weak var changeProfileImgageClicked: UIButtonX!
    
    @IBAction func changeProfileImageClicked(_ sender: Any) {
        let picker = UIImagePickerController()
        
        picker.delegate = self
        present(picker, animated: true, completion: nil)
    }
    
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        print("cancel picker")
    }
    
    func profileStart(){
        changeProfileCenter = changeProfileImage.center
        changebgImageCenter = changeBackgroundImage.center
        changeBioCenter = changeProfleBio.center
        
        changeProfileImage.center = profileImageView.center
        changeProfleBio.center = profileImageView.center
        changeBackgroundImage.center = profileImageView.center
        screenCover.alpha = 0
        blurscreenCover.alpha = 0
      
        self.changeProfleBio.alpha = 0
        self.changeProfileImage.alpha = 0
        self.changeBackgroundImage.alpha = 0
        
    }
    
    func animateProfile(){
        UIView.animate(withDuration: 0.3, animations:{
            self.changeProfileImage.center = self.changeProfileCenter
            self.changeBackgroundImage.center = self.changebgImageCenter
            self.changeProfleBio.center = self.changeBioCenter
            self.blurscreenCover.alpha = 1
            

            
        })
        self.screenCover.alpha = 1
        
        self.changeProfleBio.alpha = 1
        self.changeProfileImage.alpha = 1
        self.changeBackgroundImage.alpha = 1
    }
    @IBAction func SceenCocverClicked(_ sender: Any) {
        
        UIView.animate(withDuration: 0.3, animations:{
            self.changeProfileCenter = self.changeProfileImage.center
            self.changebgImageCenter = self.changeBackgroundImage.center
            self.changeBioCenter = self.changeProfleBio.center
            
            self.changeProfileImage.center = self.profileImageView.center
            self.changeProfleBio.center = self.profileImageView.center
            self.changeBackgroundImage.center = self.profileImageView.center
            
            self.changeProfleBio.alpha = 0
            self.changeProfileImage.alpha = 0
            self.changeBackgroundImage.alpha = 0
            self.screenCover.alpha = 0
            self.blurscreenCover.alpha = 0
        })
    }
}
