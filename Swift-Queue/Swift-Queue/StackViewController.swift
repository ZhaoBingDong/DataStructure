//
//  StackViewController.swift
//  Swift-Queue
//
//  Created by 董招兵 on 2017/3/13.
//  Copyright © 2017年 大兵布莱恩特. All rights reserved.
//

import UIKit

extension UIColor {
    /// 生成一个随机色
    class func RandomColor() -> UIColor {
        
        let red     = arc4random_uniform(255)
        let green   = arc4random_uniform(255)
        let blue    = arc4random_uniform(255)
        
        return UIColor.RGBColor(CGFloat(red), green: CGFloat(green), blue: CGFloat(blue))
        
    }
    
    // 根据 RGB 生成一个颜色,透明度是1.0
    class func RGBColor(_ red : CGFloat ,green : CGFloat , blue : CGFloat) -> UIColor {
        
        let color   = RGBAColor(red, green: green, blue: blue, alpha: 1.0);
        return color;
        
    }
    
    // 根据 RGB 生成一个颜色,透明度是可以设置 0.0 ~ 1.0
    
    class func RGBAColor(_ red : CGFloat ,green : CGFloat , blue : CGFloat,alpha : CGFloat) -> UIColor {
        
        let color = UIColor(red:(red/255.0), green: (green/255.0), blue: (blue/255.0), alpha: (alpha));
        
        return color;
        
    }



}

class StackViewController: UIViewController {

    @IBOutlet weak var contentView: UIView!
    var stack : MyStack?
    override func viewDidLoad() {
        super.viewDidLoad()

        self.stack = MyStack(4)
        self.title  = "栈"
        
    }

    @IBAction func pop(_ sender: UIButton) {
        
        if (self.stack?.stackEmpty())! {
            return
        }
        
        // 根据栈顶索引 取出栈顶的 label
        let topLabel = self.contentView.subviews[((self.stack?.stackTop)!-1)]
        topLabel.removeFromSuperview()
        // 出栈一个元素
        
        let _ = self.stack?.pop()
        
    }
    
    @IBAction func push(_ sender: UIButton) {
    
        if (self.stack?.stackFull())! {
            return
        }
        
        let array : [String] = ["大兵布莱恩特","张三","李四","科比","詹姆斯","杜兰特","库里"]
        let index = arc4random_uniform(UInt32(array.count))
        let name  = array[Int(index)]
        let topLabel = self.contentView.subviews.last as? UILabel
        
        var labelY  : CGFloat  = 0.0
        if topLabel != nil {
            labelY   = (topLabel?.frame.minY)!-100.0;
        } else {
            labelY   = 300.0
        }
        
        let label = UILabel(frame: CGRect(x: 0.0, y: labelY, width: self.contentView.frame.size.width, height: 100.0))
        label.textColor = UIColor.white
        label.textAlignment = .center
        label.text = "view\((self.stack?.stackTop)!) name = \(name)"
        label.tag  = (self.stack?.stackTop)!
        label.backgroundColor = UIColor.RandomColor()
        
        self.contentView.addSubview(label)
        
        // 入栈一个元素
        
        let _ = self.stack?.push(name)
        
    }

}
