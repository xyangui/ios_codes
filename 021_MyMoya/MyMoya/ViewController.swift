//
//  ViewController.swift
//  MyMoya
//
//  Created by Jason on 2018/9/9.
//  Copyright © 2018年 Jason. All rights reserved.
//

import UIKit
import SwiftyJSON

class ViewController: UIViewController {

    //频道列表数据
    var channels:Array<JSON> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //使用我们的provider进行网络请求（获取频道列表数据）
       /* DouBanProvider.request(.channels) { result in
            if case let .success(response) = result {
                //解析数据
                let data = try? response.mapJSON()
                let json = JSON(data!)
                self.channels = json["channels"].arrayValue
                
                //刷新表格数据
                //DispatchQueue.main.async{
                    //self.tableView.reloadData()
                //}
            }
        }
        
        //获取选中项信息
        let channelName = "八零"
        let channelId = "4"
        
        //使用我们的provider进行网络请求（根据频道ID获取下面的歌曲）
        DouBanProvider.request(.playlist(channelId)) { result in
            if case let .success(response) = result {
                //解析数据，获取歌曲信息
                let data = try? response.mapJSON()
                let json = JSON(data!)
                let music = json["song"].arrayValue[0]
                let artist = music["artist"].stringValue
                let title = music["title"].stringValue
                let message = "歌手：\(artist)\n歌曲：\(title)"
                
                //将歌曲信息弹出显示
                self.showAlert(title: channelName, message: message)
            }
        }
        */
    
        HeroesProvider.request(.allHeroes) { result in
            if case let .success(response) = result {
                //解析数据
                let data = try? response.mapJSON()
                let json = JSON(data!)
               
                var heroes:Array<JSON> = json.arrayValue
                
                var t1:String? = heroes[0]["name"].rawString()
                var t2:String?  = heroes[1]["name"].rawString()
                var t3:String?  = heroes[2]["name"].rawString()
                var t4:String?  = heroes[3]["name"].rawString()
                var t5 = heroes[4]["name"]
            }
        }
    }
    
    //显示消息
    func showAlert(title:String, message:String){
        let alertController = UIAlertController(title: title,
                                                message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "确定", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

