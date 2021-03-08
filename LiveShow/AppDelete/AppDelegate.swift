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
        //默认写死
        let userDefaults = UserDefaults.standard
        userDefaults.setValue("658b0a75b3d36305006e8c7d32034ebe0a4ba11c88", forKey: "token")
        userDefaults.synchronize()
        //默认写死
        
        self.window = UIWindow.init(frame: UIScreen.main.bounds)
        self.window?.makeKeyAndVisible()
        changeRootViewController()
        //全局
        UINavigationBar.appearance().barTintColor = UIColor.black
        return true
    }
    func changeRootViewController() {
        let userDefaults = UserDefaults.standard
        if let token = userDefaults.value(forKey: "token") {
            print("token:\(token)")
            UIApplication.shared.keyWindow?.rootViewController = MainTabBarController.init()
        } else {
            UIApplication.shared.keyWindow?.rootViewController = LoginVC.init()
        }
    }
}

