//
//  ViewController.swift
//  Swift-Queue
//  GitHub地址 : https://github.com/ZhaoBingDong/Swift-DtaStructure.git
//  Created by 董招兵 on 2017/3/12.
//  Copyright © 2017年 大兵布莱恩特. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
//       myQueueTest()
            myStack()
        
    }
    
    /// 验证和测试队列的代码
    func myQueueTest() {
        
        // 环形队列 最大容量是4 根据先进先出原则进行取值操作
        let myQueue = MyQueue(capacity: 4)
        
        
        let _ =  myQueue.enQueue(10)
        let _ =  myQueue.enQueue(20)
        let _ =  myQueue.enQueue(30)
        let _ =  myQueue.enQueue(40)
        let _ =  myQueue.enQueue(50)
        // 查看队列的元素
        myQueue.queueTraverse()
        // 从队列头中取出一个元素
        var sum = myQueue.deQueue()
        
        print("出队一个元素 \(sum)")
        
        // 从队列头中取出一个元素
        
        sum = myQueue.deQueue()
        print("出队一个元素 \(sum)")
        
        myQueue.queueTraverse()
        
        myQueue.clearQueue()
        
        // 往队列中添加一个元素 插入到队列尾部位置
        let _ = myQueue.enQueue(60)
        
        myQueue.queueTraverse()
        
        // 从队列中取出一个元素
        sum = myQueue.deQueue()
        
        
        print("出队一个元素 \(sum)")
        
        myQueue.queueTraverse()

        
    }
    
    func myStack() {
        
        
        let stack = MyStack(5)
        // 入栈3个元素
        let _ = stack.push("董招兵")
        let _ = stack.push("大兵")
        let _ = stack.push("张三")

        stack.stackTraverse()
        // 出栈一个元素 根据先进后出,后进先出的原理 那么 张三这个元素会被出栈 ,栈中只剩下 "董招兵","大兵两个元素"
        
        let _ = stack.pop()
        
        stack.stackTraverse()
        
        
        // 清空栈所有元素
        stack.clearStacks()
        
        stack.stackTraverse()

        
    }
    
    
}

