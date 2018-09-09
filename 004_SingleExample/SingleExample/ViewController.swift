//
//  ViewController.swift
//  SingleExample
//
//  Created by q on 2017/1/28.
//  Copyright © 2017年 xyg. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
         SingleExample.shareInstance().action()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

