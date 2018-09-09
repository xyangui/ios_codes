//: Playground - noun: a place where people can play

import UIKit

//1、NSArray和NSMutableArray是foundation框架里的。
//2、swift中的Array和[]是一个东西，这个是语言的东西了。

/////////////////////////////////////////////////////////////////////////////////
//Array:

//定义：三种定义方法
let stringArray0: [String]      = ["10", "20","30","40"]
var stringArray1: Array<String> = ["10", "20","30","40"]
let stringArray2                = ["10", "20","30","40"]

//空数组
var emptyArr = [String]()
var someInts = [Int]()

//增加：元素
someInts.append(3)
someInts.append(5)
someInts += [6]
someInts += [7,8]
someInts.insert(4, at: 1)
someInts[1...4] = [1,2]//4，5，6，7替换成：1，2
print(someInts)
someInts = [] // someInts 现在是空数组，但是仍然是 [Int] 类型的。
emptyArr += ["water"]
emptyArr += ["","catfish"]

//修改：元素
var shoppingList0: [String] = ["catfish", "water", "tulips", "blue paint"]
var shoppingList            = ["catfish", "water", "tulips", "blue paint"]
shoppingList[1] = "bottle of water"
print(shoppingList)//["catfish", "bottle of water", "tulips", "blue paint"]

//删除：元素
let item = shoppingList.remove(at: 1) //有返回值
print(shoppingList)
//shoppingList.removeFirst(2)//删除最前2个元素
//shoppingList.removeLast(2) //删除最后2个元素
//shoppingList.removeFirst()
//shoppingList.removeLast()
//shoppingList.removeAll()

//数量：元素数量
if shoppingList.isEmpty {
    print("The shopping list is empty.")
} else {
    print("The shopping list is not empty.")
}
print("\(shoppingList.count) items.")


//初始化数组为：相同的元素
let fiveZs = Array(repeating: "Z", count: 5)
let board : [Int]
board = [Int](repeating: 0, count: 4)
//两种方法定义
let threeDoubles = Array(repeating: 2.5, count: 3) //[Double]类型
let ThreeDoubles = [Double](repeating: 2.0, count: 3)


//合并数组
var sixDoubles = threeDoubles + ThreeDoubles


//Array：遍历数组
shoppingList = ["catfish", "water", "tulips", "blue paint"]
for item in shoppingList{
    print(item)
}
//Array：遍历数组，同时需要index, value
for (index, value) in shoppingList.enumerated() {
    print("Item \(String(index + 1)): \(value)")
}


/////////////////////////////////////////////////////////////////////////////////
//NSArray

//定义
let array: NSArray = ["Hello", "world", 5] //可以不同类型

//数量：元素数量
print("\(array.count) items.")

//是否包含某元素
let isContains = array.contains("world")

//遍历数组
var stringNSArray: NSArray = ["10","20","30","40","50","60"]
for item in stringNSArray{
    print(item)
}
//遍历数组，同时需要index, value
for (index, value) in stringNSArray.enumerated() {
    print("Item \(String(index + 1)): \(value)")
}

//合并
let addArray = array.addingObjects(from: stringNSArray as! [Any])
print(addArray)

//Array <----> NSArray 相互转换
stringArray1  = stringNSArray as! [String]
stringNSArray = stringArray0 as NSArray


/////////////////////////////////////////////////////////////////////////////////
//NSMutableArray：

//定义
var mutableArray: NSMutableArray
mutableArray = [10,"20","40"]

//增加：元素
mutableArray.add("50")
mutableArray.insert("30", at: 2)

//修改：元素
mutableArray[1] = "80"
print(mutableArray)   //[10, "80", "30", "40", "50"]

//删除：元素
mutableArray.removeObject(at: 1)
mutableArray.removeLastObject()

mutableArray.remove("30")
mutableArray.removeAllObjects()

//数量：元素数量
print("\(mutableArray.count) items.")


//遍历数组
mutableArray = ["10","20","30","40","50","60"]
for item in mutableArray{
    print(item)
}
//遍历数组，同时需要index, value
for (index, value) in mutableArray.enumerated() {
    print("Item \(String(index + 1)): \(value)")
}


/////////////////////////////////////////////////////////////////////////////////
//从文件到数组

////读取文件
//let path = Bundle.main.path(forResource: "Contacts", ofType: "plist")
//let resultDictionary = NSMutableArray(contentsOfFile: path!)
//
//resultDictionary?.add("addObject")
////写入文件
//resultDictionary?.write(toFile: path!, atomically: true)


/////////////////////////////////////////////////////////////////////////////////

//数组：OC：
//@property NSArray *objects;
//@property NSArray<NSDate *> *dates;
//- (NSArray<NSDate *> *)datesBeforeDate:(NSDate *)date;
//- (void)addDatesParsedFromTimestamps:(NSArray<NSString *> *)timestamps;
//数组：swift:
//var objects: [Any]
//var dates: [Date]
//func datesBeforeDate(date: Date) -> [Date]
//func addDatesParsedFromTimestamps(timestamps: [String])
