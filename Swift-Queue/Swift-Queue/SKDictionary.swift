//
//  SKDictionary.swift
//  Swift-Queue
//
//  Created by 董招兵 on 2017/8/3.
//  Copyright © 2017年 大兵布莱恩特. All rights reserved.
//

import UIKit

class  SKDictionary<K:Hashable,V> : CustomStringConvertible {

    private typealias Tup = (key:K,value:V)
    private var tmp : [Tup]?
    private var keys : Set<K>?
    public var count : Int {
        get {
            return self.tmp?.count ?? 0
        }
    }

    init() {
        self.keys = []
        self.tmp = [Tup]()
    }

    func set(value: V, forKey key: K)  {

        if self.keys!.contains(key) {
            for (idx,tup) in self.tmp!.enumerated() {
                if tup.key == key {
                    self.tmp![idx] = (key,value)
                    break
                }
            }

        } else {
            let tp : Tup = (key,value)
            self.tmp?.append(tp)
            self.keys?.insert(key)
        }
    }

    func object(for key : K) -> V? {

        guard self.keys!.contains(key) else { return nil }

        for (_,tup) in self.tmp!.enumerated() {
            if tup.key == key {
                return tup.value
            }
        }

        return nil
    }

    public func remove(forKey key : K) {

        guard self.keys!.contains(key) else { return }

        for (idx,tup) in self.tmp!.enumerated() {
            if tup.key == key {
                self.tmp?.remove(at: idx)
                break
            }
        }
    }

    public func removeAll() {
        self.keys?.removeAll()
        self.tmp?.removeAll()
    }

    subscript(key:K) -> V?{

        get {
            return self.object(for: key)
        }

        set {
            guard let newValue = newValue else{ return }
            set(value: newValue, forKey: key)
        }
    }

    public var description: String {
        if self.tmp!.count > 0 {
            return self.tmp!.description
        } else {
            return "[:]"
        }
    }


}
