//
//  ArrayExtension.swift
//  Extension
//
//  Created by WJF on 2019/3/5.
//  Copyright © 2019 wjf. All rights reserved.
//

import Foundation

extension Array{
    
    /**  字符串数组转字符串  */
    func toString(separator:String) -> String {
        let array :Array<String> = self as! Array<String>
        let string = array.joined(separator: separator)
        return string
    }
}
