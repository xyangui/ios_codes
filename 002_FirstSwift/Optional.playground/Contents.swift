//: Playground - noun: a place where people can play

import UIKit


//let str: String?//   optionals，可以为空
//let str: String!//隐式optionals，不为空

////////////////////////////////////////////////////////////////////////////////
//一、optionals类型
//optionals类型：可能包含一个值，也可能为 nil
var str1: String?           // str1 有个默认值为 nil，（var可以不初始化）
str1 = "Hello, name"

var result1 = str1! + "world"//使用str1，要加入！，但要保证 str1 一定不为 nil

//判断一
if let isNil = str1 {
    
    print("str is \(isNil)");
}else{
    
    print("str is nil");
}
//判断二
if (str1 != nil) {
    print(str1!)
    print(str1 as Any)
    print(str1 ?? "Hello") //有值打印该值，无值打印"Hello"
    str1 = nil
}
//当声明一个变量不想给初始值的时候，就可以声明一个optional类型，例如：
// var delegate : XXXDelegate?
// self.delegate?.btnsAction(btn) //调用时，加上“？”

str1 = ""//可以为空串

////////////////////////////////////////////////////////////////////////////////
//二、隐式optionals类型
var str2:String! = "hello"   //肯定不为空

var result2 = str2 + "world" //不用加 ！
//当变量不可能为空的时候，就可以用隐式optionals，就是在变量后面跟”！“。例如：
// var delegate : XXXDelegate！
// self.delegate.btnsAction(btn) //调用时，什么都不用加

str2 = ""//可以为空串

////////////////////////////////////////////////////////////////////////////////
//三、不用！和？
let str3: String
str3 = "Hello, name" //（let必须被初始化）
//str3 = "Hello"     //（let不能重复赋值，只能一次赋值）
print(str3)

var str4: String = ""//可以为空串
//str4 = nil // 不可以，因为不是optionals类型

//if let isNil = str4 { //不能这样用，这种用法只使用于Optional type
//
//    print("str is not null");
//}else{
//    print("str is null");
//}


////////////////////////////////////////////////////////////////////////////////

let possibleNumber = "123"
let convertedNumber = Int(possibleNumber) // convertedNumber 被推测为类型 "Int?"
print(convertedNumber!)
let possibleNumber1 = "hello"
let convertedNumber1 = Int(possibleNumber1)

////////////////////////////////////////////////////////////////////////////////

//可选类型
let optionalString: String? = "Hello"
print(optionalString == nil)//false

let optionalName: String? = "John"
var greeting = ""

if let name = optionalName {  //optionalName为空时，不执行{}内的语句。
    //这种用法只使用于Optional type
    
    greeting = "Hello, \(name)"
    
    greeting = "Hello, \(optionalName)"//不加 ！，取值不对
    
    greeting = "Hello, \(optionalName!)"
}
print(greeting)

