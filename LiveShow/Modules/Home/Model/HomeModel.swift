//
//  HomeModel.swift
//  LiveShow
//
//  Created by mac on 2021/3/8.
//

import UIKit

class HomeModel: NSObject {
   
}
struct LiveCateModel: Codable {
    var message: String?
    var code: Int?
    var info: LiveCateInfoModel?
}

struct LiveCateInfoModel: Codable {
    var top_cate: [LiveCateInfoTopCateModel]?
}
struct LiveCateInfoTopCateModel: Codable {
    var name: String?
    var nameTest: String?
    //var id: Int64?
    var pid: Int?
}
