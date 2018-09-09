//
//  HeroesAPI.swift
//  MyMoya
//
//  Created by Jason on 2018/9/9.
//  Copyright © 2018年 Jason. All rights reserved.
//

import Foundation
import Moya

let HeroesProvider = MoyaProvider<Heroes>()

public enum Heroes {
    case allHeroes
    case oneHero(String)
}

extension Heroes: TargetType {
    //服务器地址
    public var baseURL: URL {
        switch self {
        default:
            return URL(string: "https://www.empirecclt.com.au/public/api/heroes")!
        }
    }
    
    
    //各个请求的具体路径
    public var path: String {
        switch self {
        case .allHeroes:
            return "/"
        case .oneHero(_):
            return "/"
        }
    }
    
    //请求类型
    public var method: Moya.Method {
        return .get
    }
    
    //请求任务事件（这里附带上参数）
    public var task: Task {
        switch self {
        case .oneHero(let channel):
            var params: [String: Any] = [:]
            params["channel"] = channel
            params["type"] = "n"
            params["from"] = "mainsite"
            return .requestParameters(parameters: params,
                                      encoding: URLEncoding.default)
        default:
            return .requestPlain
        }
    }
    
    //是否执行Alamofire验证
    public var validate: Bool {
        return false
    }
    
    //这个就是做单元测试模拟的数据，只会在单元测试文件中有作用
    public var sampleData: Data {
        return "{}".data(using: String.Encoding.utf8)!
    }
    
    //请求头
    public var headers: [String: String]? {
        return nil
    }
}

