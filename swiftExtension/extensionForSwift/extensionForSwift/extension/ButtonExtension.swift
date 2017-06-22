//
//  ButtonExtention.swift
//  Zhang8
//
//  Created by pony on 2017/4/28.
//  Copyright © 2017年 kang chao. All rights reserved.
//

import UIKit

public enum LButtonType : Int {
    case centerType //
    
    case bottomType //
    
    case otherType //
    
}
extension UIButton {
    
    
    /// button 扩展初始化器
    ///
    /// - Parameters:
    ///   - type: 类型
    ///   - titleStr: 标题
    public convenience init(type: LButtonType, titleStr: String) {
        self.init()
        
        switch type {
        case .centerType:
            makeCenterButton(titleStr: titleStr)
        case .bottomType:
            makeBottomButton(titleStr: titleStr)
        case .otherType:
            break
        }
        
    }
    
    private func makeCenterButton(titleStr: String) {
        self.setTitle(titleStr, for: UIControlState())
        self.layer.cornerRadius = 40/2
//        self.backgroundColor = Common.colorWithHexStr(buyBtnColor, alp: 1)
//        self.titleLabel?.font = UIFont(name: Avenir_m, size: 16)
    }
    
    private func makeBottomButton(titleStr: String) {
        self.setTitle(titleStr, for: UIControlState())
        self.setTitleColor(UIColor.white, for: UIControlState())
//        self.titleLabel?.font = UIFont(name: Avenir_m, size: 16)
//        self.backgroundColor = Common.colorWithHexStr(buyBtnColor, alp: 1)
    }
    
}
