//
//  MainTabBarController.swift
//  LiveShow
//
//  Created by mac on 2021/1/20.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.yellow
        addSonController(storyName: "Home")
        addSonController(storyName: "Rank")
        addSonController(storyName: "Discover")
        addSonController(storyName: "Profile")
        
        self.tabBar.tintColor = UIColor.orange
        
    }
    
    func addSonController(storyName:String) -> Void {
        let sonVC = UIStoryboard(name: storyName, bundle: nil).instantiateInitialViewController()!
        addChild(sonVC)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
