//
//  MyStack.swift
//  Swift-Queue
//
//  Created by 董招兵 on 2017/3/13.
//  Copyright © 2017年 大兵布莱恩特. All rights reserved.
//

import UIKit

/// 数据结构之栈
class MyStack {

    private var stacks : [String]?
    private var stacklength : Int = 0
    private var stackCapacity : Int = 0;
    open var stackTop : Int = 0;
    convenience init(_ capacity : Int) {
        self.init()
        stackCapacity = capacity;
        clearStacks()
        
    }
    
    /// 栈是否为空
    open func stackEmpty() -> Bool {
        return stacklength == 0
    }
    
    /// 栈是否为满
    open func stackFull() -> Bool {
        return stacklength == stackCapacity
    }
    
    /// 清空栈所有元素
    open func clearStacks() {
        
        self.stacks = Array<String>(repeating: "", count: stackCapacity)
        stacklength = 0
        stackTop    = 0

    }
    
    /// 遍历栈中所有元素
    open func stackTraverse() {
        
        if stackEmpty() {
            print("栈中没有元素");
            return
        }
        
        for i in 0..<stackTop {            
            print("\n\((self.stacks?[i])!),\n")
        }
        
    }
    
    /// 入栈一个元素
    open func push(_ element : String) -> Bool {
        
        if stackFull() {
            return false
        } else {
            
            self.stacks?[stackTop] = element
            stackTop+=1;
            stacklength+=1;
            
           return true
        }
        
    }
    
    /// 出栈一个元素
    open func pop() -> String? {
        
        if stackEmpty() {
            return nil;
        } else {
            stackTop-=1;
            stacklength-=1;
            let string = self.stacks?[stackTop]
            print("出栈一个元素\(String(describing: string))")
            return string
        }
        
    }
    
}
