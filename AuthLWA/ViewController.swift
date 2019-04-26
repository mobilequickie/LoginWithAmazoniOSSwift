//
//  ViewController.swift
//  AuthLWA
//
//  Created by Hills, Dennis on 4/26/19.
//  Copyright © 2019 Hills, Dennis. All rights reserved.
//
import UIKit
import LoginWithAmazon

class ViewController: UIViewController, AIAuthenticationDelegate {
    
    @IBOutlet weak var btnLWALogin: UIButton!
    @IBOutlet weak var btnLWALogout: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // User taps [Login with Amazon] button
    @IBAction func onClickLWALogin(_ sender: Any) {
        LoginWithAmazonProxy.sharedInstance.login(delegate: self)
    }
    
    // User taps [Logout]
    @IBAction func onClickLWALogout(_ sender: Any) {
        AMZNAuthorizationManager.shared().signOut { (error) in
            if((error) != nil) {
                print("error signing out: \(String(describing: error))")
            } else {
                print("Logout successfully!")
                DispatchQueue.main.async(execute: { () -> Void in
                    self.btnLWALogin.isEnabled = true
                    self.btnLWALogout.isEnabled = false
                })
            }
        }
    }
    
    // Login with Amazon - Successful login callback
    func requestDidSucceed(_ apiResult: APIResult!) {
        
        switch (apiResult.api) {
            
        case API.authorizeUser:
            LoginWithAmazonProxy.sharedInstance.getAccessToken(delegate: self)
            
        case API.getAccessToken:
            guard let LWAtoken = apiResult.result as? String else { return }
            print("LWA Access Token: \(LWAtoken)")
            
            // Get the user profile from LWA (OPTIONAL)
            LoginWithAmazonProxy.sharedInstance.getUserProfile(delegate: self)
            
        case API.getProfile:
            print("LWA User Profile: \(String(describing: apiResult.result))")
            
        case API.clearAuthorizationState:
            print("user logged out from LWA")
            
            // Sign out from AWSMobileClient
            AWSMobileClient.sharedInstance().signOut()
            
        default:
            print("unsupported")
        }
    }
    
    // The login request to LWA failed
    func requestDidFail(_ errorResponse: APIError!) {
        print("Error: \(errorResponse.error.message ?? "nil")")
    }
}
