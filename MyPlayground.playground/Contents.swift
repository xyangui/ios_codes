//: Playground - noun: a place where people can play

import UIKit

//let possibleString: String?//可以为空
//let possibleString: String!//不为空

//let和var
let strV: String
strV = "Hello, name" //let必须被初始化
//strValue = nil     //let不能重复赋值，只能一次赋值
print(strV)

var strV2: String?
//strV2 = "Hello, name"//var可以不初始化
if (strV2 != nil) {
    strV2 = "Hello, name"
    strV2 = nil
}
////////////////////////////////////////////////////////////////////////////////

//可选类型
let possibleString: String? = "An optional string."//声明了一个Optional类型值，它可能包含一个String值，也可能什么都不包含”，也就是说实际上我们声明的是Optional类型，而不是声明了一个String类型，这一点需要铭记在心。

var strValue: String?//一旦声明为Optional的，如果不显式的赋值就会有个默认值nil。判断一个Optional的值是否有值，可以用if来判断：
strValue = "Hello, name"
if (strValue != nil) {
    var str: String = strValue!//使用Optional类型的时候，必须要加上！，这里的!表示“我确定这里的的strValue一定是非nil的，尽情调用吧”
    print(str)
    str = ""
    //str = nil //编译不通过，str是String，不是Optional，不能为nil，只能为“”
}
strValue = nil
//let str: String = strValue!//运行错误


//可选类型
let optionalString: String? = "Hello"
print(optionalString == nil)//false

let optionalName: String? = "John Appleseed"
var greeting = "Hello!"

if let name = optionalName { //optionalName为空时，不执行{}内的语句。
    //这种用法只使用于Optional type
    
    greeting = "Hello, \(name)"
    //greeting	String	"Hello, John Appleseed"
    
    greeting = "Hello, \(optionalName)"//不加 ！，取值不对
    //greeting	String	"Hello, Optional(\"John Appleseed\")"
    
    greeting = "Hello, \(optionalName!)"
    //greeting	String	"Hello, John Appleseed"
}
print(greeting)

// ! 不为空
var assumedString: String! = "An implicitly unwrapped optional string."// ！表示你定义的参数是不为null的
let implicitString: String = assumedString  // 不需要感叹号
print(implicitString)

assumedString = nil
//let implicitString2: String = assumedString //编译通过，但是运行时出错。
