//
//  ViewController.swift
//  swiftExtension
//
//  Created by pony on 2017/6/22.
//  Copyright © 2017年 pony. All rights reserved.
//

import UIKit
import extensionForSwift

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let tf = UITextField(limitLength: 10, placeholderStr: "shuzia")
        
        self.view.addSubview(tf)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

