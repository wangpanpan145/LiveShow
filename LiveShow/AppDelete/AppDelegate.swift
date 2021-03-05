//
//  AppDelegate.swift
//  LiveShow
//
//  Created by mac on 2021/1/20.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        self.window = UIWindow.init(frame: UIScreen.main.bounds)
        self.window?.makeKeyAndVisible()
        //self.window?.rootViewController = MainTabBarController.init()
        self.window?.rootViewController = LoginVC.init()
        //全局
        UINavigationBar.appearance().barTintColor = UIColor.black
        return true
    }

}

