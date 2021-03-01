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
        
        self.view.backgroundColor = UIColor(hex: "ff0000")
        self.view.backgroundColor = UIColor.randomColor()
        setNaviBar()
        //http://qf.56.com/home/v4/moreAnchor.ios
        //http://hqhh.hqhh520.com/zuul/v1/business/app/seller/getOneSysClassifications
        var requestUrl:String?
        let requestMethod:HTTPMethod = .post
        /// 请求的参数，[String: Any]类型的数据，可以为nil
        var requestParameters:Parameters? = nil
        let requestEncoding:ParameterEncoding = JSONEncoding.default
        /// 请求的headers，[String: String]类型，可以为nil
        let requestHeaders:HTTPHeaders? = nil
        
        requestUrl = "http://hqhh.hqhh520.com/zuul/v1/business/app/seller/getOneSysClassifications"
        requestParameters = ["parentId":"-1"]
        
        //requestUrl = "http://mbl.56.com/home/v4/moreAnchor.ios"
        //requestParameters = ["type":"0","index":"1","size":40]

        //http://qf.56.com/home/v4/moreAnchor.ios?type=0&index=1&size=40
        //http://qf.56.com/home/v4/moreAnchor.android?&type=0&index=1
        //http://mbl.56.com/home/v4/moreAnchor.ios?type=0&index=1&size=40
        
        
        /// 创建一个数据请求对象
        let dataRequest = Alamofire.request(requestUrl! , method: requestMethod, parameters: requestParameters, encoding: requestEncoding, headers: requestHeaders)
        dataRequest.responseJSON { response in
            //print(response)
            //print(response.result.isSuccess)
        }
    
        
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
        let roomVc:UIViewController = RoomVC(nibName: "RoomVC", bundle: Bundle.main)
        navigationController?.pushViewController(roomVc, animated: true)
    }
}
/**
 0 1 2 3  4  5  6   7
 1 2 4 8  16 32 64  128
 
 18656942144
 */
