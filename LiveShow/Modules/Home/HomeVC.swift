//
//  HomeVC.swift
//  LiveShow
//
//  Created by mac on 2021/1/20.
//

import UIKit
import Alamofire
class HomeVC: BaseVC {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.randomColor()
        setNaviBar()
    }

    private func setNaviBar() -> Void {
        //1.左侧logo
        let logoImage = UIImage(named: "home-logo")
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: logoImage, style: .plain, target: self, action: #selector(clickLogoButton))
        //2.右侧收藏
        let collectionImage = UIImage(named: "search_btn_follow")
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: collectionImage, style: .plain, target: self, action: #selector(clickLogoButton))
        //3.搜索框
        let searchFrame = CGRect(x: 0, y: 0, width: 200, height: 32)
        let searchBar = UISearchBar(frame: searchFrame)
        searchBar.placeholder = "主播/房间号/链接"
        navigationItem.titleView = searchBar
        searchBar.searchBarStyle = .minimal
    }
    @objc func clickLogoButton() -> Void {
        print("点击logo")
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("touchesBegan")
        //let roomVc:UIViewController = RoomVC(nibName: "RoomVC", bundle: Bundle.main)
        //navigationController?.pushViewController(roomVc, animated: true)
    }
}

