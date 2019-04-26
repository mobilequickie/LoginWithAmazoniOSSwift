//  LoginWithAmazonProxy.swift
//
//  Created by Hills, Dennis on 4/26/19.
//  Copyright © 2019 Hills, Dennis. All rights reserved.
//
//  Original credit to SUPERDASHENG at https://superdasheng.wordpress.com/author/superdasheng/
//  Added logout, getAccessToken, and getUserProfile
//  https://gist.github.com/mobilequickie/56916503a41ebb2374fea241ede26eab

import Foundation
import LoginWithAmazon

class LoginWithAmazonProxy {
    
    static let sharedInstance = LoginWithAmazonProxy()
    
    // The result of this API requestDidSucceed: callback for a successful login OR
    // sent to requestDidFail: callback if the login failed
    func login(delegate: AIAuthenticationDelegate) {
        AIMobileLib.authorizeUser(forScopes: ["profile", "postal_code"], delegate: delegate)
    }
    
    func logout(delegate: AIAuthenticationDelegate) {
        AMZNAuthorizationManager.shared().signOut { (error) in
            if((error) != nil) {
                print("error signing out from LWA: \(String(describing: error))")
            }
            // Deletes cached user tokens and other data from the keychain.
            // .signOut should be doing this, redundant?
            AIMobileLib.clearAuthorizationState(delegate)
        }
    }
    
    // The result of this API is a new access token sent to requestDidSucceed: callback
    func getAccessToken(delegate: AIAuthenticationDelegate) {
        AIMobileLib.getAccessToken(forScopes: ["profile"], withOverrideParams: nil, delegate: delegate)
    }

    // The result of this API is a user profile as an NSDictionary sent to requestDidSucceed: callback
    // e.g. email = "user@domain.com";name = "first last"; "postal_code" = "xxxxx"; "user_id" = "amzn1.account.xxxxxxxxxxxxxxxxxxxxxxxxxxxx"
    func getUserProfile(delegate: AIAuthenticationDelegate) {
        AIMobileLib.getProfile(delegate)
    }
}
