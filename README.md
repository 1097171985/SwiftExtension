# SwiftExtension这里介绍一些常用的swift扩展，方便大家的使用，这里只介绍StringExtension.借鉴很多别人的东西，也希望大家不断的扩展



## 空格处理


>/*
*去掉首尾空格
*/
var removeHeadAndTailSpace:String {
        let whitespace = NSCharacterSet.whitespaces
       return self.trimmingCharacters(in: whitespace)
       }

>/*
*去掉首尾空格 包括后面的换行 \n
*/
var removeHeadAndTailSpacePro:String {
let whitespace = NSCharacterSet.whitespacesAndNewlines
return self.trimmingCharacters(in: whitespace)
}

>/*
*去掉所有空格
*/
var removeAllSapce: String {
return self.replacingOccurrences(of: " ", with: "", options: .literal, range: nil)
}

>/*
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

## 字符串常规操作

>/*
*字符串替换
*/
func replaceString(oldString : String,newString : String) -> String {
return self.replacingOccurrences(of: oldString, with: newString, options: .literal, range: nil)
}

>/**  是否包含一个字符串  */
func contains(find: String) -> Bool{
return self.range(of: find) != nil
}

>/**  判断  */
func containsIgnoringCase(find: String) -> Bool{
return self.range(of: find, options: .caseInsensitive) != nil
}

>/// 使用下标截取字符串 例: "示例字符串"[0..<2] 结果是 "示例"
subscript (r: Range<Int>) -> String {
get {
if (r.lowerBound > count) || (r.upperBound > count) { return "截取超出范围" }
let startIndex = self.index(self.startIndex, offsetBy: r.lowerBound)
let endIndex = self.index(self.startIndex, offsetBy: r.upperBound)
return String(self[startIndex..<endIndex])
}
}

>/// 截取第一个到第任意位置
///
/// - **Parameter** end: 结束的位值
/// - **Returns**: 截取后的字符串
func stringCut(end: Int) ->String{
if !(end < self.count) { return "截取超出范围" }
let sInde = index(startIndex, offsetBy: end)
return String(self[...sInde])
}

>/// 截取第任意位置到结束
///
/// - **Parameter** end:
/// - **Returns**: 截取后的字符串
func stringCutToEnd(start: Int) -> String {
if !(start < count) { return "截取超出范围" }
let sRang = index(startIndex, offsetBy: start)
return String(self[sRang...])
}

>/// 字符串任意位置插入
///
/// - **Parameters**:
/// - content: 插入内容
/// - locat: 插入的位置
/// - **Returns**: 添加后的字符串
func stringInsert(content: String,locat: Int) -> String {
if !(locat < count) { return "截取超出范围" }
let str1 = stringCut(end: locat)
let str2 = stringCutToEnd(start: locat+1)
return str1 + content + str2
}

## Range 和 NSRange 之间的转换

>/// range转换为NSRange
func nsRange(from range: Range<String.Index>) -> NSRange {
return NSRange(range, in: self)
}

>/// NSRange转化为range
func range(from nsRange: NSRange) -> Range<String.Index>? {
guard
let from16 = utf16.index(utf16.startIndex, offsetBy: nsRange.location, limitedBy: utf16.endIndex),
let to16 = utf16.index(from16, offsetBy: nsRange.length, limitedBy: utf16.endIndex),
let from = String.Index(from16, within: self),
let to = String.Index(to16, within: self)
else { return nil }
return from ..< to
}

## 字符串转成成其他类型

>/**  字符串转Int  */
func toInt() -> Int {
return  Int((self  as  NSString).intValue)
}

>/**  字符串转Float */
func toFloat() -> Float {
let scanner = Scanner(string: self)
var float: Float = 0
if scanner.scanFloat(&float) {
return float
}
return 0.0
}

>/**  字符串转Double  */
func toDouble() -> Double {
let scanner = Scanner(string: self)
var double: Double = 0
if scanner.scanDouble(&double) {
return double
}
return 0.00
}

>/**  字符串转Bool  */
func toBool() -> Bool {
if self == "true" || self == "false" || self == "yes" || self == "no" {
return (self as NSString).boolValue
}
return  false
}

>/**  字符串转成数组 separator 间隔符 */
func transToArray(separator:String) -> Array<String> {
let str = self.components(separatedBy: separator)
return str
}

