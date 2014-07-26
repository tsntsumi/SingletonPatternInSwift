//
//  ThreadUnsafeSingleton.swift
//  SingletonPatternInSwift
//
//  Created by tsntsumi on 2014/07/26.
//  Copyright (c) 2014 tsntsumi. All rights reserved.
//

import Foundation

// ネストした構造体を使用するが定数を使用しない方法
// 遅延初期化をサポートしていますが、スレッドセーフではない方法でインスタンスを生成しているため、
// タイミングによっては複数のインスタンスが生成されてしまいます。

public class ThreadUnsafeSingleton {
    public class var sharedInstance: ThreadUnsafeSingleton {
        struct Static {
            static var instance: ThreadUnsafeSingleton?
        }
        if !Static.instance {
            Static.instance = ThreadUnsafeSingleton()
        }
        return Static.instance!
    }
    
    private init() {
        NSLog("init ThreadUnsafeSingleton")
        sleep(3)    // 初期化に時間をかけることで、スレッドセーフかどうかを検証できるようにする。
    }
}
