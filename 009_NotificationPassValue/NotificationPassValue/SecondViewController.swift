//
//  SecondViewController.swift
//  NotificationPassValue
//
//  Created by q on 2017/1/30.
//  Copyright © 2017年 xyg. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func passNotification(_ sender: Any) {
        
        //通知名称常量
        //let NotifyChatMsgRecv = NSNotification.Name(rawValue:"notifyChatMsgRecv")
        
        //发送通知
        NotificationCenter.default.post(name: NSNotification.Name(rawValue:"notifyChatMsgRecv"), object: "xygOK")//nil)//, userInfo: notification.userInfo)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
