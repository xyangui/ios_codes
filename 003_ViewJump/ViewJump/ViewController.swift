//
//  ViewController.swift
//  ViewJump
//
//  Created by q on 2017/1/26.
//  Copyright © 2017年 xyg. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
         self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "下一个", style: UIBarButtonItemStyle.plain, target: self, action: Selector(("next")))
    }
    func next(sender: AnyObject) {
        print("跳转")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func toSecondView(_ sender: Any) {
        
        //实例化一个将要跳转的viewController
        let secondView = SecondViewController()
        //跳转
        self.navigationController?.pushViewController(secondView, animated: true)
    }

    @IBAction func presentToSecondView(_ sender: Any) {
       
        //实例化一个登陆界面
        let loginView = SecondViewController()
        //从下弹出一个界面作为登陆界面，completion作为闭包，可以写一些弹出loginView时的一些操作
        self.present(loginView, animated: true, completion: nil)
    }

    
}

