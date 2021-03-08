//
//  NetworkTools.swift
//  LiveShow
//
//  Created by mac on 2021/3/3.
//

import UIKit
import Alamofire
class NetworkTools: NSObject {
    class func requestData(url: String,method: HTTPMethod,parameters: [String: Any]?,finishedCallBack:@escaping (_ result: DataResponse<Any>)->()) {
        let headers: HTTPHeaders? = nil
        let dataRequest: DataRequest = Alamofire.request(url, method: method, parameters: parameters, encoding: URLEncoding.default, headers: headers)
        dataRequest.responseJSON { (response) in
            if response.result.isSuccess {
                //print("response:\(response)")
                finishedCallBack(response)
            }
        }
    }
}
/**
 闭包 参数里面其实只能是类型 加上result 我感觉只是增加可读性而已 所有前面加个_ 没有标签
 */
