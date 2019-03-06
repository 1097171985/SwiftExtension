//
//  UILabelExtension.swift
//  Extension
//
//  Created by WJF on 2019/3/5.
//  Copyright © 2019 wjf. All rights reserved.
//

import UIKit

extension ViewStyle where T: UILabel {
    
    /**  背景色是主体色  */
    static var backMainColor: ViewStyle<UILabel> {
        return ViewStyle<UILabel> {
            $0.backgroundColor = .red //这里有主体颜色的”宏“
        }
    }
    
    /**  背景色是主体色 字体白色 */
    static var backMainCAndTextW: ViewStyle<UILabel> {
        return ViewStyle<UILabel> {
            $0.backgroundColor = .red //这里有主体颜色的”宏“
            $0.textColor = .white
        }
    }
    
    /**  字体是主体色  */
    static var textMainColor: ViewStyle<UILabel> {
        return ViewStyle<UILabel> {
            $0.textColor = .red //这里有主体颜色的”宏“
        }
    }
    
    /**  字体是主体大小  */
    static var textMainFont: ViewStyle<UILabel> {
        return ViewStyle<UILabel> {
            $0.font = UIFont.systemFont(ofSize: 15) //这里有主体大小
        }
    }
    
    /**  字体是主体色,主体大小  */
    static var textMainFontColor: ViewStyle<UILabel> {
        return textMainColor.compose(with: textMainFont)
    }
    
    
}

extension UILabel{
    
   //这里 可以写 一些 创建 方法
    /**  最全参数  */
    func createNomarlLabel(text :String,textColor :UIColor,textAlignment:NSTextAlignment,font:UIFont,backgroundColor:UIColor){
        self.textColor = textColor
        self.textAlignment = textAlignment
        self.font = font
        self.backgroundColor = backgroundColor
        self.text = text

    }
    
    func createNomarlLabel(text :String,textColor :UIColor,textAlignment:NSTextAlignment,font:UIFont)  {
        
        self.textColor = textColor
        self.textAlignment = textAlignment
        self.font = font
        self.text = text
    }
    
    
}
