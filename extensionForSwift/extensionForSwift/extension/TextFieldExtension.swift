//
//  TextFieldExtension.swift
//  Zhang8
//
//  Created by pony on 2017/5/3.
//  Copyright © 2017年 kang chao. All rights reserved.
//

import UIKit
protocol textediting {
    var str:String{ set get}
}

extension UITextField {
    
    /// 扩展的textfield初始化器
    ///
    /// - Parameters:
    ///   - limitLength: 限制输入长度
    ///   - placeholderStr: placeholder
    public convenience init(limitLength: Int, placeholderStr: String) {
        self.init()

        self.keyboardType = .decimalPad
        self.textAlignment = .center
        self.placeholder = placeholderStr
        self.layer.borderColor = Common.colorWithHexStr(sepLineColor, alp: 1).cgColor
        self.layer.borderWidth = 0.5
        self.textColor = Common.colorWithHexStr(hexBlackColor, alp: 1)
        self.font = UIFont(name: Avenir_m, size: 15)
        
        if limitLength != 0 {
            self.tag = limitLength
            self.addTarget(self, action: #selector(self.makeLimitLength), for: .editingChanged)
        }
        
        self.doneHiddenKeyboard()
        
    }
    
    @objc private func makeLimitLength() {
        let length = self.text?.characters.count ?? 0
        if length >= self.tag {
            return
        }
    }
    
    func addIntervalValue() {
        self.addTarget(self, action: #selector(self.addInterval), for: .editingChanged)
    }
    
    @objc private func addInterval() {
        
        let str = self.text?.replacingOccurrences(of: " ", with: "") ?? ""
        if Common.remainder(left: (Double(str.characters.count)), right: 4) == 0 {
            
            self.text = (self.text ?? "") + " "
        }
    }
    
    // done 隐藏键盘
    func doneHiddenKeyboard() {
        self.addTarget(self, action: #selector(self.hiddenSelf), for: .editingDidEndOnExit)
    }
    
    @objc private func hiddenSelf() {
        self.resignFirstResponder()
    }
    
}

