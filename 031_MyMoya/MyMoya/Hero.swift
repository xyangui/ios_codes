//
//  Hero.swift
//  MyMoya
//
//  Created by Jason on 10/9/18.
//  Copyright © 2018 Jason. All rights reserved.
//

import Foundation
import SwiftyJSON

public class Hero : NSObject{ //, NSCoding{
    
    var age : Int!
    var comment : String!
    var id : Int!
    var name : String!
    
    /**
     * Instantiate the instance using the passed json values to set the properties values
     */
    init(fromJson json: JSON!){
        if json.isEmpty{
            return
        }
        age = json["age"].intValue
        comment = json["comment"].stringValue
        id = json["id"].intValue
        name = json["name"].stringValue
    }
    
    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if age != nil{
            dictionary["age"] = age
        }
        if comment != nil{
            dictionary["comment"] = comment
        }
        if id != nil{
            dictionary["id"] = id
        }
        if name != nil{
            dictionary["name"] = name
        }
        return dictionary
    }
    
    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
//    @objc required init(coder aDecoder: NSCoder)
//    {
//        age = aDecoder.decodeObject(forKey: "age") as? Int
//        comment = aDecoder.decodeObject(forKey: "comment") as? String
//        id = aDecoder.decodeObject(forKey: "id") as? Int
//        name = aDecoder.decodeObject(forKey: "name") as? String
//    }
    
    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    public func encode(with aCoder: NSCoder)
    {
        if age != nil{
            aCoder.encode(age, forKey: "age")
        }
        if comment != nil{
            aCoder.encode(comment, forKey: "comment")
        }
        if id != nil{
            aCoder.encode(id, forKey: "id")
        }
        if name != nil{
            aCoder.encode(name, forKey: "name")
        }
    }
}
