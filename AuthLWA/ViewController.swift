//
//  ViewController.swift
//  AuthLWA
//
//  Created by Hills, Dennis on 10/31/18.
//  Copyright © 2018 Hills, Dennis. All rights reserved.
//
//  Gist: https://gist.github.com/mobilequickie/346caccc2a07f18e2bea4fdf6fe8fd3f
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
    
    // The login request succeeded and the user is now authenticated via LWA
    func requestDidSucceed(_ apiResult: APIResult!) {
        print("LWA Succeeded!")
        
        DispatchQueue.main.async(execute: { () -> Void in
            self.btnLWALogin.isEnabled = false
            self.btnLWALogout.isEnabled = true
        })
        
        if (apiResult.api == API.authorizeUser) {
            AIMobileLib.getAccessToken(forScopes: ["profile"], withOverrideParams: nil, delegate: self)
        }
        else {
            print("Success! Token: \(apiResult.result ?? "nil")")
        }
    }
    
    // The login request to LWA failed
    func requestDidFail(_ errorResponse: APIError!) {
        print("Error: \(errorResponse.error.message ?? "nil")")
    }
    
    // Staging future code update
    //https://github.com/grimlockrocks/login-with-amazon-swift3-sample-app/pull/2/commits/b1e6c60d6569d63e4d4dc46d3b26e57f4efae76a
    
//    func blockerCode() {
//        let request = AMZNAuthorizeRequest()
//        request.scopes = [AMZNProfileScope.profile()]
//        //request.interactiveStrategy = AMZNInteractiveStrategy.never
//
//        AMZNAuthorizationManager.shared().authorize(request) { (authResult, userDidCancel, error) in
//            if ((error) != nil) {
//                print("AMZNAuthorizationManager Error: \(error!.localizedDescription)")
//            } else if (userDidCancel) {
//            } else {
//                // Authentication was successful.
//                let accessToken = authResult?.token;
//                let user = authResult?.user;
//                let userID = user?.userID;
//
//                print("Login successfully! \(accessToken, user, userID)")
//                DispatchQueue.main.async(execute: { () -> Void in
//                    self.btnLWALogin.isEnabled = false
//                    self.btnLWALogout.isEnabled = true
//                })
//            }
//        }
//    }
}

