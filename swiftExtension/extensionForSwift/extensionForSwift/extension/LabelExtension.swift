//
//  LabelExtention.swift
//  Zhang8
//
//  Created by pony on 2017/4/28.
//  Copyright © 2017年 kang chao. All rights reserved.
//

import UIKit

public enum LLabelType : Int {
    case centerType //
    
    case bottomType //
    
    case otherType //
    
}
extension UILabel {
    
    /// label 扩展初始化器
    ///
    /// - Parameters:
    ///   - type: 类型
    ///   - titleStr: 标题
    public convenience init(type: LLabelType, titleStr: String) {
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
        
    }
    
    private func makeBottomButton(titleStr: String) {

    }
    
}
