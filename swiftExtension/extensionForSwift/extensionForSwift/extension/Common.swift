//
//  Common.swift
//  Zhang8
//
//  Created by kang chao on 16/10/12.
//  Copyright © 2016年 kang chao. All rights reserved.
//

import UIKit

typealias Task = (_ cancel : Bool) -> Void

class Common: NSObject {
    
    // 屏幕宽度和高度
    static let screen_width  = UIScreen.main.bounds.size.width
    static let screen_height = UIScreen.main.bounds.size.height
    static let navi_h = 64
    
    // MARK: 验证手机号
    static func validTelephoneNumber(_ num:String) -> Bool {
        if num.isEmpty {
            return false;
        }else{
            let regex = "^(13[0-9]|12[0-9]|15[012356789]|16[0-9]|17[0-9]|19[0-9]|18[0-9]|14[0-9])[0-9]{8}$";
            let pre = NSPredicate(format: "SELF MATCHES %@", regex);
            let isMatch:Bool = pre.evaluate(with: num);
            if !isMatch {
                return false
            } else {
                return true
            };
        }
    }
    
    // MARk: 密码必须为6-16位字母加数字组成
    static func verifyPasswordNumber(_ num:String) -> Bool {
        if num.isEmpty {
            return false
        }else{
            let regex = "(?![^a-zA-Z]+$)(?!\\D+$).{6,16}$";
            let pre = NSPredicate(format: "SELF MATCHES %@", regex);
            let isMatch:Bool = pre.evaluate(with: num);
            if !isMatch {
                return false
            } else {
                return true
            }
        }
    }
    
    // MARK: 富文本构造
    static func attributeStrWithStr(_ str:String, range:[NSMutableDictionary]) -> NSMutableAttributedString {
        let attributeStr = NSMutableAttributedString(string: str)
        
        for index in 0 ..< range.count {
            let font  = range[index]["font"]
            let color = range[index]["color"]
            
            let loc = range[index]["loc"]
            let len = range[index]["len"]
            
            var locInt = 0
            var lenInt = 0
            
            if let aloc = loc {
                locInt = Int(String(describing: aloc))!
            }
            if let alen = len {
                lenInt = Int(String(describing: alen))!
            }
            
            attributeStr.addAttributes([NSFontAttributeName:font!, NSForegroundColorAttributeName:color!], range: NSMakeRange(locInt, lenInt))
        }
        return attributeStr
    }
    
    // MARK: 随机颜色
    static func randomColor() -> UIColor {
        let r = CGFloat(arc4random_uniform(255 - 0) + 0)/CGFloat(256.0)
        let g = CGFloat(arc4random_uniform(255 - 0) + 0)/CGFloat(256.0)
        let b = CGFloat(arc4random_uniform(255 - 0) + 0)/CGFloat(256.0)
        return UIColor(red: r, green: g, blue: b, alpha: 1)
    }
    
    // MARK: ========================
    // MARK: 计算文本高度
    static func heightWithLabel(_ text:NSString, font:UIFont, width:CGFloat)->CGFloat {
        let rect = text.boundingRect(with: CGSize(width: width, height: 10000), options: [.truncatesLastVisibleLine, .usesFontLeading, .usesLineFragmentOrigin], attributes: [NSFontAttributeName:font], context: nil);
        return rect.size.height;
    }
    
    // MARK: ========================
    // MARK: 计算文本宽度
    static func widthWithLabel(_ text:NSString, font:UIFont, height:CGFloat)->CGFloat {
        let rect = text.boundingRect(with: CGSize(width: 10000, height: height), options: [.truncatesLastVisibleLine, .usesFontLeading, .usesLineFragmentOrigin], attributes: [NSFontAttributeName:font], context: nil);
        return rect.size.width;
    }
    
    // MARK: 获取设备UUID
    static func getUUID() -> UUID {
        var uuid = UIDevice.current.identifierForVendor
        if uuid == nil {
            uuid = UUID(uuidString: "0000")
        } else {
            uuid = UIDevice.current.identifierForVendor!
        }
        return uuid!
    }
    
    
    // MARK: 金额等逗号数字格式｜含小数点
    static  func appendCommaWithNumber(_ num:Double) -> String {
        let numberFormatter1 = NumberFormatter()
        numberFormatter1.positiveFormat = "###,##0.00"
        var str = String()
        str = numberFormatter1.string(from: NSNumber(value: num as Double))!
        return str
    }
    