>/// 日期字符串转化为Date类型
///
/// - **Parameters**:
/// - string: 日期字符串
/// - dateFormat: 格式化样式，默认为“yyyy-MM-dd HH:mm:ss”
/// - **Returns**: Date类型
static func stringConvertDate(string:String, dateFormat:String="yyyy-MM-dd HH:mm:ss") -> Date {
let dateFormatter = DateFormatter.init()
dateFormatter.dateFormat = dateFormat
let date = dateFormatter.date(from: string)
return date!
}


## 常用正则库
>/// 校验手机号
///
/// - **Parameter** mobileNum: 手机号
/// - **Returns**: ture false
class func isRegexMobileNum(mobileNum : String) -> Bool {
/// 正则规则字符串
let pattern = "^134[0-8]\\d{7}$|^13[^4]\\d{8}$|^14[5-9]\\d{8}$|^15[^4]\\d{8}$|^16[6]\\d{8}$|^17[0-8]\\d{8}$|^18[\\d]{9}$|^19[8,9]\\d{8}$"
return isBaseRegex(baseRegex: mobileNum, pattern: pattern)
}

>/// 校验身份证
///
/// - **Parameter** identityNum: 身份证
/// - **Returns**: ture false
class func isIdentity(identityNum :String) -> Bool {
if identityNum.count <= 14 {
return false
}
let pattern = "^(\\d{14}|\\d{17})(\\d|[xX])$"
return isBaseRegex(baseRegex: identityNum, pattern: pattern)
}

>/// 校验数字
///
/// - **Parameter** number: 数字
/// - **Returns**: ture false
class func isNoPointNumber(number :String) -> Bool {
let pattern = "^[0-9]*$"
return isBaseRegex(baseRegex: number, pattern: pattern)
}

>/// 校验是否为数字和小数
///
/// - **Parameter** number: 数字和小数
/// - **Returns**: ture false
class func isNumber(number :String) -> Bool {
let pattern = "^[0-9.]*$"
return isBaseRegex(baseRegex: number, pattern: pattern)
}

>/// 校验最多俩位小数
///
/// - **Parameter** number: 数字
/// - **Returns**: ture false
class func isTwoPointNumber(number :String) -> Bool {
let pattern = ""  //"^(([1-9]+)|([0-9]+\.[0-9]{1,2}))$"
return isBaseRegex(baseRegex: number, pattern: pattern)
}

>/// 校验用户名（6-16位数字和字母或_-符号*）
///
/// - **Parameter** userName: 用户名
/// - **Returns**: ture false
class func isUserName(userName :String) -> Bool {
let pattern = "^[A-Za-z0-9-_/]{6,16}+$"
return isBaseRegex(baseRegex: userName, pattern: pattern)
}

>/// 校验中文名
///
/// - **Parameter** userName: 中文名
/// - **Returns**: ture false
class func isChineseName(userName :String) -> Bool {
let pattern = ""  //"^[\u4e00-\u9fa5]{2,4}$"
return isBaseRegex(baseRegex: userName, pattern: pattern)
}

>/// 校验密码（6-20位数字和字母组合）
///
/// - **Parameter** password: 密码
/// - **Returns**: ture false
class func isPasswordSix_Twenty(password :String) -> Bool {
let pattern = "^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,20}+$"
return isBaseRegex(baseRegex: password, pattern: pattern)
}

>/// 校验密码（6-30位数字或字母或特殊字符组合）
///
/// - **Parameter** password: 密码
/// - **Returns**: ture false
class func isPasswordSix_Thirty(password :String) -> Bool {
let pattern = "^[A-Za-z0-9@&+-_/=]{6,30}+$"
return isBaseRegex(baseRegex: password, pattern: pattern)
}

>/// 通用的正则（baseRegex ： 目标，pattern ：正则条件）
class  func isBaseRegex(baseRegex : String,pattern : String) -> Bool {
/// 正则规则
let regex = try? NSRegularExpression(pattern: pattern, options: [])
/// 进行正则匹配
if let results = regex?.matches(in: baseRegex, options: [], range: NSRange(location: 0, length: baseRegex.count)), results.count != 0 {
print("匹配成功")
for result in results{
let string = (baseRegex as NSString).substring(with: result.range)
print("对应帐号:",string)
}
return true
}
return  false
}
