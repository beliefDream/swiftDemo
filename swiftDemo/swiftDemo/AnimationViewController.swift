//
//  AnimationViewController.swift
//  swiftDemo
//
//  Created by qingfengiOS_2 on 16/6/23.
//  Copyright © 2016年 qingfengiOS_2. All rights reserved.
//

import UIKit

class AnimationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        viewInit()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func viewInit () -> Void {
        // Create and add a colored square
        let coloredSquare = UIView()
        
        // set background color to blue
        coloredSquare.backgroundColor = UIColor.blueColor()
        
        // set frame (position and size) of the square
        // iOS coordinate system starts at the top left of the screen
        // so this square will be at top left of screen, 50x50pt
        // CG in CGRect stands for Core Graphics
        coloredSquare.frame = CGRect(x: 0, y: 120, width: 50, height: 50)
        
        // finally, add the square to the screen
        self.view.addSubview(coloredSquare)
        /*
        // lets set the duration to 1.0 seconds
        // and in the animations block change the background color
        // to red and the x-position  of the frame
        UIView.animateWithDuration(1.0, animations: {
            coloredSquare.backgroundColor = UIColor.redColor()
            
            // for the x-position I entered 320-50 (width of screen - width of the square)
            // if you want, you could just enter 270
            // but I prefer to enter the math as a reminder of what's happenings
            coloredSquare.frame = CGRect(x: 320-50, y: 120, width: 50, height: 50)
        })
        */
        
        
        let duration = 1.0
        let delay = 0.0
//        let options = UIViewAnimationOptions.Autoreverse
        // 不可以使用   |  运算符
        let options = UIViewAnimationOptions( _: [.Autoreverse, .Repeat, .CurveEaseInOut])
        let damping = CGFloat.init( 0.5) // set damping ration
        let velocity = CGFloat.init( 1.0) // set initial velocity
        
        
        UIView.animateWithDuration(1.0, delay: 0.0, options: options, animations: {
            
            // any changes entered in this block will be animated
            coloredSquare.backgroundColor = UIColor.redColor()
            coloredSquare.frame = CGRect(x: 320-50, y: 120, width: 50, height: 50)
            
            }, completion: nil)
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
