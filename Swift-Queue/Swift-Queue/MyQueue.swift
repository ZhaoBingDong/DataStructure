//
//  MyQueue.swift
//  Swift-Queue
//  GitHub地址 : https://github.com/ZhaoBingDong/Swift-DtaStructure.git

//  Created by 董招兵 on 2017/3/12.
//  Copyright © 2017年 大兵布莱恩特. All rights reserved.
//

import UIKit

/// 数据结构之队列

public class MyQueue<T> {
    
    var queue_Capacity : Int = 0 // 队列的容量
    var queue_Length : Int = 0; // 队列元素的长度
    private var queue : Array<T>? // 队列对象
    var queue_Head : Int = 0 // 队列头位置
    var queue_Tail :Int = 0 // 队列尾的位置
    convenience init(capacity : Int) { // 构造函数创建出一个队列数据模型来
        self.init()
        queue_Capacity  = capacity
        self.clearQueue()
    }
    
    /// 销毁队列
    open func destroyQueue() {
        self.queue?.removeAll()
        self.queue = nil
    }
    
    /// 清空队列
    open func clearQueue() {
    
        self.queue      =  [T]()
        queue_Length    = 0
        queue_Head      = 0
        queue_Tail      = 0

    }
    
    /// 获取队列元素的长度
    open func queueLength() -> Int {
        return queue_Length
    }
    
    /// 判断队列是否已经满了
    open func queueFull() -> Bool {
        return queue_Length == queue_Capacity
    }
    
    /// 判断队列是否为空
    open func queueEmpty() -> Bool {
        return queue_Length == 0;
    }

    
    /// 遍历队列
    open func queueTraverse() {
        
        let total = queue_Length + queue_Head
        let start = queue_Head
      
        for i in start..<total {
           let sum = self.queue?[i%queue_Capacity]
            print("\n\(String(describing: sum)),\n")
        }
        
    }
    
    /// 往队列中添加一个元素
    
    open func enQueue(_ element : T) -> Bool {
        
        if queueFull() {
            return false
        } else {

            self.queue?.insert(element, at: queue_Tail)
            queue_Tail+=1;
            queue_Tail = queue_Tail % queue_Capacity
            queue_Length+=1;
            return true
        }
    }
    
    /// 从队列中取出来一个元素 如果队列为空 那么 取出来的为 nil
    
    open func deQueue() -> T? {
        
        if queueEmpty() {
            return nil
        } else {

            let element = self.queue?[queue_Head]
            queue_Head+=1;
            queue_Head = queue_Head % queue_Capacity
            queue_Length-=1;
            return element;
        }
        
    }
    
    
    deinit {
//        print("对象被销毁了")
    }
 

}
