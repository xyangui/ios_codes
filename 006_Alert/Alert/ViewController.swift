//
//  ViewController.swift
//  Alert
//
//  Created by q on 2017/1/29.
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
    
    @IBAction func alertController1(_ sender: Any) {
        
        let alert = UIAlertController(title: "AlertView", message: "I want to tell you something", preferredStyle: UIAlertControllerStyle.alert)
        
        let actionOK = UIAlertAction(title: "确定", style: UIAlertActionStyle.default, handler: { (UIAlertAction) -> Void in
            
            print("确定按钮点击事件")
        })
        let actionCancel = UIAlertAction(title: "取消", style: UIAlertActionStyle.cancel, handler: nil)//点击后，无响应函数
        
        alert.addAction(actionOK)
        alert.addAction(actionCancel)
        
        self.present(alert, animated: true, completion: nil)
    }

    @IBAction func alertController2(_ sender: Any) {
        
        let alert = UIAlertController(title: "通知", message: "确定还是取消", preferredStyle: UIAlertControllerStyle.alert)
        
        let actionOK = UIAlertAction(title: "确定", style: UIAlertActionStyle.default) { (UIAlertAction) -> Void in
            
            print("确定按钮点击事件")
        }
        let actionCancel = UIAlertAction(title: "取消", style: UIAlertActionStyle.default) { (UIAlertAction) -> Void in
            
            print("取消按钮点击事件")
        }
        let alertNext = UIAlertAction(title: "下次吧", style: UIAlertActionStyle.default) { (UIAlertAction) -> Void in
            
            print("下次吧按钮点击事件")
        }
        
        alert.addAction(actionOK)
        alert.addAction(actionCancel)
        //当添加的UIAlertAction超过两个的时候，会自动变成纵向分布
        alert.addAction(alertNext)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func alertController3(_ sender: Any) {
        
        let alert = UIAlertController(title: "AlertView", message: "I want to tell you something", preferredStyle: UIAlertControllerStyle.alert)
        
        let actionOK = UIAlertAction(title: "确定", style: UIAlertActionStyle.default, handler: { (UIAlertAction) -> Void in
            
            print("确定按钮点击事件")
        })
        let actionCancel = UIAlertAction(title: "取消", style: UIAlertActionStyle.cancel, handler: nil)//点击后，无响应函数
        
        //添加输入框 —— UITextField
        alert.addTextField(configurationHandler: { (UITextField) -> Void in
            UITextField.placeholder = "name"
            UITextField.clearButtonMode = UITextFieldViewMode.whileEditing
        })
        
//        //顺便补上监听传值的那一部分
//        //这是设置监听的那一部分，在textField的闭包中设置
//        alert.addTextField(configurationHandler: { (UITextField) -> Void in
//            UITextField.placeholder = "name"
//            UITextField.clearButtonMode = UITextFieldViewMode.whileEditing
//            
//            // 设置监听
//            _ = NotificationCenter.default.addObserver(self, selector: Selector(("textChange:")) , name: NSNotification.Name.UITextFieldTextDidChange, object: UITextField)
//        })
//        //监听方法
//        func textChange(notification: NSNotification) {
//            let textFied = notification.object as! UITextField
//            //textLabel.text = textFied.text
//            _ = textFied.text
//        }
        
        alert.addAction(actionOK)
        alert.addAction(actionCancel)
        
        self.present(alert, animated: true, completion: nil)
    }
    
//    //释放监听
//    deinit {
//        NotificationCenter.default.removeObserver(self)
//    }
    
    @IBAction func alertController4(_ sender: Any) {
        
        let alertSheet = UIAlertController(title: "alertSheet", message: "some message", preferredStyle: .actionSheet)
        
        let actionOK = UIAlertAction.init(title: "确定", style: .default, handler: { (UIAlertAction) -> Void in
            
            print("确定按钮点击事件")
        })
        let actionDestructive = UIAlertAction.init(title: "销毁", style: .destructive, handler: { (UIAlertAction) -> Void in
            
            print("销毁按钮点击事件")
        })
        let actionCancel = UIAlertAction.init(title: "取消", style: .cancel, handler: nil)
        
        alertSheet.addAction(actionOK)
        alertSheet.addAction(actionCancel)
        alertSheet.addAction(actionDestructive)
        
        self.present(alertSheet, animated: true, completion: nil)
    }
    
    @IBAction func alertController5(_ sender: Any) {
    }
}

