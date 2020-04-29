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
    
    let user:User = User.init()
    
    let KEY_USER_ID = "keyUserId"
    let KEY_EMAIL_ADDRESS = "emailAddress"
    var isLogedIn: Bool!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /** XSIGHTin
         * Set "Visit_Main_Page" event with "xi_is_host" properties
         */
        DOX.setEventGroupName("Visit_Main_Page")
        DOX.logEvent(XEvent.builder({ (event) in
            if let evt = event as? XEvent {
                evt.setEventName("Visit_Main_Page")
                evt.setProperties(XProperties.builder({ (property) in
                    if let prop = property as? XProperties {
                        prop.set("xi_is_host", value: self.user.isHost)
                    }
                }))
            }
        }))
        
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
            UserDefaults.standard.set(user.userId, forKey: KEY_USER_ID)
            UserDefaults.standard.set(txtUserEmail.text, forKey: KEY_EMAIL_ADDRESS)
            
            /** XSIGHTin
             * LOGIN-ID value is stored in the local storage by the SDK
             * and is transmitted together with the stored ID information when ALL subsequent events are transmitted.
             */
            DOX.setUserId(user.userId)
            
            /** XSIGHTin
             * Set "Sign_In " event with "xi_is_host" properties
             */
            let createDate = Calendar.current.date(byAdding: .day, value: -30, to: Date.init()) ?? Date.init() // Dummy as 30 days before
            
            DOX.setEventGroupName("Sign_In")
            DOX.logEvent(XEvent.builder({ (event) in
                if let evt = event as? XEvent {
                    evt.setEventName("Sign_In")
                    evt.setProperties(XProperties.builder({ (property) in
                        if let prop = property as? XProperties {
                            prop.set("xi_email", value: self.txtUserEmail.text ?? "")
                            prop.set("xi_gender", value: "F")       // F or M
                            prop.set("xi_timezone", value: "84")    // Country Phone Code
                            prop.set("xi_fb_id", value: self.txtUserEmail.text ?? "")
                            prop.set("xi_google_id", value: self.txtUserEmail.text ?? "")
                            prop.set("xi_status", value: "Active")  // Active or Inactive
                            prop.set("xi_created_at", value: createDate.timeIntervalSince1970)    // Unux Timestamp
                            prop.set("xi_is_host", value: self.user.isHost)       // Guest or Host
                        }
                    }))
                }
            }))
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
                                                
                                                /** XSIGHTin
                                                 * Occurred LOG-OUT event
                                                 */
                                                DOX.setUserId("")
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

