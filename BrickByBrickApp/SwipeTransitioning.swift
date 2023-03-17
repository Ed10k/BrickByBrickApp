//
//  SwipeTransitioning.swift
//  BrickByBrickApp
//
//  Created by Newcomer, Grayson on 3/17/23.
//

import UIKit

enum Direction {
    case left
    case right
}

class SwipeTransitioning: NSObject, UIViewControllerAnimatedTransitioning {
    
    
    let direction: CGFloat
    
    init(direction: Direction) {
        self.direction = (direction == .left) ? 1 : -1
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        print("animating...")
        let containerView = transitionContext.containerView
        guard let fromView = transitionContext.view(forKey: .from),
              let toView = transitionContext.view(forKey: .to)
        else {
            return
        }
        
        func myfunc(){
            print("hello")
        }
        
        myfunc()
        
        containerView.addSubview(toView)
        
        let screenWidth = UIScreen.main.bounds.width
        toView.transform = CGAffineTransform(translationX: direction * screenWidth, y: 0)
        
        UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {
            fromView.transform = CGAffineTransform(translationX: -self.direction * screenWidth, y: 0)
            toView.transform = CGAffineTransform.identity
        }, completion: { finished in
            fromView.transform = CGAffineTransform.identity
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        })
    }
}

