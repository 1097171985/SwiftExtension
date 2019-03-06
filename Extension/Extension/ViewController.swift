//
//  ViewController.swift
//  Extension
//
//  Created by WJF on 2019/3/5.
//  Copyright © 2019 wjf. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("asasas321.000".toInt())
        let array = ["a", "b", "c"]
        let s = array.joined(separator: ",")
        print(s)
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        view.backgroundColor = UIColor.yellow
        self.view.addSubview(view)
        
        UIView().createHlineView(.lineColor, superView: view)
        
        // Do any additional setup after loading the view, typically from a nib.
    }


}

