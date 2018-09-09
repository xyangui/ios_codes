//
//  ViewController2.swift
//  Delegate
//
//  Created by q on 2017/1/28.
//  Copyright © 2017年 xyg. All rights reserved.
//

import UIKit

//1. 定义代理：类型
protocol MyDelegate {
    
    func didAcceptSomethiong(someoneName: String)
}

class ViewController2: UIViewController {
    
    //2. 定义代理：变量
    var delegate: MyDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.blue
    }
    
    //点击屏幕，执行方法
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.dismiss(animated: false, completion: nil)
        //3. 调用代理变量——>方法
        delegate?.didAcceptSomethiong(someoneName: "Hello xyg1")
        
        print("Hello xyg2")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
