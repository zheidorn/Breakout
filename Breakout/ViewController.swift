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

    }
    
    func setUpViews(){
        let blueSquare = UIView(frame: CGRectMake(100, 100, 50, 50))
        blueSquare.backgroundColor = UIColor.blackColor()
        view.addSubview(blueSquare)
        
        let redSquare = UIView(frame: CGRectMake(300, 400, 50, 50))
        redSquare.backgroundColor = UIColor.redColor()
        view.addSubview(redSquare)
        
        addDynamicBehavior([blueSquare, redSquare])
    }
    
    
    func addDynamicBehavior(array: [UIView])
    {
        let dynamicBehavior = UIDynamicItemBehavior(items: array)
        dynamicBehavior.density = 1.0
        dynamicBehavior.friction = 0.0
        dynamicBehavior.resistance = 0.0
        dynamicBehavior.elasticity = 1.0
        dynamicBehavior.addChildBehavior(dynamicBehavior)
        
        let pushBehavior = UIPushBehavior(items: array, mode: .Instantaneous)
        pushBehavior.magnitude = 1.0
        pushBehavior.pushDirection = CGVectorMake(0.5, 0.5)
        
        let collisionBehavior = UICollisionBehavior(items: array)
        collisionBehavior.translatesReferenceBoundsIntoBoundary = true
        collisionBehavior.collisionMode = .Everything
        collisionBehavior.collisionDelegate = self
        dynamicAnimator.addBehavior(collisionBehavior)
        
    }

    


}

