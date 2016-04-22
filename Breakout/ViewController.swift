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
    var startBallArray:[UIView] = []
    var allViews:[UIView] = []
    var bothArray:[UIView] = []
    var paddleArray:[UIView] = []
    @IBOutlet weak var paddle: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        dynamicAnimator = UIDynamicAnimator(referenceView: view)
        paddle.clipsToBounds = true
        initializeGame()
        allViews.append(paddle)
        bothArray.append(paddle)
        paddleArray.append(paddle)
    }
    
    @IBAction func panGestureRecognizer(sender: UIPanGestureRecognizer) {
        let panGestureRec = sender.locationInView(view)
        paddle.center = CGPointMake(panGestureRec.x, paddle.center.y)
        dynamicAnimator.updateItemUsingCurrentState(paddle)
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
                blocks.append(block)
                allViews.append(block)
                bothArray.append(block)
                collisionBehavior.addItem(block)
                
                x += (10 + lengthOfBlock)
            }
            x = 0
            y += (15 + heightOfBlock)
                
            
    }
        allViews.append(paddle)
        bothArray.append(paddle)
        paddleArray.append(paddle)
        
        
        func createBall()
        {
            ball = UIView(frame: CGRectMake(300, 300, 20, 20))
            ball.backgroundColor = UIColor.redColor()
            view.addSubview(ball)
            ball.layer.cornerRadius = ball.frame.size.width/2
            ball.clipsToBounds = true
            startBallArray.append(ball)
            allViews.append(ball)
        }
        
        func setupBehaviors()
        {
            
            let blockDynamicItemBehavior = UIDynamicItemBehavior(items: blocks)
            blockDynamicItemBehavior.density = 1000000.0
            blockDynamicItemBehavior.elasticity = 1.0
            blockDynamicItemBehavior.allowsRotation = true
            dynamicAnimator.addBehavior(blockDynamicItemBehavior)
            
            
            let ballDynamicBehavior = UIDynamicItemBehavior(items: startBallArray)
            ballDynamicBehavior.friction = 0
            ballDynamicBehavior.resistance = 0
            ballDynamicBehavior.elasticity = 1.0
            ballDynamicBehavior.allowsRotation = false
            dynamicAnimator.addBehavior(ballDynamicBehavior)
            
            
            let paddleDynamicBehavior = UIDynamicItemBehavior(items: paddleArray)
            paddleDynamicBehavior.density = 1000
            paddleDynamicBehavior.allowsRotation = false
            dynamicAnimator.addBehavior(paddleDynamicBehavior)
            
            
            
            collisionBehavior = UICollisionBehavior(items: allViews)
            collisionBehavior.translatesReferenceBoundsIntoBoundary = true
            collisionBehavior.collisionMode = .Everything
            collisionBehavior.collisionDelegate = self
            dynamicAnimator.addBehavior(collisionBehavior)
        }
        
        func collisionBehaviors(behavior: UICollisionBehavior, beganContactForItem item1: UIDynamicItem, withItem item2: UIDynamicItem, atPoint p: CGPoint)
        {
            
            for block in blocks
            {
                print(blocks.count)
                if item1.isEqual(ball) && item2.isEqual(block) || item1.isEqual(block) && item2.isEqual(ball)
                {
                    
                    
                    if block.backgroundColor == UIColor.blackColor()
                    {
                        block.backgroundColor = UIColor.greenColor()
                       
                    }
                    else if block.backgroundColor == UIColor.greenColor()
                    {
                        block.backgroundColor = UIColor.yellowColor()
                        
                    }
                    else if block.backgroundColor == UIColor.redColor()
                    {
                        block.removeFromSuperview()
                        collisionBehavior.removeItem(block)
                    }
                }
            }
        }
        
        func initializeGame()
        {
            setupBehaviors()
            createBlocks()
            createBall()
            
        }
    
    


    }

}