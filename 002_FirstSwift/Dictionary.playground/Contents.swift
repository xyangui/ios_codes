//: Playground - noun: a place where people can play

import UIKit

/////////////////////////////////////////////////////////////////////////////////
// Dictionary <----> NSDictionary 相互转换

let dict: [String:String] = ["key1":"value1", "key2":"value"]
// Dictionary ----> NSDictionary<AnyObject, AnyObject> 型
let nsDict1: NSDictionary = dict as NSDictionary
let nsDict2: NSDictionary = NSDictionary(dictionary: dict)

let nsMutDict3: NSMutableDictionary = NSMutableDictionary(dictionary: dict)
let nsMutDict4: NSMutableDictionary = NSMutableDictionary(dictionary: nsDict1)

// NSDictionary ----> Dictionary<AnyObject, AnyObject> 型
let swiftDictionary1: Dictionary = nsDict1 as Dictionary
// NSDictionary ----> Dictionary<String, String> 型
let swiftDictionary2: Dictionary = nsDict1 as! [String:String]

/////////////////////////////////////////////////////////////////////////////////
//一、定义
//1. Dictionary
let dic11    = [String:Int]()
let dic21    = Dictionary<String, Int>()
var strStr   = [String: String]()
strStr["16"] = "sixteen"
strStr = [:] //类型不变

let dict1                          = ["key1":1, "key2":2, "key3":3]
let dic31: Dictionary              = ["key1":1, "key2":2, "key3":3]
let dic51: [String: Int]           = ["key1":1, "key2":2, "key3":3]
let dic41: Dictionary<String, Int> = ["key1":1, "key2":2, "key3":3]

let dic61: [String:AnyObject] = ["key1":1 as AnyObject, "key2":2 as AnyObject, "key3":"value3" as AnyObject]

//2. NSDictionary
let nsDic31: NSDictionary = ["key1":"1", "key2":"2", "key3":"3"]
let nsDic41: NSDictionary = NSDictionary(dictionary: ["key1":1, "key2":2, "key3":3])

let nsMutDic1: NSMutableDictionary = ["key1":1, "key2":2, "key3":3, "key4":4]
let nsMutDic2: NSMutableDictionary = NSMutableDictionary(dictionary: ["key1":1, "key2":2, "key3":3, "key4":4])

// 从 文件 创建字符串
//let nsdic51:NSDictionary? = NSDictionary(contentsOfFile: NSHomeDirectory() + "/Desktop/test.txt")

// 从 Url 创建字符串
//let nsdic61:NSDictionary? = NSDictionary(contentsOfURL: NSURL(fileURLWithPath: NSHomeDirectory() +
//    "/Desktop/test.txt"))*/

//以下不常用
let nsdic71: NSDictionary = NSDictionary(object: "nsdic5", forKey: "key1" as NSCopying)
let nsdic81: NSDictionary = NSDictionary(objects: ["nsdic6", 2], forKeys: ["key1" as NSCopying, "key2" as NSCopying])
let nsdic91: NSDictionary = NSDictionary(dictionaryLiteral: ("key1", "nsdic7"),
                                         ("key2", 2),
                                         ("key3", 3),
                                         ("key4", 4))
/////////////////////////////////////////////////////////////////////////////////
//二、键值对数量
//1. Dictionary
var airports2 = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
if airports2.isEmpty {
    print("The airports dictionary is empty.")
} else {
    print("The airports dictionary is not empty.")
}
print("The dictionary of airports contains \(airports2.count) items.")

//2. NSDictionary
let medalRankings: NSDictionary = ["Gold": "1st Place", "Silver": "2nd Place", "Bronze": "3rd Place"]

print("key and value are \(medalRankings.count) items.")

/////////////////////////////////////////////////////////////////////////////////
//三、通过 key 找对应的 value
let value1 = medalRankings["Gold"]

let value2: AnyObject? = medalRankings["Gold"] as AnyObject?
let value3: AnyObject? = medalRankings.object(forKey: "Gold") as AnyObject?

// 获取字典中指定 key 对应的值，key 的值不存在时返回指定的字符串
let value4 = medalRankings.objects(forKeys: ["Gold", "key4", "key5"], notFoundMarker: "not found")
print("Airport name: \(value4)")

//查询
var airports3 = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
if let airportName = airports3["DUB"] {
    print("The name is \(airportName).")
} else {
    print("That airport is not in the airports dictionary.")
}

/////////////////////////////////////////////////////////////////////////////////
//四、通过 value 找对应的 key
let keys = medalRankings.allKeys(for: "2nd Place")

/////////////////////////////////////////////////////////////////////////////////
//五、所有 key ---> Array
//1. Dictionary
let dic5: Dictionary = ["key1":1, "key2":2, "key3":3, "key4":4]
let keys15 = Array(dic5.keys)
let keys25 = [String](dic5.keys)

//2. NSDictionary
let nsDic5: NSDictionary = dic5 as NSDictionary
let keys35 = nsDic5.allKeys

/////////////////////////////////////////////////////////////////////////////////
//六、所有 value ---> Array
//1. Dictionary
let dic6: Dictionary = ["key1":1, "key2":2, "key3":3, "key4":4]
let values16 = Array(dic6.values)
let values26 = [Int](dic6.values)

