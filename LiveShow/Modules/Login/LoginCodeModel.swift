//
//  LoginCodeModel.swift
//  LiveShow
//
//  Created by mac on 2021/3/6.
//

import UIKit

class LoginCodeModel: BaseModel {
    var message: String?
}

struct CodeModel: Codable {
    //var code: String?
    var message: String?
    //var info: CodeInfoModel?
    
}
struct CodeInfoModel: Codable {
    
}

/**
 var code: String = ""
 var message: String = ""
 var info: Any? = nil
 */
