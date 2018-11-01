//
//  AppDelegate.swift
//  AuthLWA
//
//  Created by Hills, Dennis on 10/31/18.
//  Copyright © 2018 Hills, Dennis. All rights reserved.
//
// Gist: https://gist.github.com/mobilequickie/baf1cd3a2c4a6e04fd0d1756f9543d67

import UIKit
import LoginWithAmazon

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        return true
    }
    
    func application(_ application: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        return AIMobileLib.handleOpen(url, sourceApplication: UIApplication.OpenURLOptionsKey.sourceApplication.rawValue)
    }

    func applicationWillResignActive(_ application: UIApplication) {}
    func applicationDidEnterBackground(_ application: UIApplication) {}
    func applicationWillEnterForeground(_ application: UIApplication) {}
    func applicationDidBecomeActive(_ application: UIApplication) {}
    func applicationWillTerminate(_ application: UIApplication) {}
}

