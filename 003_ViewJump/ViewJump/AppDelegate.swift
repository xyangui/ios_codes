//
//  AppDelegate.swift
//  ViewJump
//
//  Created by q on 2017/1/26.
//  Copyright © 2017年 xyg. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    //var window: UIWindow!
    var rootViewController: UIViewController!
    var navigationController: UINavigationController!
    

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        
        //一、使用自定义的：FirstViewController，添加：navigationController
//        let VC = FirstViewController()
//        
//        let navigationC = UINavigationController(rootViewController: VC)
//        self.window?.rootViewController = navigationC
//        
//        self.window?.backgroundColor = UIColor.white
        
        
        //二、使用系统默认的：storyboard，添加：navigationController
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        
        // storyboard ---> UIViewController
        //1. 首先根据名字 Main 获得storyboard的引用
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        //2. 然后从storyboard根据Identifier实例化rootViewController，既然要根据Identifier，因此我们回到storyboard文件为其添加ID
        rootViewController = storyboard.instantiateViewController(withIdentifier: "MyViewController")
        //打开storyboard文件，点击界面空白处或点击上面三个图标的最左边，选择View Controller
        //打开Inspector，添加Storyboard ID：MyViewController
        
        
        navigationController = UINavigationController(rootViewController: rootViewController)
        
        window?.rootViewController = rootViewController
        window?.addSubview(navigationController.view)
        
        
        //还有另外一种方法添加 UINavigationController: IB创建UINavigationController
        //http://blog.csdn.net/kezhenxu/article/details/41973817
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

