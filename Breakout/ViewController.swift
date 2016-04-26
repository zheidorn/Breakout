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
   
    
    let lengthOfBlock:CGFloat = 60.0
    
    let heightOfBlock:CGFloat = 30.0
    
    var ball:UIView!
    var blocks:[UIView] = []
    var startBallArray:[UIView] = []
    var panViews:[UIView] = []
    var bothArray:[UIView] = []
    var paddleArray:[UIView] = []
    @IBOutlet weak var paddle: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        dynamicAnimator = UIDynamicAnimator(referenceView: view)
        paddle.clipsToBounds = true
        initGame()
        panViews.append(paddle)
        bothArray.append(paddle)
        paddleArray.append(paddle)
        view.backgroundColor = UIColor.init(red: 9/255, green: 66/255, blue: 67/255, alpha: 1.0)
    }
    
    @IBAction func startBallAction(sender: UIButton) {
        
        setupBehaviors()
        pushBehavior = UIPushBehavior(items: startBallArray, mode: .Instantaneous)
        pushBehavior.pushDirection = CGVectorMake(0.2, 1.0)
        pushBehavior.magnitude = 0.40
        pushBehavior.active = true
        dynamicAnimator.addBehavior(pushBehavior)
    }
    @IBAction func panGestureRecognizer(sender: UIPanGestureRecognizer) {
        let panGestureRec = sender.locationInView(view)
        paddle.center = CGPointMake(panGestureRec.x, paddle.center.y)
        dynamicAnimator.updateItemUsingCurrentState(paddle)
    }
    
    func createBlocks()
    {
        var x:CGFloat = 15
        var y:CGFloat = 45
        
        for _ in 1...4
        {
            for _ in 1...11
            {
                let block = UIView(frame: CGRectMake(x, y, lengthOfBlock, heightOfBlock))
                block.backgroundColor = UIColor.grayColor()
                view.addSubview(block)
                blocks.append(block)
                panViews.append(block)
                bothArray.append(block)
                collisionBehavior.addItem(block)
                
                x += (15 + lengthOfBlock)
            }
            x = 15
            y += (25 + heightOfBlock)
                
            
    }
        panViews.append(paddle)
        bothArray.append(paddle)
        paddleArray.append(paddle)
    }
    
        
        func createBall()
        {
            ball = UIView(frame: CGRectMake(300, 300, 20, 20))
            ball.backgroundColor = UIColor.init(red: 0, green: 244/255, blue: 244/255, alpha: 1.0)
            view.addSubview(ball)
            ball.layer.cornerRadius = ball.frame.size.width/2
            ball.clipsToBounds = true
            startBallArray.append(ball)
            panViews.append(ball)
        }
        
        func setupBehaviors()
        {
            
            let blockDynamicItemBehavior = UIDynamicItemBehavior(items: blocks)
            blockDynamicItemBehavior.density = 1000000.1
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
            
            
            
            collisionBehavior = UICollisionBehavior(items: panViews)
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
                    else if block.backgroundColor == UIColor.purpleColor()
                    {
                        block.removeFromSuperview()
                        collisionBehavior.removeItem(block)
                    }
                }
            }
        }
        
        
    
    
   
    func initGame()
    {
        
        setupBehaviors()
        createBlocks()
        createBall()
        
    }

}

