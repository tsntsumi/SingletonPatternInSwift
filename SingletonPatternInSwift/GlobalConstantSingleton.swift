//
//  GlobalConstantSingleton.swift
//  SingletonPatternInSwift
//
//  Created by tsntsumi on 2014/07/26.
//  Copyright (c) 2014 tsntsumi. All rights reserved.
//

import Foundation

// グローバル定数を使用する方法
//
// グローバル定数を使用するのは、Swiftではクラス定数がまだサポートされていないためです。
// この方法では遅延初期化とスレッドセーフをサポートします。

private let globalConstantSharedInstance = GlobalConstantSingleton()

public class GlobalConstantSingleton {
    public class var sharedInstance: GlobalConstantSingleton {
        return globalConstantSharedInstance
    }
    
    private init() {
        NSLog("init GlobalConstantSingleton")
        sleep(3)    // 初期化に時間をかけることで、スレッドセーフかどうかを検証できるようにする。
    }
}
