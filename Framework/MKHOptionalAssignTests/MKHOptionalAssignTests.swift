//
//  MKHOptionalAssignTests.swift
//  MKHOptionalAssignTests
//
//  Created by Maxim Khatskevich on 10/3/16.
//  Copyright © 2016 Maxim Khatskevich. All rights reserved.
//

import XCTest

//@testable
import MKHOptionalAssign

class MKHOptionalAssignTests: XCTestCase
{
    func testBasic()
    {
        var dict: [String: AnyObject] = [:]
        
        //===
        
        var val1: String? = "Val1"
        let key1 = "Key1"
        
        print("0.1----->>>> \(val1)")
        print("0.2----->>>> \(dict[key1] as? String)")
        
        XCTAssertNotNil(val1)
        XCTAssertNil(dict[key1])
        
        dict[key1] ?= val1
        
        print("1.1----->>>> \(val1)")
        print("1.2----->>>> \(dict[key1] as? String)")
        
        XCTAssertNotNil(val1)
        XCTAssertNotNil(dict[key1])
        XCTAssertEqual(dict[key1] as? String, val1)
        
        //===
        
        val1 = nil
        
        dict[key1] ?= val1
        
        print("2.1----->>>> \(val1)")
        print("2.2----->>>> \(dict[key1] as? String)")
        
        XCTAssertNil(val1)
        XCTAssertNotNil(dict[key1])
        XCTAssertNotEqual(dict[key1] as? String, val1)
        
        //===
        
        val1 = "Val1Again"
        
        dict[key1] ?= val1
        
        print("3.1----->>>> \(val1)")
        print("3.2----->>>> \(dict[key1] as? String)")
        
        XCTAssertNotNil(val1)
        XCTAssertNotNil(dict[key1])
        XCTAssertEqual(dict[key1] as? String, val1)
        
        //===
        
        var val2: Int? = nil
        let key2 = "Key2"
        
        print("4.1----->>>> \(val2)")
        print("4.2----->>>> \(dict[key2] as? Int)")
        
        XCTAssertNil(val2)
        XCTAssertNil(dict[key2])

        dict[key2] ?= val2
        
        print("5.1----->>>> \(val2)")
        print("5.2----->>>> \(dict[key2] as? Int)")
        
        XCTAssertNil(dict[key2])
        XCTAssertEqual(dict.keys.count, 1)
        XCTAssertEqual(dict.keys.first, key1)
        XCTAssertTrue(dict.keys.contains(key1))
        XCTAssertFalse(dict.keys.contains(key2))
        
        //===
        
        val2 = 231
        
        print("6.1----->>>> \(val2)")
        print("6.2----->>>> \(dict[key2] as? Int)")
        
        XCTAssertNotNil(val2)
        XCTAssertNil(dict[key2])
        
        dict[key2] ?= val2
        
        print("7.1----->>>> \(val2)")
        print("7.2----->>>> \(dict[key2] as? Int)")
        
        XCTAssertNotNil(dict[key2])
        XCTAssertEqual(dict.keys.count, 2)
        XCTAssertTrue(dict.keys.contains(key1))
        XCTAssertTrue(dict.keys.contains(key2))
    }
    
    func testImplicitlyUnwrapped()
    {
        var dict: [String: AnyObject] = [:]
        
        //===
        
        var val1: String! = nil
        let key1 = "Key1"
        
        XCTAssertNil(val1)
        XCTAssertNil(dict[key1])
        
        dict[key1] ?= val1
        
        print("ImplicitlyUnwrapped.0----->>>> \(dict[key1] as? String)")
        
        XCTAssertNil(val1)
        XCTAssertNil(dict[key1])
        
        //===
        
        val1 = "Val1"
        
        XCTAssertNotNil(val1)
        XCTAssertNil(dict[key1])
        
        dict[key1] ?= val1
        
        XCTAssertNotNil(val1)
        XCTAssertNotNil(dict[key1])
        
        print("ImplicitlyUnwrapped.1.1----->>>> \(val1)")
        print("ImplicitlyUnwrapped.1.2----->>>> \(dict[key1] as! String)")
        
        XCTAssertEqual((dict[key1] as! String), val1)
    }
    
    func testAssignToNonOptional()
    {
        var left = "Left Default"
        var right: String? = nil
        var rightImpl: String! = nil
        
        print("AssignToNonOptional.0.1----->>>> \(left)")
        
        XCTAssertNotNil(left)
        XCTAssertNil(right)
        XCTAssertNil(rightImpl)
        
        //===
        
        left ?= right
        
        print("AssignToNonOptional.1.1----->>>> \(left)")
        
        XCTAssertNotNil(left)
        XCTAssertNotEqual(left as String?, right)
        
        //===
        
        left ?= rightImpl
        
        print("AssignToNonOptional.2.1----->>>> \(left)")
        
        XCTAssertNotNil(left)
        XCTAssertNotEqual(left as String?, rightImpl)
        
        //===
        
        right = "Right value"
        
        print("AssignToNonOptional.3.1----->>>> \(left)")
        print("AssignToNonOptional.3.2----->>>> \(right)")
        
        XCTAssertNotNil(left)
        XCTAssertNotNil(right)
        XCTAssertNotEqual(left as String?, right)
        
        //===
        
        left ?= right
        
        print("AssignToNonOptional.4.1----->>>> \(left)")
        print("AssignToNonOptional.4.2----->>>> \(right)")
        
        XCTAssertNotNil(left)
        XCTAssertNotNil(right)
        XCTAssertEqual(left, right)
        
        //===
        
        rightImpl = "Impl Right value"
        
        print("AssignToNonOptional.5.1----->>>> \(left)")
        print("AssignToNonOptional.5.2----->>>> \(rightImpl)")
        
        XCTAssertNotNil(left)
        XCTAssertNotNil(rightImpl)
        XCTAssertNotEqual(left, rightImpl)
        
        //===
        
        left ?= rightImpl
        
        print("AssignToNonOptional.6.1----->>>> \(left)")
        print("AssignToNonOptional.6.2----->>>> \(rightImpl)")
        
        XCTAssertNotNil(left)
        XCTAssertNotNil(rightImpl)
        XCTAssertEqual(left, rightImpl)
    }
}
