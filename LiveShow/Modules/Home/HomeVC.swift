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
        
        let requestUrl = "http://test.lexbst.com/bst-app/index.php/market/goods/cates1"
        let content = "{\"token\":\"\(UserDefaults.standard.value(forKey: "token")!)\"}"
        var parameters: [String: Any]? = nil
        parameters = ["param": content,"partnerName": "bst-project","__version": "4.9.0"]
        NetworkTools.requestData(url: requestUrl, method: .post, parameters: parameters) { (response) in
            print("response:\(response)")
            //JSON
            //guard let resultJson = response.result.value else {return}
            //print("resultJson:\(resultJson)")
            //字典
            //guard let resultDict = resultJson as? [String: Any] else { return }
            //print("resultJson:\(resultDict)")
            //Model
            if let data: Data = response.data {
                do {
                    let baseModel = try JSONDecoder().decode(LiveCateModel.self, from: data)
                    for i in baseModel.info!.top_cate! {
                        print(i)
                    }
                    if let pid = baseModel.info?.top_cate?.first?.pid?.string {
                        print(pid)
                    }
                } catch let error as NSError {
                    print("json解析出错\(error.userInfo)")
                }
            }
        }
    }
}
