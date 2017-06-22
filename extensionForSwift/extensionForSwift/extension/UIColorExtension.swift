//
//  UIColorExtension.swift
//  Zhang8
//
//  Created by pony on 2017/5/5.
//  Copyright © 2017年 kang chao. All rights reserved.
//

import UIKit

public enum ColorType {
    // 背景
    case allBackColor
    
    case bottomButtonType
    // 黑色
    case darkBlack
    case middleBlack
    case lightBlack
    case hexWhiteColor
    //
    case darkGreenColor
    case darkRedColor
    
    case sepLineColor
    // 黄色
    case lightYelloColor
    case middleYelloColor
    case backYelloColor
}

extension UIColor {
    
    /// 扩展uicolor的构造器
    ///
    /// - Parameter type: 颜色类型
    public func colorWithType(type: ColorType) -> UIColor {
        var color = UIColor()
//        switch type {
//        case .bottomButtonType:
//            color = Common.colorWithHexStr(buyBtnColor, alp: 1)
//        case .bottomButtonType:
//            color = Common.colorWithHexStr(buyBtnColor, alp: 1)
//        case .bottomButtonType:
//            color = Common.colorWithHexStr(buyBtnColor, alp: 1)
//        case .bottomButtonType:
//            color = Common.colorWithHexStr(buyBtnColor, alp: 1)
//        case .bottomButtonType:
//            color = Common.colorWithHexStr(buyBtnColor, alp: 1)
//        }
        
        return color
    }
}
