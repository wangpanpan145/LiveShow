//
//  BaseVC.swift
//  LiveShow
//
//  Created by mac on 2021/1/20.
//

import UIKit

class BaseVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

}
