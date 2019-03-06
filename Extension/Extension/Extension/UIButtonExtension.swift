//
//  UIButtonExtension.swift
//  Extension
//
//  Created by WJF on 2019/3/5.
//  Copyright © 2019 wjf. All rights reserved.
//

import UIKit

extension ViewStyle where T: UIButton {
    
    /**  背景色是主体色  */
    static var backMainColor: ViewStyle<UIButton> {
        return ViewStyle<UIButton> {
            $0.backgroundColor = .red //这里有主体颜色的”宏“
        }
    }
    
    /**  背景色是主体色 字体白色 */
    static var backMainCAndTextW: ViewStyle<UIButton> {
        return ViewStyle<UIButton> {
            $0.backgroundColor = .red //这里有主体颜色的”宏“
            $0.setTitleColor(.white, for: .normal)
        }
    }
    
    /**  字体是主体颜色  */
    static var textMainColor: ViewStyle<UIButton> {
        return ViewStyle<UIButton> {
            $0.setTitleColor(.red, for: .normal)//这里有主体颜色的”宏“
        }
    }
    
    /**  主体字体大小  */
    static var textMainFont: ViewStyle<UIButton> {
        return ViewStyle<UIButton> {
            $0.titleLabel?.font = UIFont.systemFont(ofSize: 15) ////这里有字体大小的”宏“
        }
    }
    
    /**  背景色是主体色  主体字体大小 主要写这俩个其他的类推 */
    static var backAndfontMain: ViewStyle<UIButton> {
        return backMainColor.compose(with: textMainFont)
    }
    
    /**  背景色是主体色  主体字体大小 */
    static var titleAndfontMain: ViewStyle<UIButton> {
        return textMainColor.compose(with: textMainFont)
    }
    
    
}

extension UIButton{
    
    //这里 可以写 一些 创建 方法
    
    
    
}
