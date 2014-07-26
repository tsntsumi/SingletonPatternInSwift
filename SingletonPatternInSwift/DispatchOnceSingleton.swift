//
//  DispatchOnceSingleton.swift
//  SingletonPatternInSwift
//
//  Created by tsntsumi on 2014/07/26.
//  Copyright (c) 2014 tsntsumi. All rights reserved.
//

import Foundation

// dispatch_once を使用する方法
// 従来から Objective-C で使われてきた方法です。
// ネストした構造体を使用する方法と同等ですが、コードが冗長になってしまいます。
// この方法では遅延初期化とスレッドセーフをサポートします。

public final class DispatchOnceSingleton {
    public class var sharedInstance: DispatchOnceSingleton {
        struct Static {
            static var instance: DispatchOnceSingleton?
            static var onceToken: dispatch_once_t = 0
        }
        dispatch_once(&Static.onceToken){
            Static.instance = DispatchOnceSingleton()
        }
        return Static.instance!
    }
    
    private init() {
        NSLog("init DispatchOnceSingleton")
        sleep(3)    // 初期化に時間をかけることで、スレッドセーフかどうかを検証できるようにする。
    }
}
