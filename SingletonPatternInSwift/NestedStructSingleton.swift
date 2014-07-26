//
//  NestedStructSingleton.swift
//  SingletonPatternInSwift
//
//  Created by tsntsumi on 2014/07/26.
//  Copyright (c) 2014 tsntsumi. All rights reserved.
//

import Foundation

// ネストした構造体を使用する方法
// Swift ではクラス定数はまだサポートされていませんが、
// 構造体では static constant をサポートしているため、
// 構造体をネストすることで static constant をクラス定数として使うことができるようになります。
// この方法では遅延初期化とスレッドセーフをサポートします。

public class NestedStructSingleton {
    public class var sharedInstance: NestedStructSingleton {
    struct Static {
        static let instance: NestedStructSingleton = NestedStructSingleton()
        }
        return Static.instance
    }
    
    private init() {
        NSLog("init NestedStructSingleton")
        sleep(3)    // 初期化に時間をかけることで、スレッドセーフかどうかを検証できるようにする。
    }
}
