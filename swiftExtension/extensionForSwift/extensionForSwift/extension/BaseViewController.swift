//
//  BaseViewController.swift
//  Zhang8
//
//  Created by kang chao on 16/10/12.
//  Copyright © 2016年 kang chao. All rights reserved.
//

import UIKit


class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = .white
        self.navigationController?.navigationBar.barTintColor = UIColor.white
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        setBackStyle()
        let name = self.navigationController?.navigationItem.title
 
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        let name = self.navigationController?.navigationItem.title
    
    }
    
    // 透明度并去掉底部一像素线条
    func setTransparentNavi() {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.clipsToBounds = true
    }
    
    // 标题颜色
    func setStyleFontNavi(_ color:String, alpha:CGFloat, font:String, size:CGFloat) {
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName:Common.colorWithHexStr(color, alp: alpha), NSFontAttributeName:UIFont(name: font, size: size)!]
    }
    
    // 设置导航栏返回键
    func setBackStyle() {
        if ((self.navigationController?.viewControllers.count) ?? 0) > 1 {
            let backButton = UIButton(type: .custom)
            backButton.frame = CGRect(x: 0, y: 0, width: 64, height: 44)
            backButton.setImage(UIImage(named: "btn_back"), for: UIControlState())
            backButton.imageEdgeInsets = UIEdgeInsetsMake(10, -7, 10, 55)
            backButton.addTarget(self, action: #selector(self.backAction(_:)), for: .touchUpInside)
            let leftItem = UIBarButtonItem(customView: backButton)
            self.navigationItem.leftBarButtonItem = leftItem
            
            // 设置leftBarButtonItem后右滑返回上个界面手势会消失，在次处理
            if ((self.navigationController?.responds(to: #selector(getter: UINavigationController.interactivePopGestureRecognizer))) != nil) {
                self.navigationController!.interactivePopGestureRecognizer!.delegate = nil;
            }
        }
    }
    
    // 点击空白处回收键盘
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @objc func backAction(_ sender:UIButton) {
        _ = self.navigationController?.popViewController(animated: true)
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
// MARK: 汉字转拼音
extension String{
    func transformToPinYin()->String{
        let mutableString = NSMutableString(string: self)
        CFStringTransform(mutableString, nil, kCFStringTransformToLatin, false)
        CFStringTransform(mutableString, nil, kCFStringTransformStripDiacritics, false)
        let string = String(mutableString)
        return string.replacingOccurrences(of: " ", with: "")
    }
}

