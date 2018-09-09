//
//  ViewController.swift
//  SandBox
//
//  Created by q on 2017/1/30.
//  Copyright © 2017年 xyg. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //*****************************************************************
        //沙盒路径：Documents
        let docPath = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)[0] as NSString
        print(docPath)
        //   /Users/q/Library/Developer/CoreSimulator/Devices/5F970BBD-4305-490A-8C67-CEF0825C072A/data/Containers/Data/Application/8290FD4E-1648-4197-A240-14BBF2539E87/Documents
        
//        // 上面代码代替下面代码，防止Documents文件夹不存在*****************************************************************
//        
//        // 获得沙盒的根路径
//        let home = NSHomeDirectory() as NSString;
//        // 获得Documents路径，使用NSString对象的stringByAppendingPathComponent()方法拼接路径
//        let docPath1 = home.appendingPathComponent("Documents") as NSString;
//        print(docPath1)
//        //   /Users/q/Library/Developer/CoreSimulator/Devices/5F970BBD-4305-490A-8C67-CEF0825C072A/data/Containers/Data/Application/8290FD4E-1648-4197-A240-14BBF2539E87/Documents
        
        //*****************************************************************
        //沙盒路径：Documentation（ Library 里面也没有 Documentation 呀？）
        let paths = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentationDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)
        print(paths)
        
        let documentsDirectory = paths.first
        print(documentsDirectory!)
        //   /Users/q/Library/Developer/CoreSimulator/Devices/5F970BBD-4305-490A-8C67-CEF0825C072A/data/Containers/Data/Application/BF689CA8-0E49-4D18-B841-4E7BC1847EF7/Library/Documentation
        let last = paths.last
        print(last!)
        //   /Users/q/Library/Developer/CoreSimulator/Devices/5F970BBD-4305-490A-8C67-CEF0825C072A/data/Containers/Data/Application/BF689CA8-0E49-4D18-B841-4E7BC1847EF7/Library/Documentation
        
        //*****************************************************************
        //沙盒路径：Caches
        let pathsc = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.cachesDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)
        let cachesF = pathsc.first
        print(cachesF!)
        //   /Users/q/Library/Developer/CoreSimulator/Devices/5F970BBD-4305-490A-8C67-CEF0825C072A/data/Containers/Data/Application/BF689CA8-0E49-4D18-B841-4E7BC1847EF7/Library/Caches
        let cachesL = pathsc.last
        print(cachesL!)
        //   /Users/q/Library/Developer/CoreSimulator/Devices/5F970BBD-4305-490A-8C67-CEF0825C072A/data/Containers/Data/Application/BF689CA8-0E49-4D18-B841-4E7BC1847EF7/Library/Caches
        
        //*****************************************************************
        //沙盒路径：tmp/
        print(NSTemporaryDirectory())
        //   /Users/q/Library/Developer/CoreSimulator/Devices/5F970BBD-4305-490A-8C67-CEF0825C072A/data/Containers/Data/Application/BF689CA8-0E49-4D18-B841-4E7BC1847EF7/tmp/
        
        
        //*****************************************************************
//        1、应用程序包：包含了所有的资源文件和可执行文件
//        
//        2、Documents：保存应用运行时生成的需要持久化的数据，iTunes同步设备时会备份该目录
//        
//        3、tmp：保存应用运行时所需要的临时数据，使用完毕后再将相应的文件从该目录删除。应用没有运行，系统也可能会清除该目录下的文件，iTunes不会同步备份该目录
//        
//        4、Library/Cache：保存应用运行时生成的需要持久化的数据，iTunes同步设备时不备份该目录。一般存放体积大、不需要备份的非重要数据
//        
//        5、Library/Preference：保存应用的所有偏好设置，IOS的Settings应用会在该目录中查找应用的设置信息。iTunes同步设备时会备份该目录
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

