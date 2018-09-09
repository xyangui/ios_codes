//: Playground - noun: a place where people can play

import UIKit

class AboutFunc {
    
    //使用init来创建一个构造函数
    //使用deinit创建一个析构函数
    init() {
        
        _ = greet(person:"Bob", day: "Tuesday")//不使用返回值，前面加 _ =
        
        let str = greet1("John", on: "Wednesday")
        print(str)
        
        //函数：多个返回值
        let statistics = calculateStatistics(scores:[5, 3, 100, 3, 9])
        print(statistics.sum)
        print(statistics.max)
        print(statistics.0)//第一个返回值
        print(statistics.1)//第二个返回值
        print(statistics.2)//第三个返回值
        
        //函数可以带有可变个数的参数，这些参数在函数内表现为数组的形式：
        _ = sumOf()
        _ = sumOf(numbers: 42, 597, 12)
        
        //函数可以嵌套。被嵌套的函数可以访问外侧函数的变量，你可以使用嵌套函数来重构一个太长或者太复杂的函数。
        _ = returnFifteen()
        
        //函数是第一等类型，这意味着函数可以作为另一个函数的返回值。
        let increment = makeIncrementer()
        _ = increment(7)
        
        //函数也可以当做参数传入另一个函数。
        let numbers = [20, 19, 7, 12]
        _ = hasAnyMatches(list: numbers, condition: lessThanTen)
    }
    
    //函数
    func greet(person: String, day: String) -> String {
        return "Hello \(person), today is \(day)."
    }
    
    //使用 _ 表示不使用参数标签
    func greet1(_ person: String, on day: String) -> String {
        return "Hello \(person), today is \(day)."
    }
    
    //函数：多个返回值
    func calculateStatistics(scores: [Int]) -> (min: Int, max: Int, sum: Int) {
        var min = scores[0]
        var max = scores[0]
        var sum = 0
        
        for score in scores {
            if score > max {
                max = score
            } else if score < min {
                min = score
            }
            sum += score
        }
        
        return (min, max, sum)
    }
    
    //函数可以带有可变个数的参数，这些参数在函数内表现为数组的形式：
    func sumOf(numbers: Int...) -> Int {
        var sum = 0
        for number in numbers {
            sum += number
        }
        return sum
    }
    
    //函数可以嵌套。被嵌套的函数可以访问外侧函数的变量，你可以使用嵌套函数来重构一个太长或者太复杂的函数。
    func returnFifteen() -> Int {
        var y = 10
        func add() {
            y += 5
        }
        add()
        return y
    }
    
    //函数是第一等类型，这意味着函数可以作为另一个函数的返回值。
    func makeIncrementer() -> ((Int) -> Int) {
        func addOne(number: Int) -> Int {
            return 1 + number
        }
        return addOne
    }
    
    //函数也可以当做参数传入另一个函数。
    func hasAnyMatches(list: [Int], condition: (Int) -> Bool) -> Bool {
        for item in list {
            if condition(item) {
                return true
            }
        }
        return false
    }
    func lessThanTen(number: Int) -> Bool {
        return number < 10
    }
    
    func simpleDescription() -> String {
        return "A square with sides of length."
    }
}
//继承与覆盖
class Square: AboutFunc {
    override func simpleDescription() -> String {
        return "A square with sides of length."
    }
}

//新建类
let aboutfunc = AboutFunc()//自动调用 init()
print(aboutfunc)
