//
//  ViewController.swift
//  MyAlamofire
//
//  Created by Jason on 2018/9/9.
//  Copyright © 2018年 Jason. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let urlStr = "https://www.empirecclt.com.au/public/api/heroes"
        Alamofire.request(urlStr, method: .get).responseJSON { (returnResult) in
            
            if let json = returnResult.result.value {
                print("JSON: \(json)")
                let data = json as! NSArray
                print(data)
            }
            print("secondMethod --> GET 请求 --> returnResult = \(returnResult)")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

