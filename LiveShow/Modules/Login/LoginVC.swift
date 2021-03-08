//
//  LoginVC.swift
//  LiveShow
//
//  Created by mac on 2021/3/5.
//

import UIKit
import Alamofire
class LoginVC: UIViewController {
    var tf: UITextField?
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
        
        let tf = UITextField.init(frame: CGRect(x: 20, y: button.frame.minY - 150, width: self.view.frame.width - 160, height: 40))
        self.view.addSubview(tf)
        tf.borderStyle = .roundedRect
        tf.placeholder = "请输入验证码"
        self.tf = tf
        
        let codeButton: UIButton = UIButton.init(type: .custom)
        self.view.addSubview(codeButton)
        codeButton.setTitle("获取验证码", for: .normal)
        codeButton.setTitleColor(UIColor(r: 51, g: 51, b: 51), for: .normal)
        codeButton.frame = CGRect(x: tf.frame.maxX + 20, y: 0, width: 100, height: 30)
        codeButton.center.y = tf.center.y
        codeButton.addTarget(self, action: #selector(clickCodeButton(sender:)), for: .touchUpInside)
        codeButton.backgroundColor = UIColor.lightGray
        codeButton.layer.cornerRadius = 10
        codeButton.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        AppDelegate.init().changeRootViewController()
    }
    @objc func clickLoginButton(sender: UIButton) -> Void {
        print("登录")
        guard let codeText = self.tf?.text else { return }
        if codeText.count == 0 {
            print("验证码不能为0")
            return
        }
        let requestUrl = "http://test.lexbst.com/bst-app/index.php/phones/codelogin"
        let content = "{\"mobile\":\"13505613657\",\"code\":\"\(codeText)\"}"
        var parameters: [String: Any]? = nil
        parameters = ["param": content,"partnerName": "bst-project","__version": "4.9.0"]
        NetworkTools.requestData(url: requestUrl, method: .post, parameters: parameters) { (response) in
            print("response:\(response)")
            //JSON
            guard let resultJson = response.result.value else {return}
            print("resultJson:\(resultJson)")
            //字典
            guard let resultDict = resultJson as? [String: Any] else { return }
            print("resultJson:\(resultDict)")
            //Model
            if let data: Data = response.data {
                let baseModel: LoginModel  = try! JSONDecoder().decode(LoginModel.self, from: data)
                let userDefaults = UserDefaults.standard
                userDefaults.setValue(baseModel.info?.token, forKey: "token")
                userDefaults.setValue(baseModel.info?.avatar, forKey: "avatar")
                userDefaults.setValue(baseModel.info?.nickname, forKey: "nickname")
                userDefaults.setValue(baseModel.info?.rand_string, forKey: "rand_string")
                userDefaults.setValue(baseModel.info?.sig, forKey: "sig")
                userDefaults.setValue(baseModel.info?.username, forKey: "username")
                userDefaults.synchronize()
                //切换控制器
                AppDelegate.init().changeRootViewController()
            }
        }
    }
    @objc func clickCodeButton(sender: UIButton) -> Void {
        print("获取验证码")
        let requestUrl = "http://test.lexbst.com/bst-app/index.php/phones/sendMsg"
        let content = "{\"phone\":\"13505613657\"}"
        var parameters: [String: Any]? = nil
        parameters = ["param": content,"partnerName": "bst-project","__version": "4.9.0"]
        NetworkTools.requestData(url: requestUrl, method: .post, parameters: parameters) { (response) in
            print("response:\(response)")
            //JSON
            guard let resultJson = response.result.value else {return}
            print("resultJson:\(resultJson)")
            //字典
            guard let resultDict = resultJson as? [String: Any] else { return }
            print("resultJson:\(resultDict)")
            //Model
            if let data: Data = response.data {
                let baseModel: BaseModel  = try! JSONDecoder().decode(BaseModel.self, from: data)
                if let message = baseModel.message {
                    print(message)
                }
            }
        }
    }
    deinit {
        print("LoginVC---销毁")
    }
}


/**
 guard let resultDic = response.result.value as? [String: Any] else {return}
 let jsonDecoder = JSONDecoder()
 let model: BaseModel = try! jsonDecoder.decode(BaseModel.self, from: response.data!)
 print("resultDic:\(resultDic)")

 
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

