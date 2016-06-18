//
//  ButtonViewController.swift
//  swiftDemo
//
//  Created by qingfengiOS_2 on 16/6/18.
//  Copyright © 2016年 qingfengiOS_2. All rights reserved.
//

import UIKit

class ButtonViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = UIColor.whiteColor()
        viewInit()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func viewInit () {
        // 1 增加按钮
        let btn = UIButton();
        btn.frame = CGRect(x: 100, y: 100, width: 200, height: 50)
        btn.backgroundColor = UIColor.redColor()
        btn.setTitle("button", forState: UIControlState.Normal)
        //按钮增加方法的其它 写法
        //        btn.addTarget(self, action: #selector(actionMethod), forControlEvents: UIControlEvents.TouchUpInside)
        //        btn.addTarget(self, action: #selector(act(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        btn.addTarget(self, action: #selector(act(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(btn)
    }

    
    func act(btn:UIButton) {
        print("\(btn.titleForState(UIControlState.Normal)!)")
        
        //        let alertVC = UIAlertController(title: "hello", message: "hello world", preferredStyle: UIAlertControllerStyle.ActionSheet)
        //  设置样式   Alert : 屏幕中心 弹出， ActionSheet : 从屏幕底部弹出
        let alertVC = UIAlertController(title: "hello", message: "hello world", preferredStyle: UIAlertControllerStyle.Alert)
        let cancelAction = UIAlertAction(title: "cancel", style: UIAlertActionStyle.Default) { (UIAlertAction) in
            print("cancel")
        }
        let sureAction = UIAlertAction(title: "sure", style: UIAlertActionStyle.Default) { (UIAlertAction) in
            print("yes")
        }
        
        alertVC.addAction(cancelAction)
        alertVC.addAction(sureAction)
        //  当  样式  为 ActionSheet 的时候， 增加下行代码会崩溃
        alertVC.addTextFieldWithConfigurationHandler { (tf:UITextField) in
            tf.text = "w"
        }
        self.presentViewController(alertVC, animated: true) {
            
        }
    }
    
    
    func actionMethod() {
        print("heelo")
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
