//
//  FirstViewController.swift
//  ViewJump
//
//  Created by q on 2017/1/26.
//  Copyright © 2017年 xyg. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //导航栏： 设置标题
        self.title = "主页"
        //导航栏： 设置背景色
        self.navigationController?.navigationBar.barTintColor = UIColor.gray
        //导航栏： 设置图片
        //self.navigationController?.navigationBar.setBackgroundImage(UIImage(named: "testnavigationBar"), forBarMetrics: UIBarMetrics.Default)
        
        //导航栏: 透明
        self.navigationController?.navigationBar.isTranslucent = false//不透明，意味着子视图从导航栏下面开始（0，0），不覆盖子视图
        //self.navigationController?.navigationBar.isTranslucent = true//透明（默认），意味着子视图从导航栏左上角开始，覆盖子视图
        
        //导航栏：隐藏
        //self.navigationController?.isNavigationBarHidden = true
        
        
        //子视图： 添加View
        let view1 = UIView(frame: CGRect(x: 100, y: 5, width: 120, height: 120))
        view1.backgroundColor = UIColor.red
        self.view.addSubview(view1)
        
    
        //右侧按钮: 自定义文字
        let item = UIBarButtonItem(title: "分享", style: UIBarButtonItemStyle.plain, target: self, action: nil)
        self.navigationItem.rightBarButtonItem = item
        
        //右侧按钮: 使用系统图标
        //let item1 = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.done, target: self, action: nil)//此处使用的图标UIBarButtonSystemItem是一个枚举.大家可以尝试一下其他值出来是什么
        //self.navigationItem.rightBarButtonItem = item1
        
        //右侧按钮: 自定义button
        //let btn1 = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 30))
        //btn1.setTitle("完成", for: UIControlState.normal)
        //let item2 = UIBarButtonItem(customView: btn1)
        //self.navigationItem.rightBarButtonItem = item2
        
        //右侧按钮: 图片
        //let img = UIImage(named: "test_img")
        //let item3 = UIBarButtonItem(image: img, style: UIBarButtonItemStyle.plain, target: self, action: nil)
        //self.navigationItem.rightBarButtonItem = item3
        
        //右侧按钮: 添加多个
        //let items1 = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.pause, target: self, action: nil)
        //let items2 = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.action, target: self, action: nil)
        //self.navigationItem.rightBarButtonItems = [items1,items2]
        
        //左侧按钮: 直接调用 self.navgigationItem.leftBarButtonItem 即可
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
