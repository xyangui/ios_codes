//: Playground - noun: a place where people can play

import UIKit

//字符串：Int -> String
let label = "The width is"
let width = 94
var widthLabel = label + String(width)
widthLabel = label + "\(width)"
print(widthLabel)

//字符串：String -> Int
let string = "1234"
var n:Int = 0
if let number = Int(string){
    n = number
    print(n)
}

//字符串：在 String 中添加 Int
let apples = 3
let oranges = 5
let appleSummary = "I have \(apples) apples."
let fruitSummary = "I have \(apples + oranges) pieces of fruit."
print(appleSummary)
print(fruitSummary)
//字符串：在 String 中添加 String
let appleSummary2 = "I have \(widthLabel) apples."
print(appleSummary2)

//字符串：是否包含指定字符串
let plans = "Let's meet at the caf"
let composedCafe = "caf"

if plans.hasSuffix(composedCafe) {//hasSuffix：后缀 hasPrefix：前缀，二者大小写敏感
    print(plans.hasSuffix(composedCafe))// "true" composedCafe = "caf"
}else{
    print(plans.hasSuffix(composedCafe))// "false" composedCafe = "meet"
}

//String <----> NSString 相互转换
let string1: String = "abc"
let bridgedString: NSString = string1 as NSString

let stringLiteral: NSString = "123"
if let integerValue = Int(stringLiteral as String) {
    print("\(stringLiteral) is the integer \(integerValue)")
}