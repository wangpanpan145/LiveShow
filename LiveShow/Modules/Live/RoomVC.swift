//
//  RoomVC.swift
//  LiveShow
//
//  Created by mac on 2021/1/22.
//

import UIKit

class RoomVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("jj")
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
}
