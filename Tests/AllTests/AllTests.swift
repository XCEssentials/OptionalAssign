//
//  MKHOptionalAssignTests.swift
//  MKHOptionalAssignTests
//
//  Created by Maxim Khatskevich on 10/3/16.
//  Copyright © 2016 Maxim Khatskevich. All rights reserved.
//

import XCTest

import SwiftHamcrest

//@testable
import XCEOptionalAssign

class OptionalAssignAllTests: XCTestCase
{
    func testBasic()
    {
        var dict: [String: AnyObject] = [:]
        
        //---
        
        var val1: String? = "Val1"
        let key1 = "Key1"
        
        XCTAssertNotNil(val1)
        XCTAssertNil(dict[key1])
        
        dict[key1] ?= val1
        
        XCTAssertNotNil(val1)
        XCTAssertNotNil(dict[key1])
        XCTAssertEqual(dict[key1] as? String, val1)
        
        //---
        
        val1 = nil
        
        dict[key1] ?= val1
        
        assertThat(val1, nilValue())
        assertThat(dict[key1], nilValue())
        assertThat(dict[key1] as? String, equalTo(val1))
        
        //---
        
        val1 = "Val1Again"
        
        dict[key1] ?= val1
        
        XCTAssertNotNil(val1)
        XCTAssertNotNil(dict[key1])
        XCTAssertEqual(dict[key1] as? String, val1)
        
        //---
        
        var val2: Int? = nil
        let key2 = "Key2"
        
        XCTAssertNil(val2)
        XCTAssertNil(dict[key2])

        dict[key2] ?= val2
        
        XCTAssertNil(dict[key2])
        XCTAssertEqual(dict.keys.count, 1)
        XCTAssertEqual(dict.keys.first, key1)
        XCTAssertTrue(dict.keys.contains(key1))
        XCTAssertFalse(dict.keys.contains(key2))
        
        //---
        
        val2 = 231
        
        XCTAssertNotNil(val2)
        XCTAssertNil(dict[key2])
        
        dict[key2] ?= val2
        
        XCTAssertNotNil(dict[key2])
        XCTAssertEqual(dict.keys.count, 2)
        XCTAssertTrue(dict.keys.contains(key1))
        XCTAssertTrue(dict.keys.contains(key2))
    }
    
    func testImplicitlyUnwrapped()
    {
        var dict: [String: AnyObject] = [:]
        
        //---
        
        var val1: String! = nil
        let key1 = "Key1"
        
        XCTAssertNil(val1)
        XCTAssertNil(dict[key1])
        
        dict[key1] ?= val1
        
        XCTAssertNil(val1)
        XCTAssertNil(dict[key1])
        
        //---
        
        val1 = "Val1"
        
        XCTAssertNotNil(val1)
        XCTAssertNil(dict[key1])
        
        dict[key1] ?= val1
        
        XCTAssertNotNil(val1)
        XCTAssertNotNil(dict[key1])
        
        XCTAssertEqual((dict[key1] as! String), val1)
    }
    
    func testAssignToNonOptional()
    {
        var left = "Left Default"
        var right: String? = nil
        var rightImpl: String! = nil
        
        XCTAssertNotNil(left)
        XCTAssertNil(right)
        XCTAssertNil(rightImpl)
        
        //---
        
        left ?= right
        
        XCTAssertNotNil(left)
        XCTAssertNotEqual(left as String?, right)
        
        //---
        
        left ?= rightImpl
        
        XCTAssertNotNil(left)
        XCTAssertNotEqual(left as String?, rightImpl)
        
        //---
        
        right = "Right value"
        
        XCTAssertNotNil(left)
        XCTAssertNotNil(right)
        XCTAssertNotEqual(left as String?, right)
        
        //---
        
        left ?= right
        
        XCTAssertNotNil(left)
        XCTAssertNotNil(right)
        XCTAssertEqual(left, right)
        
        //---
        
        rightImpl = "Impl Right value"
        
        XCTAssertNotNil(left)
        XCTAssertNotNil(rightImpl)
        XCTAssertNotEqual(left, rightImpl)
        
        //---
        
        left ?= rightImpl
        
        XCTAssertNotNil(left)
        XCTAssertNotNil(rightImpl)
        XCTAssertEqual(left, rightImpl)
    }
}
