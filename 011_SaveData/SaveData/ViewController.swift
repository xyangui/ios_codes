//
//  ViewController.swift
//  SaveData
//
//  Created by q on 2017/1/30.
//  Copyright © 2017年 xyg. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func saveToPlist(_ sender: Any) {
        // 1、获得沙盒的根路径
        let home = NSHomeDirectory() as NSString
        // 2、获得Documents路径，使用NSString对象的stringByAppendingPathComponent()方法拼接路径
        let docPath = home.appendingPathComponent("Documents") as NSString
        // 3、获取文本文件路径
        let filePath = docPath.appendingPathComponent("data.plist")
        let dataSource = NSMutableArray()
        dataSource.add("衣带渐宽终不悔")
        dataSource.add("为伊消得人憔悴")
        dataSource.add("故国不堪回首明月中")
        dataSource.add("xyg")
        dataSource.add("暮然回首，那人却在灯火阑珊处")
        // 4、将数据写入文件中
        dataSource.write(toFile: filePath, atomically: true)
        
        print(docPath)
    }

    @IBAction func readFromPlist(_ sender: Any) {
        /// 1、获得沙盒的根路径
        let home = NSHomeDirectory() as NSString
        /// 2、获得Documents路径，使用NSString对象的stringByAppendingPathComponent()方法拼接路径
        let docPath = home.appendingPathComponent("Documents") as NSString
        /// 3、获取文本文件路径
        let filePath = docPath.appendingPathComponent("data.plist")
        let dataSource = NSArray(contentsOfFile: filePath)
        print(dataSource! as NSArray)//打印的是16进制
    }
    
    @IBAction func saveToNSUserDefaults(_ sender: Any) {
        // 1、利用NSUserDefaults存储数据
        let defaults = UserDefaults.standard
        // 2、存储数据
        defaults.set("衣带渐宽终不悔", forKey: "name")
        // 3、同步数据
        defaults.synchronize()
    }
    
    @IBAction func readFromNSUserDefaults(_ sender: Any) {
        let defaults = UserDefaults.standard;
        let name = defaults.string(forKey: "name")
        let switch1 = defaults.bool(forKey: "bool")
        print(name!)
        print(switch1)
    }
    
    
    @IBAction func getContacts(_ sender: Any) {
        
        //在工程中添加Contacts.plist文件，在这里直接把文件的内容读出来
        
        //获取文件路径
        let path = Bundle.main.path(forResource: "Contacts", ofType: "plist")
        //获取文件内容(字典)
        let resultDictionary = NSMutableDictionary(contentsOfFile: path!)
        //获取分组名
        let keyArray = resultDictionary!.allKeys as! [String]
        
        print(resultDictionary!)
        print(keyArray)
    }
    
    @IBAction func addContact(_ sender: Any) {
        
        let dic:  NSMutableDictionary = [
            "name": "xyg",
            "image": "xyg.jpg",
            "phoneArray": "13804013683", //这里应该是数组，没有改
            "Email": "xyangui@163.com",
            "group": "家人"]
        
        //获取文件路径
        let path = Bundle.main.path(forResource: "Contacts", ofType: "plist")
        //获取文件内容(字典)
        let resultDictionary = NSMutableDictionary(contentsOfFile: path!)
        
        //在 I 的数组内增加contact
        var arr = resultDictionary?["I"] as! [NSMutableDictionary]
        print(arr)
        
        arr.append(dic)
        print(arr)
        
        //把 I 数组 写入大字典，再保存
        resultDictionary?.setObject(arr, forKey: "I" as NSCopying)
        
        resultDictionary?.write(toFile: path!, atomically: true)
    }
    
    
    @IBAction func deleteContact(_ sender: Any) {
        
        //获取文件路径
        let path = Bundle.main.path(forResource: "Contacts", ofType: "plist")
        //获取文件内容(字典)
        let resultDictionary = NSMutableDictionary(contentsOfFile: path!)
        
        //在 I 的数组内删除contact
        var arr = resultDictionary?["I"] as! [NSMutableDictionary]
        
        arr.remove(at: 2)
        
        //把 I 数组 写入大字典，再保存
        resultDictionary?.setObject(arr, forKey: "I" as NSCopying)
        
        resultDictionary?.write(toFile: path!, atomically: true)

    }
}

