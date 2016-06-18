//
//  TextInputViewController.swift
//  swiftDemo
//
//  Created by qingfengiOS_2 on 16/6/18.
//  Copyright © 2016年 qingfengiOS_2. All rights reserved.
//

import UIKit

class TextInputViewController: UIViewController {

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
    
    
    func viewInit() -> Void {
        // 3 增加 textfield
        let textField = UITextField(frame: CGRect(x: 100, y: 300, width: 200, height: 50))
        //        textField.placeholder = "placeholder"
        textField.attributedPlaceholder = NSAttributedString(string: "placehold", attributes: [NSForegroundColorAttributeName : UIColor.redColor()])
        textField.backgroundColor = UIColor.greenColor()
        self.view.addSubview(textField)
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
