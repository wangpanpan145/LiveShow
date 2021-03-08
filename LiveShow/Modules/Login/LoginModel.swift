//
//  LoginModel.swift
//  LiveShow
//
//  Created by mac on 2021/3/8.
//

import UIKit

struct LoginModel: Codable {
    var info: LoginInfoModel?
}
struct LoginInfoModel: Codable {
    var token: String?
    var avatar: String?
    var nickname: String?
    var rand_string: String?
    var sig: String?
    var username: String?
}
