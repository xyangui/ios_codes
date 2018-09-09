//
//  ViewController.swift
//  Delegate
//
//  Created by q on 2017/1/28.
//  Copyright © 2017年 xyg. All rights reserved.
//

import UIKit


class ViewController: UIViewController,MyDelegate { //1. 声明继承代理，必须实现代理的方法

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.view.backgroundColor = UIColor.red
    }

    //点击屏幕，执行方法
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let view2 = ViewController2()
        view2.delegate = self  //3. 声明某个代理变量，为自己
        self.present(view2, animated: true, completion: nil)
        
    }
    
    //2. 实现代理方法，供代理调用
    func didAcceptSomethiong(someoneName: String) {
        print(someoneName)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

