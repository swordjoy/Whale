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

extension UIImage: SwordJoyCompatible { }

extension UIView: SwordJoyCompatible { }

extension CALayer: SwordJoyCompatible { }

// MARK: - String
public struct SJStringProxy {
    let base: String
    init(proxy: String) {
        base = proxy
    }
}

extension String: SwordJoyCompatible {
    public typealias CompatibleType = SJStringProxy
    public var sj: CompatibleType {
        return SJStringProxy(proxy: self)
    }
}

