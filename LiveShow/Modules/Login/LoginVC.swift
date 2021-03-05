//
//  LoginVC.swift
//  LiveShow
//
//  Created by mac on 2021/3/5.
//

import UIKit

class LoginVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.init(r: 255, g: 255, b: 255)
        let button: UIButton = UIButton.init(type: .custom)
        self.view.addSubview(button)
        button.setTitle("登录", for: .normal)
        button.setTitleColor(UIColor(r: 51, g: 51, b: 51), for: .normal)
        button.frame = CGRect(x: (self.view.frame.width - 200) * 0.5, y: (self.view.frame.height - 50) * 0.5, width: 200, height: 50)
        button.addTarget(self, action: #selector(clickLoginButton(sender:)), for: .touchUpInside)
        button.backgroundColor = UIColor.init(r: 255, g: 127, b: 0)
        button.layer.cornerRadius = 10
    }
    @objc func clickLoginButton(sender: UIButton) -> Void {
        print("登录")
        let requestUrl = "http://test.lexbst.com/bst-app/index.php/phones/codelogin"
        let content = "{\"mobile\":\"13505613657\",\"code\":\"123456\"}"
        
        var parameters: [String: Any]? = nil
        parameters = ["param": content,"partnerName": "bst-project","__version": "4.9.0"]
        
        NetworkTools.requestData(url: requestUrl, method: .post, parameters: parameters) { (response) in
            print(response)
        }
    }
}


/**
 PPNetworkHelper.m--166--->:requestURL:http://test.lexbst.com/bst-app/index.php//phones/codelogin
 requestParameters:{
     param = {"mobile":"13505613657","code":"732175"};
     partnerName = bst-project;
     rand_string = "";
     __version = 4.9.0;
 }
 
 PPNetworkHelper.m--166--->:requestURL:http://test.lexbst.com/bst-app/index.php/user/personal/getinfo
 requestParameters:{
     param = {"mid":17,"token":"658b0a75b3d36305006e8c7d32034ebe0a4ba11c88"};
     partnerName = bst-project;
     rand_string = "MLTXcbO0O0Os";
     __version = 4.9.0;
 }
 
 PPNetworkHelper.m--166--->:requestURL:http://test.lexbst.com/bst-app/index.php//TXLive/room/roomList
 requestParameters:{
     param = {"token":"658b0a75b3d36305006e8c7d32034ebe0a4ba11c88","cid":"0","page":"1","lng":"117.419413","lat":"37.792462","area_code":"371423","keyword":"","page_size":"10"};
     partnerName = bst-project;
     rand_string = "MLTXcbO0O0Os";
     __version = 4.9.0;
 }

 
 */

/**
 LiveBroadNewListSonVC.m--274--->:回放
 PPNetworkHelper.m--166--->:requestURL:http://test.lexbst.com/bst-app/index.php//TXLive/room/roomDetail
 requestParameters:{
     param = {"token":"658b0a75b3d36305006e8c7d32034ebe0a4ba11c88","live_mid":"1"};
     partnerName = bst-project;
     rand_string = "MLTXcbO0O0Os";
     __version = 4.9.0;
 }
 
 PPNetworkHelper.m--166--->:requestURL:http://test.lexbst.com/bst-app/index.php//TXLive/Packet/detail
 requestParameters:{
     param = {"token":"658b0a75b3d36305006e8c7d32034ebe0a4ba11c88","live_mid":"1"};
     partnerName = bst-project;
     rand_string = "MLTXcbO0O0Os";
     __version = 4.9.0;
 }
 
 PPNetworkHelper.m--166--->:requestURL:http://test.lexbst.com/bst-app/index.php//TXLive/Commission/mine
 requestParameters:{
     param = {"token":"658b0a75b3d36305006e8c7d32034ebe0a4ba11c88","mid":"1"};
     partnerName = bst-project;
     rand_string = "MLTXcbO0O0Os";
     __version = 4.9.0;
 }
 
 PPNetworkHelper.m--166--->:requestURL:http://test.lexbst.com/bst-app/index.php//TXLive/Chat/lists
 requestParameters:{
     param = {"token":"658b0a75b3d36305006e8c7d32034ebe0a4ba11c88","live_mid":"1","appoint_time":"1611107099"};
     partnerName = bst-project;
     rand_string = "MLTXcbO0O0Os";
     __version = 4.9.0;
 }
 
 PPNetworkHelper.m--166--->:requestURL:http://test.lexbst.com/bst-app/index.php//TXLive/gift/lists
 requestParameters:{
     param = {"token":"658b0a75b3d36305006e8c7d32034ebe0a4ba11c88"};
     partnerName = bst-project;
     rand_string = "MLTXcbO0O0Os";
     __version = 4.9.0;
 }
 */

/**
 PPNetworkHelper.m--166--->:requestURL:http://test.lexbst.com/bst-app/index.php//TXLive/room/roomDetail
 requestParameters:{
     param = {"token":"658b0a75b3d36305006e8c7d32034ebe0a4ba11c88","live_mid":"120"};
     partnerName = bst-project;
     rand_string = "MLTXcbO0O0Os";
     __version = 4.9.0;
 }
 */
