//
//  HomeModel.swift
//  LiveShow
//
//  Created by mac on 2021/3/8.
//

import UIKit


struct TStrInt: Codable {
    var int: Int {
        didSet {
            let stringValue = String(int)
            if stringValue != string {
                string = stringValue
            }
            
        }
    }
    var string: String {
        didSet {
            if let intValue = Int(string),intValue != int {
                int = intValue
            }
        }
    }
    
    //自定义解码（通过覆盖默认方法实现）
    init(from decoder: Decoder) throws {
        let singleValueContainer = try decoder.singleValueContainer()
        if let stringValue = try? singleValueContainer.decode(String.self) {
            string = stringValue
            int = Int(stringValue) ?? 0
        } else if let intValue = try? singleValueContainer.decode(Int.self) {
            int = intValue
            string = String(intValue);
        } else {
            int = 0
            string = ""
        }
    }
}



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
    var ID: TStrInt?
    var pid: TStrInt?
    enum CodingKeys: String,CodingKey {
        case ID = "id"
        case name
        case pid
    }
    
}

