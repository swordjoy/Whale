//
//  SwordJoy.swift
//  SJSwiftKit
//
//  Created by swordjoy on 2017/2/16.
//  Copyright © 2017年 swordjoy. All rights reserved.
//

import Foundation
import UIKit

// 这里模仿于猫神的Kingfisher

public protocol SwordJoyCompatible {
    associatedtype SJCompatibleType
    var sj: SJCompatibleType { get }
}

public extension SwordJoyCompatible {
    public var sj: SwordJoy<Self> {
        return SwordJoy(self)
    }
}

// class
public final class SwordJoy<Base> {
    public let base: Base
    public init(_ base: Base) {
        self.base = base
    }
}

//// - - - 
//
//public protocol SwordJoyStructCompatible {
//    associatedtype SJCompatibleType
//    var sj: SJCompatibleType { get }
//}
//
//public extension SwordJoyStructCompatible {
//    public var sj: SwordJoyStruct<Self> {
//        return SwordJoyStruct(self)
//    }
//}
//
//// struct
//public struct SwordJoyStruct<Base> {
//    public let base: Base
//    public init(_ base: Base) {
//        self.base = base
//    }
//}


// String
//public struct SJStringProxy {
//    public let base: String
//    public init(_ base: String) {
//        self.base = base;
//    }
//}
//
//extension String: SwordJoyCompatible {
//    public typealias CompatibleType = SJStringProxy
//    public var sj: SJStringProxy {
//        return SJStringProxy(self)
//    }
//}

extension UIImage: SwordJoyCompatible { }

extension UIView: SwordJoyCompatible { }

extension CALayer: SwordJoyCompatible { }