    // MARK: 保留0位小数
    static func saveZeroPointWithNumber(_ num:Double) -> String {
        let numberFormatter1 = NumberFormatter()
        numberFormatter1.positiveFormat = "#####0"
        var str = String()
        str = numberFormatter1.string(from: NSNumber(value: num as Double))!
        return str
    }
    
    // MARK: 保留两位小数
    static func saveTwoPointWithNumber(_ num:Double) -> String {
        let numberFormatter1 = NumberFormatter()
        numberFormatter1.positiveFormat = "#####0.00"
        var str = String()
        str = numberFormatter1.string(from: NSNumber(value: num as Double))!
        return str
    }
    
    // MARK: 保留两位小数
    static func saveTwoPointWithNumberString(_ numStr:String) -> String {
        let numberFormatter1 = NumberFormatter()
        numberFormatter1.positiveFormat = "#####0.00"
        var str = String()
        str = numberFormatter1.string(from: NSNumber(value: (numStr as NSString).doubleValue))!
        return str
    }
    
    // MARK: 银行卡号部分隐藏掉
    static func hideBandCardNum(_ num:String?) -> String {
        if num == nil {
            return "信息有误，请联系客服!"
        } else {
            if num! == "" || (num?.characters.count)! < 10 {
                return "信息有误，请联系客服!"
            } else {
                var numStr = num!
                numStr.replaceSubrange((numStr.characters.index(numStr.startIndex, offsetBy: 0) ..< (num?.characters.index((num?.endIndex)!, offsetBy: -4))!), with: "**** **** **** **** ")
                return numStr
            }
        }
    }
    
    // MARK: 手机号码部分隐藏
    static func hidePhoneNum(_ num:String?) -> String {
        if num == nil {
            return ""
        } else {
            if num! == "" || (num?.characters.count)! < 11 {
                return ""
            } else {
                var numStr = num!
                numStr.replaceSubrange((numStr.characters.index(numStr.startIndex, offsetBy: 3) ..< (num?.characters.index((num?.endIndex)!, offsetBy: -4))!), with: " **** ")
                return numStr
            }
        }
    }
    // MARK: 隐藏字符串内容
    static func hideStringContain(_ string:String?, startIndex: Int, endIndex: Int, replaceString:String) -> String {
        if string == nil {
            return "信息有误，请联系客服!"
        } else {
            if (string?.characters.count)! < endIndex {
                return "信息有误，请联系客服!"
            } else {
                var numStr = string!
                numStr.replaceSubrange((numStr.characters.index(numStr.startIndex, offsetBy: startIndex) ..< (string?.characters.index((string?.endIndex)!, offsetBy: 0 - endIndex))!), with: replaceString)
                return numStr
            }
        }
    }
    
    // MARK: 获取版本号
    static func getAppVersion() -> String {
        let infoDic = Bundle.main.infoDictionary
        let versionNum = String(describing: infoDic!["CFBundleVersion"]!)
        let versionStr = String(describing: infoDic!["CFBundleShortVersionString"]!)
        let versionText = versionStr+"."+versionNum
        return versionText
    }
    
    // MARK: 颜色转化十六进制
    static func colorWithHexStr(_ hex:String, alp:CGFloat) -> UIColor {
        var str = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased() as NSString
        //String should be 6 or 8 characters
        if str.length < 6 { return UIColor.black; }
        // strip 0X if it appears
        if str.hasPrefix("0X") { str = str.substring(from: 2) as NSString; }
        if str.length != 6 { return UIColor.black; }
        
        //Separate into r, g, b substrings
        var range = NSRange();
        range.length = 2;
        range.location = 0; let rs = str.substring(with: range);
        range.location = 2; let gs = str.substring(with: range);
        range.location = 4; let bs = str.substring(with: range);
        
        //Scan values
        var r:UInt32 = 0, g:UInt32 = 0, b:UInt32 = 0;
        let _ = (Scanner.localizedScanner(with: rs) as AnyObject).scanHexInt32(&r);
        let _ = (Scanner.localizedScanner(with: gs) as AnyObject).scanHexInt32(&g);
        let _ = (Scanner.localizedScanner(with: bs) as AnyObject).scanHexInt32(&b);
        
        return UIColor(red: CGFloat(CGFloat(r) / 255.0), green: CGFloat(CGFloat(g) / 255.0),
                       blue: CGFloat(CGFloat(b) / 255.0), alpha: alp);
    }
    
