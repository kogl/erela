//
//  FeedVC.swift
//  newErela
//
//  Created by oskarGuest on 2017-11-18.
//  Copyright © 2017 oskarGuest. All rights reserved.
//

import UIKit
import Firebase
import FacebookCore

class FeedVC: UIViewController {
    

    @IBOutlet weak var screenCover: UIButton!
    
    @IBOutlet weak var menuView: UIView!
    @IBOutlet weak var menuButton: UIImageView!
    
    @IBOutlet weak var menuCurveImageView: UIImageView!
    
    @IBOutlet weak var profileImgeView: UIView!
    
    @IBOutlet weak var logOutView: UIView!
    
    @IBOutlet weak var marketView: UIView!
    
    @IBOutlet weak var friendsView: UIView!
    
    @IBOutlet weak var forumView: UIView!
    @IBOutlet weak var babyView: UIView!
    @IBOutlet weak var messagesView: UIView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        menuCurveImageView.image = #imageLiteral(resourceName: "curveImage")
        hideMenu()
        
    }
   

    @IBAction func screenCoverTapped(_ sender: Any) {
        hideMenu()
    }
    
    @IBAction func menuSwipeHide(_ sender: Any) {
        hideMenu()
    }
    @IBAction func menuSwiped(_ sender: Any) {
        print("ni då")
        showMenu()
    }
    @IBAction func menuTapped(_ sender: Any) {
        print("hit")
        showMenu()
    }
    @IBAction func profileTapped(_ sender: Any) {
        print("hit")
    }
    
    @IBAction func logOut(_ sender: Any) {
        if fbAccessToken != nil{
            AccessToken.current = nil
            fbAccessToken = nil
  
        }
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            dismiss(animated: true, completion: nil)
        } catch let signOutError as NSError {
            print ("Error signing out: \(signOutError.localizedDescription)")
        }
    }
    
    func showMenu(){
        UIView.animate(withDuration: 0.4, animations: {
            self.menuView.alpha = 1
            self.screenCover.alpha = 1
        })
        
        UIView.animate(withDuration: 0.4, delay: 0.3, options: [.curveEaseIn, .allowUserInteraction], animations: {self.profileImgeView.transform = .identity
            self.logOutView.transform = .identity
            })
        
        UIView.animate(withDuration: 0.4, delay: 0.2, options: [.curveEaseIn, .allowUserInteraction], animations: {self.friendsView.transform = .identity
            self.marketView.transform = .identity
        })
        
        UIView.animate(withDuration: 0.4, delay: 0.1, options: [.curveEaseIn, .allowUserInteraction], animations: {self.messagesView.transform = .identity
            self.babyView.transform = .identity
        })
        
                UIView.animate(withDuration: 0.4, delay: 0, options: [.curveEaseIn, .allowUserInteraction], animations: {self.forumView.transform = .identity
                })
    
        UIView.animate(withDuration: 0.4, delay: 0, options: .curveEaseIn, animations:{ self.menuCurveImageView.transform = .identity})
        
    }
    
    func hideMenu(){
        UIView.animate(withDuration: 0.4, delay: 0.3, animations: {
            self.menuView.alpha = 0
            self.screenCover.alpha = 0
        })
        
            UIView.animate(withDuration: 0.4, delay: 0, options: [.curveEaseIn, .allowUserInteraction], animations: {self.profileImgeView.transform = CGAffineTransform(translationX: -self.menuCurveImageView.frame.width, y: 0)
                self.logOutView.transform = CGAffineTransform(translationX: -self.menuCurveImageView.frame.width, y: 0)
            })
        
        UIView.animate(withDuration: 0.4, delay: 0.1, options: [.curveEaseIn, .allowUserInteraction], animations: {self.friendsView.transform = CGAffineTransform(translationX: -self.menuCurveImageView.frame.width, y: 0)
            self.marketView.transform = CGAffineTransform(translationX: -self.menuCurveImageView.frame.width, y: 0)
        })
        
        UIView.animate(withDuration: 0.4, delay: 0.2, options: [.curveEaseIn, .allowUserInteraction], animations: {self.messagesView.transform = CGAffineTransform(translationX: -self.menuCurveImageView.frame.width, y: 0)
            self.babyView.transform = CGAffineTransform(translationX: -self.menuCurveImageView.frame.width, y: 0)
        })
        
        UIView.animate(withDuration: 0.4, delay: 0.3, options: [.curveEaseIn, .allowUserInteraction], animations: {self.forumView.transform = CGAffineTransform(translationX: -self.menuCurveImageView.frame.width, y: 0)

        })

        UIView.animate(withDuration: 0.4, delay: 0, options: .curveEaseIn, animations:{ self.menuCurveImageView.transform = CGAffineTransform(translationX: -self.menuCurveImageView.frame.width, y: 0)})
        
    }
    
    
}
