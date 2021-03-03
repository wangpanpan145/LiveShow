//
//  BaseNavigationVC.swift
//  LiveShow
//
//  Created by mac on 2021/1/20.
//

import UIKit

class BaseNavigationVC: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //1.使用运行时，打印手势中所有属性
        /**
         var count:UInt32 = 0
         let ivars = class_copyIvarList(UIGestureRecognizer.self, &count)!
         for i in 0..<count {
             let nameP = ivar_getName(ivars[Int(i)])
             let name = String(cString: nameP!)
             print(name)
         }
         */
        
        guard let targets = interactivePopGestureRecognizer!.value(forKey: "_targets") as? [NSObject] else {
            return
        }
        let targetObjc = targets[0]
        let target = targetObjc.value(forKey: "target")
        //如果"handleNavigationTransition" 不加圆括号提示：No method declared with Objective-C selector 'hanlde' Wrap the selector name in parentheses to suppress this warning [没有使用Objective-C选择器“hanlde”声明的方法将选择器名称括在圆括号中以抑制此警告]
        let action = Selector(("handleNavigationTransition:"))
        
        
        //print(targets)
        //print(targetObjc)
        
        let panGes = UIPanGestureRecognizer(target: target, action: action)
        view.addGestureRecognizer(panGes)
        
    }
    

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        viewController.hidesBottomBarWhenPushed = true
        super.pushViewController(viewController, animated: animated)
    }
}
