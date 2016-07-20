//
//  DynamicAnimatorViewController.swift
//  swiftDemo
//
//  Created by qingfengiOS_2 on 16/6/18.
//  Copyright © 2016年 qingfengiOS_2. All rights reserved.
//

import UIKit

//  UIDynamicBehavior  掌握 10%

///  2 个问题要解决
// 问题1     int  和 double 型转化

// 问题 2  怎样把数组中的  字符串 转成方法名，添加到  button 的 action中
class DynamicAnimatorViewController: UIViewController {
    var topBtn:UIButton!
    var centerBtn:UIButton!
    var bottomBtn:UIButton!
    var resetBtn:UIButton!
    
    var animator = UIDynamicAnimator()

    var topFrame = CGRect(x: 50, y: 100, width: 100, height: 30)
    var centerFrame = CGRect(x: 50, y: 200, width: 100, height: 30)
    var bottomFrame = CGRect(x: 50, y: 300, width: 100, height: 30)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        viewInit()
        operateBtnInit()
    }

    func viewInit () -> Void {
        animator = UIDynamicAnimator(referenceView: view)
        
        topBtn = UIButton()
        topBtn.frame = CGRect(x: 50, y: 100, width: 100, height: 30)
        topBtn.setTitle("topBtn", forState: UIControlState.Normal)
        topBtn.setTitleColor(UIColor.redColor(), forState: UIControlState.Normal)
        topBtn.backgroundColor = UIColor.brownColor()
        view.addSubview(topBtn);
        
        centerBtn = UIButton()
        centerBtn.frame = CGRect(x: 50, y: 200, width: 100, height: 30)
        centerBtn.setTitle("centerBtn", forState: UIControlState.Normal)
        centerBtn.setTitleColor(UIColor.redColor(), forState: UIControlState.Normal)
        centerBtn.backgroundColor = UIColor.blueColor()
        view.addSubview(centerBtn);
        
        bottomBtn = UIButton()
        bottomBtn.frame = CGRect(x: 50, y: 300, width: 100, height: 30)
        bottomBtn.setTitle("bottomBtn", forState: UIControlState.Normal)
        bottomBtn.setTitleColor(UIColor.redColor(), forState: UIControlState.Normal)
        bottomBtn.backgroundColor = UIColor.greenColor()
        view.addSubview(bottomBtn);
    }
    
    
    func operateBtnInit () -> Void {

        let operatorMethods = NSArray(array: ["snapBehavior", "attachment",
            "pushBehavior", "dynamicItem", "gravity", "collision", "reset"])

        
        for index in 0 ..< operatorMethods.count {
            let btn = UIButton()
            let  h = index / 3
            let  v = index % 3
            let y =  ( 50 * h + 500)   // 1  问题1     int  和 double 型转化
            
            btn.frame = CGRect(x: 123 * v, y: y, width: 120, height: 30)
            btn.backgroundColor = UIColor.purpleColor()
            btn.setTitle(operatorMethods[index] as? String, forState: UIControlState.Normal)
            btn.tag = index
            
            //问题 2  怎样把数组中的  字符串 转成方法名，添加到  button 的 action中
            btn.addTarget(self, action: #selector(operateMethod(_ :)), forControlEvents: UIControlEvents.TouchUpInside)
            view.addSubview(btn)
        }
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func operateMethod(btn:UIButton) -> Void {
        print("\(btn.tag) + \(btn.titleForState(UIControlState.Normal))")
        animator.removeAllBehaviors()

        switch btn.tag {

        case 0:
            snapBehaviorMethod()
        case 1:
            attachmentBehavior()
        case 2:
            pushBehavior()
        case 3:
            dynamicItemBehavior()
        case 4:
            gravityBehavior()
        case 5:
            collisionBehavior()
        case 6 :
            resetMethod()
        default:
            print("else")
        }
    }
    
    //重设置
    func resetMethod () -> Void {
        topBtn.frame = CGRect(x: 50, y: 100, width: 100, height: 30)
        centerBtn.frame = CGRect(x: 50, y: 200, width: 100, height: 30)
        bottomBtn.frame = CGRect(x: 50, y: 300, width: 100, height: 30)
    }

    // UISnapBehavior
    func snapBehaviorMethod() -> Void {

        let x = view.bounds.width / 2
        let y = view.bounds.height / 2
        
        // 使用  UISnapBehavior, 分两步走
        // 1.  使用   initWithItem:snapToPoint:   方法舒适化一个 带 item 的 snap behavior
        // 2. 使用 addBehavior: 将 snap behavior  添加到  animator  中
        let snap1 = UISnapBehavior(item: topBtn, snapToPoint: CGPoint(x: x, y: y - 50))
        let snap2 = UISnapBehavior(item: centerBtn, snapToPoint: CGPoint(x: x, y: y))
        let snap3 = UISnapBehavior(item: bottomBtn, snapToPoint: CGPoint(x: x, y: y + 50))
        
        snap1.damping = 4
        snap2.damping = 2
        snap3.damping = 1
        
        animator.addBehavior(snap1)
        animator.addBehavior(snap2)
        animator.addBehavior(snap3)
    }
    
    
    func attachmentBehavior() -> Void {
        let center = view.center
        
        let attachment1 =   UIAttachmentBehavior(item: topBtn, attachedToAnchor: center)
        let attachment2 = UIAttachmentBehavior(item: centerBtn, attachedToAnchor: center)
        let attachment3 = UIAttachmentBehavior(item: bottomBtn, attachedToAnchor: center)

        attachment1.frequency = 0.5
        attachment2.frequency = 1
        attachment3.frequency = 0.5
            
        attachment1.damping  = 4
        attachment2.damping = 2
        attachment3.damping = 1

        attachment1.length = 20
        attachment2.length = 50
        attachment3.length = 20

        animator.addBehavior(attachment1)
        animator.addBehavior(attachment2)
        animator.addBehavior(attachment3)
        
        
        
        let  collision = UICollisionBehavior(items: [topBtn, centerBtn, bottomBtn])
        collision.translatesReferenceBoundsIntoBoundary = true
        animator.addBehavior(collision)
    }
   
    func pushBehavior() -> Void {
        // 碰击屏幕
        let push1 = UIPushBehavior(items: [topBtn, centerBtn, bottomBtn], mode: UIPushBehaviorMode.Instantaneous)
        push1.magnitude = 2
        animator.addBehavior(push1)
        
        
        // 弹动 动画
        let  collision = UICollisionBehavior(items: [topBtn, centerBtn, bottomBtn])
        collision.translatesReferenceBoundsIntoBoundary = true
        animator.addBehavior(collision)
    }
    
    func dynamicItemBehavior() -> Void {
        let  dynamic = UIDynamicItemBehavior(items: [topBtn, centerBtn, bottomBtn])
        animator.addBehavior(dynamic)
    }
    
    func gravityBehavior() -> Void {
        // 下落 动画
        let gravity = UIGravityBehavior(items: [topBtn, centerBtn, bottomBtn])
        animator.addBehavior(gravity)
    }
    
    func collisionBehavior() -> Void {
        
        
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
