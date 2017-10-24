//
//  Model.swift
//  RxSwift&MVVMDemo
//
//  Created by welkj on 2017/10/23.
//  Copyright © 2017年 Heinz. All rights reserved.
//

import UIKit

class Model: NSObject {
    
    var red: UInt = 0
    var green: UInt = 0
    var blue: UInt = 0
    var color: UIColor {
        get {
            print("red: \(red/255), green: \(green), blue: \(blue)")
            return UIColor.init(red: CGFloat(red)/255.0,
                                green: CGFloat(green)/255.0,
                                blue: CGFloat(blue)/255.0, alpha: 1)
        }
    }
    

}

//这个是用来模拟数据到达后的视图，正常情况下不会有View在Model中初始化，请忽略
extension Model {
    
    static let fakeView = UIView()
    
    
}

