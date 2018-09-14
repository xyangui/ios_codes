//
//  ViewController.swift
//  MyMoya
//
//  Created by Jason on 14/9/18.
//  Copyright © 2018 Jason. All rights reserved.
//

import UIKit
import SwiftyJSON
import RxMoya
import RxSwift

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
        
        
        //rxswift
        HeroesProvider.rx.request(.oneHero(5))
            .mapJSON()
            .flatMap({ result in
                
                //let data = try? result.mapJSON()
                let json = JSON(result)
                
                var onehero = Hero(fromJson: json)
                var hero:Dictionary = json.dictionaryValue
                
                var t1:String? = hero["id"]?.rawString()
                
                
                var maphero = Hero(fromJson: "")
                maphero.id = 999
                maphero.age = 99
                maphero.comment = "commm99"
                maphero.name = "jason99"
                return HeroesProvider.rx.request(.oneHero(1))
            })
            .mapJSON()
            .map({ (hero) -> Hero in
                var maphero = Hero(fromJson: "")
                maphero.id = 999
                maphero.age = 99
                maphero.comment = "commm99"
                maphero.name = "jason99"
                return maphero
            })
            .subscribe { event in
                
                switch event {
                case .success(let response):
                    
                    //let data = try? response.mapJSON()
                    let json = JSON(response)
                    
                    var onehero = Hero(fromJson: json)
                    var hero:Dictionary = json.dictionaryValue
                    
                    var t1:String? = hero["id"]?.rawString()
                    var t2:String?  = hero["name"]?.rawString()
                    
                case .error(let error):
                    self.showAlert(title: "错误", message: "访问网络错误")
                }
        }
        
        
        
        
        
        
        //查询单个数据
        HeroesProvider.request(.oneHero(5)) { result in
            if case let .success(response) = result {
                
                let data = try? response.mapJSON()
                let json = JSON(data!)
                
                //实体类解析方法
                var onehero = Hero(fromJson: json)
                
                //字典解析方法
                var hero:Dictionary = json.dictionaryValue
                
                var t1:String? = hero["id"]?.rawString()
                var t2:String?  = hero["name"]?.rawString()
                var t3:String?  = hero["age"]?.rawString()
                var t4:String?  = hero["comment"]?.rawString()
                var t5:String?  = hero["name"]?.rawString()
            }
        }
        
        //查询所有数据
        HeroesProvider.request(.allHeroes) { result in
            if case let .success(response) = result {
                
                let data = try? response.mapJSON()
                let json = JSON(data!)
                
                //数组--实体类解析方法
                var allheroes = [Hero]()
                for var item in json.arrayValue {
                    var onehero = Hero(fromJson: item)
                    allheroes.append(onehero)
                }
                
                //数组--字典解析方法
                var heroes:Array<JSON> = json.arrayValue
                
                var t1:String? = heroes[0]["name"].rawString()
                var t2:String?  = heroes[1]["name"].rawString()
                var t3:String?  = heroes[2]["name"].rawString()
            }
        }
        
        //修改数据
        let puthero = Hero(fromJson: "")
        puthero.id = 73
        puthero.age = 88
        puthero.comment = "commm88"
        puthero.name = "jason88"
        
        HeroesProvider.request(.putHero(puthero)) { result in
            if case let .success(response) = result {
                
                let data = try? response.mapJSON()
                let json = JSON(data!)
                
                var result:Dictionary = json.dictionaryValue
                var isSuccess = result["result"]
                
                if result["result"]?.rawString() == "put_success" {
                    self.showAlert(title: "修改成功", message: "修改数据成功")
                } else {
                    self.showAlert(title: "修改失败", message: "数据库可能没有其id的数据")
                }
            }
        }
        
        //删除数据
        HeroesProvider.request(.deleteHero(116)) { result in
            if case let .success(response) = result {
                
                let data = try? response.mapJSON()
                let json = JSON(data!)
                
                var result:Dictionary = json.dictionaryValue
                var isSuccess = result["result"]?.rawString()
                
                if result["result"]?.rawString() == "delete_success" {
                    self.showAlert(title: "删除成功", message: "删除数据成功，其id为117")
                } else {
                    self.showAlert(title: "删除失败", message: "数据库可能没有其id为117的数据")
                }
            }
        }
        
        //添加数据
        //        var addhero = Hero(fromJson: "")
        //        addhero.age = 77
        //        addhero.comment = "commm77"
        //        addhero.name = "jason77"
        //
        //        HeroesProvider.request(.postHero(addhero)) { result in
        //            if case let .success(response) = result {
        //
        //                let data = try? response.mapJSON()
        //                let json = JSON(data!)
        //
        //                var result:Dictionary = json.dictionaryValue
        //
        //                var isSuccess = result["result"]?.rawString()
        //                var id = result["id"]?.rawString()
        //
        //                if result["result"]?.rawString() == "post_success" {
        //                    self.showAlert(title: "添加成功", message: "成功添加数据，其id为\(id!)")
        //                }
        //            }
        //        }
        
        
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

