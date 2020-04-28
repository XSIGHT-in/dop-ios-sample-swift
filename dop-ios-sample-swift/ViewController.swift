//
//  ViewController.swift
//  dop-ios-sample-swift
//
//  Created by YoungGeun CHOI on 2020/04/24.
//  Copyright © 2020 XSIGHTin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var btnLogin: UIButton!
    @IBOutlet var btnLogout: UIButton!
    @IBOutlet var txtUserEmail: UITextField!
    @IBOutlet var txtPassword: UITextField!
    
    let KEY_USER_ID = "keyUserId"
    let KEY_EMAIL_ADDRESS = "emailAddress"
    let PREDEFINED_USER_ID = "XS19H71n"    // It considered as User ID
    var isLogedIn: Bool!
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        // Check whether a user has loged in already
        if UserDefaults.standard.string(forKey: KEY_USER_ID) != nil {
            isLogedIn = true
        } else {
            isLogedIn = false
        }
        displayLoginComponent(isLogedIn: isLogedIn)
    }

    @IBAction func login(_ sender: UIButton) {
        if isLogedIn == false {
            isLogedIn = true
            displayLoginComponent(isLogedIn: isLogedIn)
            UserDefaults.standard.set(PREDEFINED_USER_ID, forKey: KEY_USER_ID)
            UserDefaults.standard.set(txtUserEmail.text, forKey: KEY_EMAIL_ADDRESS)
        }
    }
    
    @IBAction func logout(_ sender: UIButton) {
        if isLogedIn {
            let logoutAlert = UIAlertController(title: "Log Out",
                                                message: "Are you sure to Log Out?",
                                                preferredStyle: UIAlertController.Style.alert)
            let logoutAction = UIAlertAction(title: "Log Out",
                                             style: UIAlertAction.Style.default,
                                             handler: {ACTION in
                                                self.isLogedIn = false
                                                self.displayLoginComponent(isLogedIn: self.isLogedIn)
                                                UserDefaults.standard.removeObject(forKey: self.KEY_USER_ID)
                                                UserDefaults.standard.removeObject(forKey: self.KEY_EMAIL_ADDRESS)
            })
            let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default, handler: nil)
            
            logoutAlert.addAction(cancelAction)
            logoutAlert.addAction(logoutAction)
            present(logoutAlert, animated: true, completion: nil)
        }
    }
    
    func displayLoginComponent(isLogedIn: Bool) {
        btnLogin.isEnabled = !isLogedIn
        btnLogout.isEnabled = isLogedIn
        txtUserEmail.isEnabled = !isLogedIn
        txtPassword.isEnabled = !isLogedIn
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let collectionViewController = segue.destination as! CollectionViewController
        if segue.identifier == "collectionParis" {
            collectionViewController.txtTitle = "Paris"
            collectionViewController.selectedCity = City.init(name: City.Name.paris)
        } else {
            collectionViewController.txtTitle = "HCMc"
            collectionViewController.selectedCity = City.init(name: City.Name.hcmc)
        }
    }
}

