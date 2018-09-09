//
//  SingleExample.swift
//  SingleExample
//
//  Created by q on 2017/1/28.
//  Copyright © 2017年 xyg. All rights reserved.
//

import UIKit

class SingleExample: NSObject {
    
    //单例
    static let instance = SingleExample()
    static func shareInstance() -> SingleExample{
        return instance
    }
    
    func action() {
    
        print("print xyg")
    }

}
