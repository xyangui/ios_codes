//
//  MyMoyaTests.swift
//  MyMoyaTests
//
//  Created by Jason on 14/9/18.
//  Copyright © 2018 Jason. All rights reserved.
//

import XCTest
@testable import MyMoya
import SwiftyJSON
import RxMoya
import RxSwift

class MyMoyaTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        //create one hero
        let addhero = Hero(fromJson: "")
        addhero.age = 44
        addhero.comment = "commm44"
        addhero.name = "jason44"
        
        let expectation = self.expectation(description:"http request")
        
        //rxswift
        HeroesProvider.rx.request(.postHero(addhero))
            .mapJSON()
            .flatMap({ result in
                
                let dict:Dictionary = JSON(result).dictionaryValue
                let isSuccess = dict["result"]?.rawString()  // post_success
                let id = dict["id"]!.intValue
                
                XCTAssertEqual(isSuccess, "post_success", "post one hero successfully")
                
                return HeroesProvider.rx.request(.oneHero(id))
            })
            .mapJSON()
            .flatMap({ result in
                
                let onehero = Hero(fromJson: JSON(result))
                
                XCTAssertEqual(onehero.age, 44)
                XCTAssertEqual(onehero.name, "jason44")
                XCTAssertEqual(onehero.comment, "commm44")
                
                onehero.age = 55
                onehero.name = "Jason55"
                onehero.comment = "comment55"
                
                return HeroesProvider.rx.request(.putHero(onehero))
            })
            .mapJSON()
            .flatMap({ result in
                
                let dict:Dictionary = JSON(result).dictionaryValue
                let isSuccess = dict["result"]?.rawString()  // put_success
                let id = dict["id"]!.intValue
                
                XCTAssertEqual(isSuccess, "put_success", "put one hero successfully")
                
                return HeroesProvider.rx.request(.oneHero(id))
            })
            .mapJSON()
            .flatMap({ result in
                
                let onehero = Hero(fromJson: JSON(result))
                
                XCTAssertEqual(onehero.age, 55)
                XCTAssertEqual(onehero.name, "Jason55")
                XCTAssertEqual(onehero.comment, "comment55")
                
                return HeroesProvider.rx.request(.deleteHero(onehero.id))
            })
            .mapJSON()
            .flatMap({ result in
                
                let dict:Dictionary = JSON(result).dictionaryValue
                let isSuccess = dict["result"]?.rawString()  // delete_success
                let id = dict["id"]!.intValue
                
                XCTAssertEqual(isSuccess, "delete_success", "delete one hero successfully")
                
                return HeroesProvider.rx.request(.oneHero(id))
            })
            .mapJSON()
            .subscribe { event in
                
                switch event {
                case .success(let response):
                    
                    let hero:Dictionary = JSON(response).dictionaryValue
                    XCTAssertTrue(hero.isEmpty, "the deleted hero dont exist")
               
                    expectation.fulfill() // 满足了fulfill 条件或 timeOut 才可以返回
                    
                case .error(let error):

                    XCTAssertTrue(false, "error")
                }
        }
        
        self.waitForExpectations(timeout:10000, handler: nil) // 等待
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
}
