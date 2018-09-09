//
//  SecondViewController.swift
//  ViewJump
//
//  Created by q on 2017/1/26.
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
    

    @IBAction func toFirstView(_ sender: Any) {
        
        //前提：确保当前ViewController是通过NavigationController的PushView方法跳转来的
        //方式一：跳转到前一个页面
        _ = self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func toFirstView2(_ sender: Any) {
        
        //crash, why?
        //实例化一个ViewController
        //let firstView = ViewController()
        //方式二：返回至指定的ViewController
        //_ = self.navigationController?.popToViewController(firstView, animated: true)
    }
    

    @IBAction func toFirstView3(_ sender: Any) {
        
        //方式三：返回至最初的ViewController
        //解释：通过pushView跳转firsView->secondView->thirdView，当在thirdView执行下面语句，则调回firtView
        _ = self.navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func dismissViewController(_ sender: Any) {
        //前提：通过 View的presentViewController跳转的页面才能执行，否则找不到上一页
        //同样可以执行关闭此页时的闭包操作
        self.dismiss(animated: true, completion: nil)
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
