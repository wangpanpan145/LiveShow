//
//  BaseModel.swift
//  LiveShow
//
//  Created by mac on 2021/3/6.
//

import UIKit

class BaseModel: NSObject {
    init(dict: [String: Any]) {
        super.init()
        setValuesForKeys(dict)
    }
    override class func setValue(_ value: Any?, forKey key: String) {
        
    }
}
