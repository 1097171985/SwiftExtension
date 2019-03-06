//
//  StringExtension.swift
//  Extension
//
//  Created by WJF on 2019/3/5.
//  Copyright © 2019 wjf. All rights reserved.
//

import Foundation

//MARK: 空格处理
extension String{
   /*
    *去掉首尾空格
    */
    var removeHeadAndTailSpace:String {
        let whitespace = NSCharacterSet.whitespaces
        return self.trimmingCharacters(in: whitespace)
    }
    /*
     *去掉首尾空格 包括后面的换行 \n
     */
    var removeHeadAndTailSpacePro:String {
        let whitespace = NSCharacterSet.whitespacesAndNewlines
        return self.trimmingCharacters(in: whitespace)
    }
    /*
     *去掉所有空格
     */
    var removeAllSapce: String {
        return self.replacingOccurrences(of: " ", with: "", options: .literal, range: nil)
    }
    /*
     *去掉首尾空格 后 指定开头空格数
     */
    func beginSpaceNum(num: Int) -> String {
        var beginSpace = ""
        for _ in 0..<num {
            beginSpace += " "
        }
        return beginSpace + self.removeHeadAndTailSpacePro
    }
    
}

//MARK: 字符串常规操作
extension String {
    
    /*
     *字符串替换
     */
    func replaceString(oldString : String,newString : String) -> String {
        return self.replacingOccurrences(of: oldString, with: newString, options: .literal, range: nil)
    }
    
    /**  是否包含一个字符串  */
    func contains(find: String) -> Bool{
        return self.range(of: find) != nil
    }
    
    /**  判断  */
    func containsIgnoringCase(find: String) -> Bool{
        return self.range(of: find, options: .caseInsensitive) != nil
    }
    
    /// 使用下标截取字符串 例: "示例字符串"[0..<2] 结果是 "示例"
    subscript (r: Range<Int>) -> String {
        get {
            if (r.lowerBound > count) || (r.upperBound > count) { return "截取超出范围" }
            let startIndex = self.index(self.startIndex, offsetBy: r.lowerBound)
            let endIndex = self.index(self.startIndex, offsetBy: r.upperBound)
            return String(self[startIndex..<endIndex])
        }
    }
    
    /// 截取第一个到第任意位置
    ///
    /// - Parameter end: 结束的位值
    /// - Returns: 截取后的字符串
    func stringCut(end: Int) ->String{
        
        if !(end < self.count) { return "截取超出范围" }
        let sInde = index(startIndex, offsetBy: end)
        return String(self[...sInde])
    }
    
    
    /// 截取第任意位置到结束
    ///
    /// - Parameter end:
    /// - Returns: 截取后的字符串
    func stringCutToEnd(start: Int) -> String {
        if !(start < count) { return "截取超出范围" }
        let sRang = index(startIndex, offsetBy: start)
        //return substring(with: sRang)
        return String(self[sRang...])
    }
    
    /// 字符串任意位置插入
    ///
    /// - Parameters:
    ///   - content: 插入内容
    ///   - locat: 插入的位置
    /// - Returns: 添加后的字符串
    func stringInsert(content: String,locat: Int) -> String {
        if !(locat < count) { return "截取超出范围" }
        let str1 = stringCut(end: locat)
        let str2 = stringCutToEnd(start: locat+1)
        return str1 + content + str2
    }
    
}

//MARK:Range 和 NSRange 之间的转换
extension String{
    
    /// range转换为NSRange
    func nsRange(from range: Range<String.Index>) -> NSRange {
        return NSRange(range, in: self)
    }
    
    /// NSRange转化为range
    func range(from nsRange: NSRange) -> Range<String.Index>? {
        guard
            let from16 = utf16.index(utf16.startIndex, offsetBy: nsRange.location, limitedBy: utf16.endIndex),
            let to16 = utf16.index(from16, offsetBy: nsRange.length, limitedBy: utf16.endIndex),
            let from = String.Index(from16, within: self),
            let to = String.Index(to16, within: self)
            else { return nil }
        return from ..< to
    }
}

//MARK : 字符串转成成其他类型,
extension String {
    
    /**  字符串转Int  */
    func toInt() -> Int {
        return Int((self as NSString).intValue)
    }
    
    /**  字符串转Float */
    func toFloat() -> Float {
        let scanner = Scanner(string: self)
        var float: Float = 0
        if scanner.scanFloat(&float) {
            return float
        }
        return 0.0
    }
    
    /**  字符串转Double  */
    func toDouble() -> Double {
        let scanner = Scanner(string: self)
        var double: Double = 0
        if scanner.scanDouble(&double) {
            return double
        }
        return 0.00
    }
    
    /**  字符串转Bool  */
    func toBool() -> Bool {
        
        if self == "true" || self == "false" || self == "yes" || self == "no" {
            return (self as NSString).boolValue
        }
        return false
    }
    
    /**  字符串转成数组 separator 间隔符 */
    func transToArray(separator:String) -> Array<String> {
        
        let str = self.components(separatedBy: separator)
        return str
    }
    
    /// 日期字符串转化为Date类型
    ///
    /// - Parameters:
    ///   - string: 日期字符串
    ///   - dateFormat: 格式化样式，默认为“yyyy-MM-dd HH:mm:ss”
    /// - Returns: Date类型
    static func stringConvertDate(string:String, dateFormat:String="yyyy-MM-dd HH:mm:ss") -> Date {
        let dateFormatter = DateFormatter.init()
        dateFormatter.dateFormat = dateFormat
        let date = dateFormatter.date(from: string)
        return date!
    }
    

   
}
