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
    case oneHero(Int)
    case postHero(Hero)
    case deleteHero(Int)
    case putHero(Hero)
}

extension Heroes: TargetType {
    
    public var baseURL: URL {
        return URL(string: "https://www.empirecclt.com.au/public/api")!
    }
    
    public var path: String {
        switch self {
        case .allHeroes:
            return "/heroes"
        case .oneHero(let id):
            return "/heroes/\(id)"
        case .postHero(_):
            return "/heroes"
        case .deleteHero(let id):
            return "/heroes/\(id)"
        case .putHero(let hero):
            return "/heroes/\(hero.id!)"
        }
    }
    
    public var method: Moya.Method {
        switch self {
        case .postHero(_):
            return .post
        case .deleteHero(_):
            return .delete
        case .putHero(_):
            return .put
        default:
            return .get
        }
    }
    
    //请求任务事件（这里附带上参数）
    public var task: Task {
        switch self {
        case .postHero(let hero):
            var params: [String: Any] = [:]
            params = hero.toDictionary()
            return .requestParameters(parameters: params, encoding: URLEncoding.default)
            
        case .putHero(let hero):
            var params: [String: Any] = [:]
            params = hero.toDictionary()
            return .requestParameters(parameters: params, encoding: URLEncoding.default)
            
//        case .oneHero(let channel):
//            var params: [String: Any] = [:]
//            params["channel"] = channel
//            params["type"] = "n"
//            params["from"] = "mainsite"
//            return .requestParameters(parameters: params,
//                                      encoding: URLEncoding.default)
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

