//
//  ImageViewController.swift
//  swiftDemo
//
//  Created by qingfengiOS_2 on 16/6/18.
//  Copyright © 2016年 qingfengiOS_2. All rights reserved.
//

import UIKit

//  详见 https://www.hackingwithswift.com/example-code/calayer/how-to-create-keyframe-animations-using-cakeyframeanimation

// 和   http://mathewsanders.com/animations-in-swift-part-two/
// 问题
//  1 views 属于什么类型的变量呢？  let views = (frontView: self.redSquare, backView: self.blueSquare)
class ImageViewController: UIViewController {
    var imageView:UIImageView!
    var redSquare :UIView!
    var blueSquare :UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.viewInit()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func viewInit () {
        
        imageView = UIImageView(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
//        imageView.backgroundColor = UIColor.brownColor()
        imageView.image = UIImage(named: "qf_logo")
        view.addSubview( imageView)
        
        /*
        redSquare = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        redSquare.backgroundColor = UIColor.redColor()
        imageView.addSubview(redSquare)
        
        blueSquare = UIView(frame : redSquare.bounds)
        blueSquare.backgroundColor = UIColor.blueColor()
        */
        
        // 1 增加按钮
        let btn = UIButton();
        btn.frame = CGRect(x: 100, y: 400, width: 100, height: 50)
        btn.backgroundColor = UIColor.redColor()
        btn.setTitle("button", forState: UIControlState.Normal)
//        btn.addTarget(self, action: #selector(act(_:)), forControlEvents: UIControlEvents.TouchUpInside)

//        btn.addTarget(self, action: #selector(shakeView(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        
//        btn.addTarget(self, action: #selector(animateButtonTapped(_:)), forControlEvents: UIControlEvents.TouchUpInside)

//        btn.addTarget(self, action: #selector(transformAnimation), forControlEvents: UIControlEvents.TouchUpInside)
        
//        btn.addTarget(self, action: #selector(bezierCurveAnimation), forControlEvents: UIControlEvents.TouchUpInside)
//
//        btn.addTarget(self, action: #selector(multipleBezierCurveAnimation), forControlEvents: UIControlEvents.TouchUpInside)
//        
//        btn.addTarget(self, action: #selector(simpleOvalAnimation), forControlEvents: UIControlEvents.TouchUpInside)

//        btn.addTarget(self, action: #selector(systemDefaultAnimation), forControlEvents: UIControlEvents.TouchUpInside)

        self.view.addSubview(btn)
    }
    
    /*
    func act(btn:UIButton) {
        let animation:CABasicAnimation = CABasicAnimation(keyPath: "position")
        animation.fromValue = NSValue(CGPoint:CGPointMake(imageView.frame.midX, imageView.frame.midY))
        animation.toValue = NSValue(CGPoint:CGPointMake(imageView.frame.midX, 340))
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        animation.duration = 1.0
        imageView.layer.addAnimation(animation, forKey: "position")
    }
    */
    
    // 下两个方法 详见 https://www.hackingwithswift.com/example-code/calayer/how-to-create-keyframe-animations-using-cakeyframeanimation
    
    func act (btn:UIButton) -> Void {
        /* values  keyTimes  两个数组 的个数需要保持一致
         * 当 keyTimes 的时间到达 某个值时， values 到相应的值
         * keyTimes  和  duration的区别，     keyTimes 的取值为 0 。。。 1， 0代表开始，1代表结束
         */
        let animation = CAKeyframeAnimation(keyPath: "move")
        animation.keyPath = "position.y"
        animation.values = [0, 300, 0]
        animation.keyTimes = [0, 0.5, 1]
        animation.duration = 2
        animation.additive = true
        imageView.layer.addAnimation(animation, forKey: "move")
    }
    
    //抖动 视图动画
    func shakeView(vw: UIView) {
        let animation = CAKeyframeAnimation()
        animation.keyPath = "position.x"
        animation.values = [0, 10, -10, 10, -5, 5, -5, 0 ]
        animation.keyTimes = [0, 0.125, 0.25, 0.375, 0.5, 0.625, 0.75, 0.875, 1]
        animation.duration = 0.4
        animation.additive = true
        
        vw.layer.addAnimation(animation, forKey: "shake")
    }
    
    
    // 阅读小说类   翻页动画   http://mathewsanders.com/animations-in-swift-part-two/
    func animateButtonTapped(sender: AnyObject) {
        
        // create a 'tuple' (a pair or more of objects assigned to a single variable)

        // 1 此行 会有 bug 稍作处理  替换成下一行 ，  views 属于什么类型的变量呢？
//        let views = (frontView: self.redSquare, backView: self.blueSquare)
        
        var views: (frontView: UIView, backView: UIView)
        if((self.redSquare.superview) != nil){
            views = (frontView: self.redSquare, backView: self.blueSquare)
        }
        else {
            views = (frontView: self.blueSquare, backView: self.redSquare)
        }
        
        // set a transition style
        let transitionOptions = UIViewAnimationOptions.TransitionCrossDissolve
        
        //  2 和下行等价
     /*   UIView.transitionWithView(self.imageView, duration: 1.0, options: transitionOptions, animations: {
            // remove the front object...
            views.frontView.removeFromSuperview()
            
            // ... and add the other object
            self.imageView.addSubview(views.backView)
            
            }, completion: { finished in
                // any code entered here will be applied
                // .once the animation has completed
        })
        */
        
        // with no animation block, and a completion block set to 'nil' this makes a single line of code
        UIView.transitionFromView(views.frontView, toView: views.backView, duration: 1.0, options: transitionOptions, completion: nil)

    }
    
    // 旋转动画， 可围绕中心点选择 360
    func transformAnimation ()  {
        // angles in iOS are measured as radians PI is 180 degrees so PI × 2 is 360 degrees
        let fullRotation = CGFloat(M_PI * 2)
//
//        UIView.animateWithDuration(1.0, animations: {
//            // animating `transform` allows us to change 2D geometry of the object
//            // like `scale`, `rotation` or `translate`
//            self.imageView.transform = CGAffineTransformMakeRotation(fullRotation)
//        })
        
        let duration = 2.0
        let delay = 0.0
        /*
        let options = UIViewKeyframeAnimationOptions.CalculationModeLinear
        
        UIView.animateKeyframesWithDuration(duration, delay: delay, options: options, animations: {
            // each keyframe needs to be added here
            // within each keyframe the relativeStartTime and relativeDuration need to be values between 0.0 and 1.0
            
            UIView.addKeyframeWithRelativeStartTime(0, relativeDuration: 1/3, animations: {
                // start at 0.00s (5s × 0)
                // duration 1.67s (5s × 1/3)
                // end at   1.67s (0.00s + 1.67s)
                self.imageView.transform = CGAffineTransformMakeRotation(1/3 * fullRotation)
            })
            UIView.addKeyframeWithRelativeStartTime(1/3, relativeDuration: 1/3, animations: {
                self.imageView.transform = CGAffineTransformMakeRotation(2/3 * fullRotation)
            })
            UIView.addKeyframeWithRelativeStartTime(2/3, relativeDuration: 1/3, animations: {
                self.imageView.transform = CGAffineTransformMakeRotation(3/3 * fullRotation)
            })
            
            }, completion: {finished in
                // any code entered here will be applied
                // once the animation has completed
                
        })*/
        
        
        
        // 下面一段代码 和 上行等价， 
        // 差别在于 1 UIViewKeyframeAnimationOptions  的 类型不同, 2  addKeyframeWithRelativeStartTime 方法中relativeStartTime and relativeDuration 都为0，（这两个参数的值   会被忽略）
//        UIView.addKeyframeWithRelativeStartTime(<#T##frameStartTime: Double##Double#>, relativeDuration: <#T##Double#>, animations: <#T##() -> Void#>)
        let options = UIViewKeyframeAnimationOptions.CalculationModePaced
        
        UIView.animateKeyframesWithDuration(duration, delay: delay, options: options, animations: {
            
            // note that we've set relativeStartTime and relativeDuration to zero.
            // Because we're using `CalculationModePaced` these values are ignored
            // and iOS figures out values that are needed to create a smooth constant transition
            UIView.addKeyframeWithRelativeStartTime(0, relativeDuration: 0, animations: {
                self.imageView.transform = CGAffineTransformMakeRotation(1/3 * fullRotation)
            })
            
            UIView.addKeyframeWithRelativeStartTime(0, relativeDuration: 0, animations: {
                self.imageView.transform = CGAffineTransformMakeRotation(2/3 * fullRotation)
            })
            
            UIView.addKeyframeWithRelativeStartTime(0, relativeDuration: 0, animations: {
                self.imageView.transform = CGAffineTransformMakeRotation(3/3 * fullRotation)
            })
            
            }, completion: nil)
    }

    // 轨迹为贝塞尔  曲线  动画
    func bezierCurveAnimation() -> Void {
        // now create a bezier path that defines our curve
        // the animation function needs the curve defined as a CGPath
        // but these are more difficult to work with, so instead
        // we'll create a UIBezierPath, and then create a
        // CGPath from the bezier when we need it
        
        let path = UIBezierPath()
        path.moveToPoint(CGPoint(x: 16,y: 239))
        path.addCurveToPoint(CGPoint(x: 301, y: 239), controlPoint1: CGPoint(x: 136, y: 373), controlPoint2: CGPoint(x: 178, y: 110))
        
        // create a new CAKeyframeAnimation that animates the objects position
        let anim = CAKeyframeAnimation(keyPath: "position")
        
        // set the animations path to our bezier curve
        anim.path = path.CGPath
        
        // set some more parameters for the animation
        // this rotation mode means that our object will rotate so that it's parallel to whatever point it is currently on the curve
        anim.rotationMode = kCAAnimationRotateAuto
        anim.repeatCount = Float.infinity
        anim.duration = 5.0
        
        // we add the animation to the squares 'layer' property
        imageView.layer.addAnimation(anim, forKey: "animate position along path")
    }
    
    
    func multipleBezierCurveAnimation() -> Void {
        // loop from 0 to 5
        for _ in 0...5 {
            
            // create a square
            let square = UIView()
            square.frame = CGRect(x: 55, y: 300, width: 20, height: 20)
            square.backgroundColor = UIColor.redColor()
            self.view.addSubview(square)
            
            // randomly create a value between 0.0 and 150.0
            let randomYOffset = CGFloat( arc4random_uniform(150))
            
            // for every y-value on the bezier curve
            // add our random y offset so that each individual animation
            // will appear at a different y-position
            let path = UIBezierPath()
            path.moveToPoint(CGPoint(x: 16,y: 239 + randomYOffset))
            path.addCurveToPoint(CGPoint(x: 301, y: 239 + randomYOffset), controlPoint1: CGPoint(x: 136, y: 373 + randomYOffset), controlPoint2: CGPoint(x: 178, y: 110 + randomYOffset))
            
            // create the animation
            let anim = CAKeyframeAnimation(keyPath: "position")
            anim.path = path.CGPath
            anim.rotationMode = kCAAnimationRotateAuto
            anim.repeatCount = Float.infinity
//            anim.duration = 5.0
            
            // each square will take between 4.0 and 8.0 seconds
            // to complete one animation loop
            anim.duration = Double(arc4random_uniform(40)+30) / 10
            
            // stagger each animation by a random value
            // `290` was chosen simply by experimentation
            anim.timeOffset = Double(arc4random_uniform(290))

            // add the animation
            square.layer.addAnimation(anim, forKey: "animate position along path")
        }

    }
    
    // 圆形动画, 在屏幕中画一个 蓝色的圆
    func simpleOvalAnimation() -> Void {
        // set up some values to use in the curve
        let ovalStartAngle = CGFloat(90.01 * M_PI/180)
        let ovalEndAngle = CGFloat(90 * M_PI/180)
        let ovalRect = CGRectMake(97.5, 158.5, 125, 125)
        
        // create the bezier path
        let ovalPath = UIBezierPath()
        
        ovalPath.addArcWithCenter(CGPointMake(CGRectGetMidX(ovalRect), CGRectGetMidY(ovalRect)),
                                  radius: CGRectGetWidth(ovalRect) / 2,
                                  startAngle: ovalStartAngle,
                                  endAngle: ovalEndAngle, clockwise: true)
//        ovalPath.addArcWithCenter(<#T##center: CGPoint##CGPoint#>, radius: <#T##CGFloat#>, startAngle: <#T##CGFloat#>, endAngle: <#T##CGFloat#>, clockwise: <#T##Bool#>)

        // create an object that represents how the curve
        // should be presented on the screen
        let progressLine = CAShapeLayer()
        progressLine.path = ovalPath.CGPath
        progressLine.strokeColor = UIColor.blueColor().CGColor
        progressLine.fillColor = UIColor.clearColor().CGColor
        progressLine.lineWidth = 10.0
        progressLine.lineCap = kCALineCapRound
        
        // add the curve to the screen
        self.view.layer.addSublayer(progressLine)
        
        // create a basic animation that animates the value 'strokeEnd'
        // from 0.0 to 1.0 over 3.0 seconds
        let animateStrokeEnd = CABasicAnimation(keyPath: "strokeEnd")
        animateStrokeEnd.duration = 3.0
        animateStrokeEnd.fromValue = 0.0
        animateStrokeEnd.toValue = 1.0
        
        // add the animation
        progressLine.addAnimation(animateStrokeEnd, forKey: "animate stroke end animation")
    }
    
    func systemDefaultAnimation() -> Void {
        // create and add blue-fish.png image to screen
        let fish = UIImageView()
        fish.image = UIImage(named: "qf_logo")
        fish.frame = CGRect(x: 50, y: 150, width: 50, height: 50)
        self.view.addSubview(fish)
        
        // create an array of views to animate (in this case just one)
        let viewsToAnimate = [fish]
        
        // perform the system animation
        // as of iOS 8 UISystemAnimation.Delete is the only valid option
        UIView.performSystemAnimation(UISystemAnimation.Delete, onViews: viewsToAnimate, options: UIViewAnimationOptions.AllowAnimatedContent, animations: {
            // any changes defined here will occur
            // in parallel with the system animation
            
            }, completion: { finished in
                // any code entered here will be applied
                // once the animation has completed
                
        })
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
