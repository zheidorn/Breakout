//
//  ViewController.swift
//  Breakout
//
//  Created by student3 on 4/15/16.
//  Copyright © 2016 student3. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollisionBehaviorDelegate {
   var dynamicAnimator = UIDynamicAnimator()
    var collisionBehavior = UICollisionBehavior()
    var pushBehavior = UIPushBehavior()
   
    
    let lengthOfBlock:CGFloat = 50.0
    
    let heightOfBlock:CGFloat = 15.0
    
    var ball:UIView!
    var blocks:[UIView] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    func createBlocks()
    {
        var x:CGFloat = 0
        var y:CGFloat = 50
        
        for _ in 1...5
        {
            for _ in 1...13
            {
                let block = UIView(frame: CGRectMake(x, y, lengthOfBlock, heightOfBlock))
                block.backgroundColor = UIColor.blackColor()
                view.addSubview(block)
                
            }
    }

    


    }

}