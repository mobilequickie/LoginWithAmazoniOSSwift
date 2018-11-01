//
//  LoginWithAmazonProxy.swift
//  AuthLWA
//
//  Created by Hills, Dennis on 11/1/18.
//  Copyright © 2018 Hills, Dennis. All rights reserved.
//
//  Credit to SUPERDASHENG at https://superdasheng.wordpress.com/author/superdasheng/
//
//  https://gist.github.com/mobilequickie/56916503a41ebb2374fea241ede26eab

import Foundation
import LoginWithAmazon

class LoginWithAmazonProxy {
    
    static let sharedInstance = LoginWithAmazonProxy()
    
    func login(delegate: AIAuthenticationDelegate) {
        AIMobileLib.authorizeUser(forScopes: ["profile"], delegate: delegate)
    }
}
