//
//  Extension-UIColor.swift
//  LiveShow
//
//  Created by mac on 2021/1/21.
//

import Foundation
import UIKit

extension UIColor {
    //在扩展中给系统类扩充构造函数，只能扩充‘便利’构造函数
    //RGB
    convenience init(r:CGFloat,g:CGFloat,b:CGFloat,alpha:CGFloat = 1.0) {
        //必须self.init 后面代码需要手动写 代码不提示
        self.init(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: alpha)
    }
    //hex
    convenience init?(hex:String,alpha:CGFloat = 1.0) {
        var tmpHex = hex
        //截取字符串
        if tmpHex.hasPrefix("0x") || tmpHex.hasPrefix("##") || tmpHex.hasPrefix("#") {
            if tmpHex.hasPrefix("#") {
                tmpHex = (tmpHex as NSString).substring(from: 1)
            } else {
                tmpHex = (tmpHex as NSString).substring(from: 2)
            }
            //print(tmpHex)
        }
        //判断长度
        guard tmpHex.count == 6 else {
            print("颜色格式不对")
            return nil
        }
        //转大写
        tmpHex = tmpHex.uppercased()
        var range = NSRange(location: 0, length: 2)
        let rHex = (tmpHex as NSString).substring(with: range)
        range.location = 2
        let gHex = (tmpHex as NSString).substring(with: range)
        range.location = 4
        let bHex = (tmpHex as NSString).substring(with: range)
        //print(rHex,gHex,bHex)
        //讲十六进制转成emoji表情
        var r:UInt32 = 0,g:UInt32 = 0,b:UInt32 = 0
        Scanner(string: rHex).scanHexInt32(&r)
        Scanner(string: gHex).scanHexInt32(&g)
        Scanner(string: bHex).scanHexInt32(&b)
        //print(r,g,b)
        
        //print(tmpHex)
        self.init(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: alpha)
    }
    //随机颜色
    class func randomColor() -> UIColor {
        return UIColor(r: CGFloat(arc4random() % 255), g: CGFloat(arc4random() % 255), b: CGFloat(arc4random() % 255))
    }
    class func getRGBDelta(firstColor:UIColor,secondColor:UIColor) -> (CGFloat,CGFloat,CGFloat) {
        guard let firstCpms = firstColor.cgColor.components else {
            fatalError("保证选中颜色是RGB方式传入")
        }
        guard let secondCpms = secondColor.cgColor.components else {
            fatalError("保证普通颜色是RGB方式传入")
        }
        let secondRGB = secondColor.getRGB()
        
        return (firstCpms[0] * 255 - secondCpms[0] * 255,firstCpms[1] * 255 - secondRGB.1,firstCpms[2] * 255 - secondRGB.2)
        
    }
    func getRGB() -> (CGFloat,CGFloat,CGFloat) {
        guard let cmps = self.cgColor.components else {
            fatalError("保证普通颜色是rgb方式传入")
        }
        return (cmps[0] * 255,cmps[1] * 255,cmps[1] * 255)
    }
}

