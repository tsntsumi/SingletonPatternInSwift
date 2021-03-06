Swift でのシングルトンパターン
==========================

Swiftでのシングルトンパターンのいくつかの実装方法の検討です。
一つを除いて遅延初期化とスレッドセーフをサポートします。

遅延初期化とは、アクセスするまでインスタンスが生成されないことです。
スレッドセーフは複数のスレッドから同時にアクセスされても、複数のインスタンスが生成されないことです。

### 方法1: グローバル定数を使用する方法

GlobalConstantSingleton.swift で定義しています。
グローバル定数を使用するのは、Swiftではクラス定数がまだサポートされていないためです。

この方法では遅延初期化とスレッドセーフをサポートします。

### 方法2: ネストした構造体を使用する方法

NestedStructSingleton.swift で定義しています。
Swift ではクラス定数はまだサポートされていませんが、
構造体では static constant をサポートしているため、
構造体をネストすることで static constant をクラス定数として使うことができるようになります。

この方法では遅延初期化とスレッドセーフをサポートします。

### 方法3: dispatch_once を使用する方法

DispatchOnceSingleton.swift で定義しています。
従来から Objective-C で使われてきた方法です。
ネストした構造体を使用する方法と同等ですが、コードが冗長になってしまいます。

この方法では遅延初期化とスレッドセーフをサポートします。

### 方法4: ネストした構造体を使用するが定数を使用しない方法

ThreadUnsafeSingleton.swift で定義しています。
遅延初期化をサポートしていますが、スレッドセーフではない方法でインスタンスを生成しているため、
タイミングによっては複数のインスタンスが生成されてしまいます。

## テストケース

各方法によるシングルトンパターンを使用した場合に、
スレッドセーフになっているかどうかを検証するテストケースです。
方法4のテストケースの場合だけスレッドセーフになっていないことを検証しています。