    // MARK: RGB颜色转化
    static func RGBA (_ r:CGFloat, g:CGFloat, b:CGFloat, a:CGFloat) -> UIColor {
        return UIColor (red: r/255.0, green: g/255.0, blue: b/255.0, alpha: a)
    }
    
    // MARK: 判断字符串
    static func isEmptyOfStr(str:String?) -> Bool {
        if str == nil {
            return false
        } else {
            if (str?.characters.count)! < 1 {
                return false
            } else {
                return true
            }
        }
    }
    
    // MARK: 解包
    static func unpackOptionalParam(param: Optional<Any>) -> String {
        if let value = param {
            var str = String(describing: value)
            if Double(str) != nil {
                if str.contains(".") {
                    let numberFormatter1 = NumberFormatter()
                    numberFormatter1.positiveFormat = "##0.00"
                    str = numberFormatter1.string(from: NSNumber(value: Double(str)!))!
                }
            }
            return str
        }else{
            return "0"
        }
    }
    
    // MARK: 时间截取
    static func cutTimeNum(time:String) -> String {
        if time == "" || time.characters.count < 11 {
            return time
        }else{
            var timeStr = time
            let end = timeStr.index(timeStr.startIndex, offsetBy: 10)
            timeStr = timeStr.substring(to: end)
            return timeStr
        }
    }
    
    // MARK: 版本号
    static func appVersion() -> String {
        let infoDic = Bundle.main.infoDictionary
        // let versionNum = String(describing: infoDic!["CFBundleVersion"]!)
        let versionStr = String(describing: infoDic!["CFBundleShortVersionString"]!)
        let versionText = versionStr
        return versionText
    }
    
    // MARK: 检测版本更新
    static func checkAppVersion(currentVersion:String, appVersion:String) -> Bool {
        let a = appVersion.replacingOccurrences(of: ".", with: "")
        let b = currentVersion.replacingOccurrences(of: ".", with: "")
        
        if (Double(a) ?? 0) >= (Double(b) ?? 0) {
            return true
        }
        
        return false
    }
    static func isNeedUpdateAppVersion(currentVersion:String, appVersion:String) -> Bool {
        let a = appVersion.replacingOccurrences(of: ".", with: "")
        let b = currentVersion.replacingOccurrences(of: ".", with: "")
        
        if (Double(a) ?? 0) > (Double(b) ?? 0) {
            return true
        }
        
        return false
    }
    // 下划线
    static func UnderLine(text:String) -> NSAttributedString {
        let attribtDic =  [NSUnderlineStyleAttributeName: NSNumber(value:NSUnderlineStyle.styleSingle.rawValue)]
        
        let attribtStr =  NSMutableAttributedString(string:text, attributes:attribtDic)
        return attribtStr
    }
//    // 下划线
//    static func UnderLineWithRange(text:String, range: NSRange) -> NSAttributedString {
//        let attribtDic =  [NSUnderlineStyleAttributeName: NSNumber(value:NSUnderlineStyle.styleSingle.rawValue)]
//        
//        let attribtStr =  NSMutableAttributedString(
//        return attribtStr
//    }
    
    // 延时执行任务
    static func delay(_ time: TimeInterval, task: @escaping ()->()) ->  Task? {
        
        func dispatch_later(block: @escaping ()->()) {
            let t = DispatchTime.now() + time
            DispatchQueue.main.asyncAfter(deadline: t, execute: block)
        }
        var closure: (()->Void)? = task
        var result: Task?
        
        let delayedClosure: Task = {
            cancel in
            if let internalClosure = closure {
                if (cancel == false) {
                    DispatchQueue.main.async(execute: internalClosure)
                }
            }
            closure = nil
            result = nil
        }
        
        result = delayedClosure
        
        dispatch_later {
            if let delayedClosure = result {
                delayedClosure(false)
            }
        }
        return result
    }
    
    static func cancel(_ task: Task?) {
        task?(true)
    }
    
    // 取余
    static func remainder (left:Double, right:Double) -> Double {
        return left.truncatingRemainder(dividingBy: right)
    }
    
}