//2. NSDictionary
let nsDic6: NSDictionary = dic6 as NSDictionary
let values36 = nsDic6.allValues

/////////////////////////////////////////////////////////////////////////////////
//七、添加 与 修改
//1. Dictionary
var dic7: Dictionary = ["key1":1, "key2":2, "key3":3, "key4":4]
dic7["key5"]   = 5 //有“key5”，则修改；无，则添加

//2. NSMutableDictionary
let nsDic7: NSMutableDictionary = ["key1":1, "key2":2, "key3":3, "key4":4]
nsDic7["key4"] = 5 //有“key5”，则修改；无，则添加

// 添加
nsDic7.addEntries(from: ["key6":6, "key7":7]) // 向末尾添加一个字典

/////////////////////////////////////////////////////////////////////////////////
//八、修改
//1. Dictionary
var dic8: Dictionary = ["key1":1, "key2":2, "key3":3, "key4":4]
dic8.updateValue(44, forKey: "key4")

var airports7 = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
if let oldValue = airports7.updateValue("Airport", forKey: "DUB") { //返回旧值
    print("The old value for DUB was \(oldValue).")
}
print(airports7)

//2. NSMutableDictionary
let nsMutDic8: NSMutableDictionary = ["key1":1, "key2":2, "key3":3, "key4":4]
nsMutDic8.setObject(100, forKey: "key4" as NSCopying)
nsMutDic8.setDictionary(["key6":6, "key7":7]) // 修改整个字典

/////////////////////////////////////////////////////////////////////////////////
//九、删除
//1. Dictionary
var dic9: Dictionary = ["key1":1, "key2":2, "key3":3, "key4":4]
dic9.removeValue(forKey: "key2")
dic9["key1"] = nil
dic9.removeAll(keepingCapacity: true)

var airports9 = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
if let removedValue = airports9.removeValue(forKey: "DUB") { //返回已删除value
    print("The removed airport's name is \(removedValue).")
} else {
    print("The airports dictionary does not contain a value for DUB.")
}

//2. NSMutableDictionary
let nsDic9: NSMutableDictionary = ["key1":1, "key2":2, "key3":3, "key4":4]
nsDic9.removeObject(forKey: "key2")
nsDic9.removeObjects(forKeys: ["key1", "key4"])
nsDic9.removeAllObjects()

/////////////////////////////////////////////////////////////////////////////////
//十、遍历
//1. Dictionary
var airports = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
for (airportCode, airportName) in airports {
    print("\(airportCode): \(airportName)")
}
for airportCode in airports.keys {
    print("Airport code: \(airportCode)")
}
for airportName in airports.values {
    print("Airport name: \(airportName)")
}

//2. NSDictionary
let nsDic10: NSDictionary = ["key1":101, "key2":102, "key3":103, "key4":104]

// for...in 循环
for (key, obj) in nsDic10 {
    print(key)
    print(obj)
}
for (_, obj) in nsDic10 { // key 不需要可以用 _ 替代
    print(obj)
}

// key 迭代器遍历
let keyEnu: NSEnumerator = nsDic10.keyEnumerator()
while let key:AnyObject = keyEnu.nextObject() as AnyObject? {
    print(nsDic10.object(forKey: key)!)
}
// obj 迭代器遍历
let objEnu: NSEnumerator = nsDic10.objectEnumerator()
while let obj:AnyObject = objEnu.nextObject() as AnyObject? {
    print(obj)
}

/////////////////////////////////////////////////////////////////////////////////
//十一、排序 ——— NSDictionary
let nsDic111: NSDictionary = NSDictionary(dictionary: ["key1":"value11", "key2":"value21", "key3":"value31", "key4":"value41"])

// 用指定的方法排序
let keys2 = nsDic111.keysSortedByValue(using: #selector(NSNumber.compare(_:)))
for key in keys2 {
    print(nsDic111.object(forKey: key)!)
}


/////////////////////////////////////////////////////////////////////////////////
//数组：OC：
//@property NSDictionary *keyedObjects;
//@property NSDictionary<NSURL *, NSData *> *cachedData;
//- (NSDictionary<NSURL *, NSNumber *> *)fileSizesForURLsWithSuffix:(NSString *)suffix;
//- (void)setCacheExpirations:(NSDictionary<NSURL *, NSDate *> *)expirations;
//数组：swift:
//var keyedObjects: [AnyHashable: Any]
//var cachedData: [URL: Data]
//func fileSizesForURLsWithSuffix(suffix: String) -> [URL: NSNumber]
//func setCacheExpirations(expirations: [URL: NSDate])

//查找最大值
let interestingNumbers = [
    "Prime": [2, 3, 5, 7, 11, 13],
    "Fibonacci": [1, 1, 2, 3, 5, 8],
    "Square": [1, 4, 9, 16, 25],
]
var largest = 0
//for (kind, numbers) in interestingNumbers {//替换成下面
for (_ , numbers) in interestingNumbers {
    for number in numbers {
        if number > largest {
            largest = number
        }
    }
}
print(largest)