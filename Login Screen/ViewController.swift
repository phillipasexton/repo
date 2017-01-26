//
//  ViewController.swift
//  Login Screen
//
//  Created by Phillip Sexton on 1/25/17.
//  Copyright © 2017 Phillip Sexton. All rights reserved.
//

import UIKit
import Firebase


class ViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.red
        
        let ref = FIRDatabase.database().reference(fromURL: "https://d-at-d.firebaseio.com/")
        ref.updateChildValues(["somevalue": 123123])
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "logout", style: .plain, target: self, action: #selector(handleLogout))
        
        if FIRAuth.auth()?.currentUser?.uid == nil {
            perform(#selector(handleLogout), with: nil, afterDelay: 0)
            
            handleLogout()
        }
        
    }
   
    func handleLogout() {
        
        do {
            try FIRAuth.auth()?.signOut()
        } catch let logoutError {
            print(logoutError)
        }
        
        let loginController = LoginController()
        present(loginController, animated: true, completion: nil)
    }
    
}

