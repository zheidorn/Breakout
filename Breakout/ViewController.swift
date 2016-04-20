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
   

    override func viewDidLoad() {
        super.viewDidLoad()
        
        dynamicAnimator = UIDynamicAnimator(referenceView: view)
        createBlock()
    }
    
    func createBlock(){
        let heightOfBlock = 50
        let lengthOfBlock = 0
//        //let blueSquare = UIView(frame: CGRectMake(100, 100, 50, 50))
//        blueSquare.backgroundColor = UIColor.blackColor()
//        view.addSubview(blueSquare)
//        
//        let redSquare = UIView(frame: CGRectMake(300, 400, 50, 50))
//        redSquare.backgroundColor = UIColor.redColor()
//        view.addSubview(redSquare)
        
        addDynamicBehavior([blueSquare, redSquare])
    }
    
    
    func addDynamicBehavior(array: [UIView])
    {
        let dynamicItemBehavior = UIDynamicItemBehavior(items: array)
        dynamicItemBehavior.density = 1.0
        dynamicItemBehavior.friction = 0.0
        dynamicItemBehavior.resistance = 0.0
        dynamicItemBehavior.elasticity = 1.0
        dynamicAnimator.addBehavior(dynamicItemBehavior)
        
        let pushBehavior = UIPushBehavior(items: array, mode: .Instantaneous)
        pushBehavior.magnitude = 1.0
        pushBehavior.pushDirection = CGVectorMake(0.5, 0.5)
        dynamicAnimator.addBehavior(pushBehavior)
        
        let collisionBehavior = UICollisionBehavior(items: array)
        collisionBehavior.translatesReferenceBoundsIntoBoundary = true
        collisionBehavior.collisionMode = .Everything
        collisionBehavior.collisionDelegate = self
        dynamicAnimator.addBehavior(collisionBehavior)
        
    }

    


}

