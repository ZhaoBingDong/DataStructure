//
//  QueueViewController.swift
//  Swift-Queue
//
//  Created by 董招兵 on 2017/3/13.
//  Copyright © 2017年 大兵布莱恩特. All rights reserved.
//

import UIKit



class QueueViewController: UIViewController {

    func degres_randians(_ angle : CGFloat) -> CGFloat {
        
        return angle*CGFloat(M_PI)/(180.0)
    }
    var array : [String] = [String]()
    var myQueue : MyQueue?
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "队列"
    
        self.myQueue = MyQueue(capacity: 6)
        
        craetUI()
        
        self.array.append("大兵");
        self.array.append("库里");
        self.array.append("欧文");
        self.array.append("格林");
        self.array.append("科比");
        self.array.append("哈登");
        self.array.append("威少");
        self.array.append("路威");
        
        

    }
    
    @IBAction func enQueue(_ sender: UIButton) {
        
        if (self.myQueue?.queueFull())! {
            print("环形队列满了");
            return
        }
        
        let idx  = arc4random_uniform(UInt32(self.array.count))
        let name = array[Int(idx)]
        
        let itail = self.myQueue?.queue_Tail
        
        let label = self.view.viewWithTag(itail!+100) as? UILabel
        
        label?.text = name
        
        // 入队操作 从队列尾插入一个元素到队列中
        let _ = self.myQueue?.enQueue(name)

    }
    
    @IBAction func clearQueue(_ sender: UIButton) {
    
        var index : Int = 100
        for subView in self.view.subviews {
            
            if let label = subView as? UILabel {
                label.text = "\(index-100)"
                index+=1;
            }
        }
    
        self.myQueue?.clearQueue()
        
    }
    @IBAction func deQueue(_ sender: UIButton) {
        
        if (self.myQueue?.queueEmpty())! {
            print("环形队列为空,不能执行出队的操作")
            return
        }
        
        let head = self.myQueue?.queue_Head
        let label = self.view.viewWithTag(head!+100) as? UILabel
        label?.text = "\((label?.tag)!-100)"
        
        // 出队操作.从队列头取出一个元素
        let _ = self.myQueue?.deQueue()
    
    }
    
    func craetUI() {
        
        let r          : CGFloat = 100.0
        
        let quequeCapacity : Int = self.myQueue?.queue_Capacity ?? 0
        let angle                = 360.0/CGFloat(quequeCapacity)
        let currentAngel         = (angle*CGFloat(M_PI)) / 180.0;
        
        for index in 0..<quequeCapacity {
            
            let x                       = 50.0 + r + r*cos(currentAngel*CGFloat(index));
            let y                       = 100.0 + r + r*sin(currentAngel*CGFloat(index));
            let label                   = UILabel(frame: CGRect(x: x, y: y, width: 50.0, height: 50.0))
            label.text                  = "\(index)"
            label.backgroundColor       = UIColor.RandomColor()
            label.layer.cornerRadius    = 25.0
            label.layer.masksToBounds   = true
            label.textAlignment         = .center
            label.tag                   = index+100
            label.textColor             = UIColor.white
            self.view.addSubview(label)
            
        }
        
        
        
    }

    
}
