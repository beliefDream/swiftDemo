//
//  LabelViewController.swift
//  swiftDemo
//
//  Created by qingfengiOS_2 on 16/6/18.
//  Copyright © 2016年 qingfengiOS_2. All rights reserved.
//

import UIKit

class LabelViewController: UIViewController {

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
    
    
    // 添加视图
    func viewInit() -> Void {
        
        // 2 增加  label
        let nameLab = UILabel(frame: CGRect(x: 100, y: 200, width: 200, height: 50))
        nameLab.textColor = UIColor.cyanColor()
        nameLab.text = "label"
        nameLab.backgroundColor = UIColor.blackColor()
        nameLab.textAlignment = NSTextAlignment.Center
        self.view.addSubview(nameLab)
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
