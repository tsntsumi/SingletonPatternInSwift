//
//  GlobalConstantSingletonTests.swift
//  SingletonPatternInSwift
//
//  Created by tsntsumi on 2014/07/26.
//  Copyright (c) 2014 tsntsumi. All rights reserved.
//

import Cocoa
import XCTest
import SingletonPatternInSwift

class GlobalConstantSingletonTests: XCTestCase {

    // このテストケースより先にシングルトンにアクセスするテストケースがあると、
    // このテストケースが失敗するので注意。
    func testSharedInstance_ThreadSafety() {
        var instance1: GlobalConstantSingleton?
        var instance2: GlobalConstantSingleton?
        
        let expectation1 = expectationWithDescription("Instance 1")
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
            instance1 = GlobalConstantSingleton.sharedInstance
            expectation1.fulfill()
        }
        let expectation2 = expectationWithDescription("Instance 2")
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
            instance2 = GlobalConstantSingleton.sharedInstance
            expectation2.fulfill()
        }
        
        waitForExpectationsWithTimeout(6.0) { (_) in
            XCTAssertTrue(instance1 === instance2, "")
        }
    }

}
