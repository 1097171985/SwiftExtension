//
//  UIViewExtension.swift
//  Extension
//
//  Created by WJF on 2019/3/5.
//  Copyright © 2019 wjf. All rights reserved.
//

import UIKit

extension ViewStyle where T: UIView {
    
    /**  背景色是主体色  */
    static var backMainColor: ViewStyle<UIView> {
        return ViewStyle<UIView> {
            $0.backgroundColor = .red //这里有主体颜色的”宏“
        }
    }
    
    /**  设置线的颜色  */
    static var lineColor: ViewStyle<UIView> {
        return ViewStyle<UIView> {
            $0.backgroundColor = .red //这里有line颜色的”宏“
          
        }
    }
    
}

extension UIView{
    
    //这里 可以写 一些 创建 方法
     /**  设置横线  */
    func createHlineView(_ style: ViewStyle<UIView>,superView :UIView)  {
        self.apply(style)
        self.frame = CGRect(x: 0, y: superView.frame.size.height - 1, width: superView.frame.size.width, height: 1)
        superView.addSubview(self)
    }
    
    /**  设置竖线  */
    func createVlineView(_ style: ViewStyle<UIView>,superView :UIView)  {
        self.apply(style)
        self.frame = CGRect(x: superView.frame.size.width - 1, y: 0, width: 1, height: superView.frame.size.height)
        superView.addSubview(self)
    }
    
}
