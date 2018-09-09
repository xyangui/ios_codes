//
//  ViewController.swift
//  NotificationPassValue
//
//  Created by q on 2017/1/30.
//  Copyright © 2017年 xyg. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //通知名称常量
        let NotifyChatMsgRecv = NSNotification.Name(rawValue: "notifyChatMsgRecv")
        //注册通知
        NotificationCenter.default.addObserver(self, selector:#selector(didMsgRecv(notification:)), name: NotifyChatMsgRecv, object: nil)
    }
    
    //通知处理函数
    func didMsgRecv(notification: NSNotification){
        
        let str = notification.object as! String
        print(str)
        //print("didMsgRecv: \(notification.userInfo)")
    }
    
    @IBAction func toSecondView(_ sender: Any) {

        let secondView = SecondViewController()
        self.present(secondView, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

