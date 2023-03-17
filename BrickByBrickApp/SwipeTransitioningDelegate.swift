//
//  SwipeTransitioningDelegate.swift
//  BrickByBrickApp
//
//  Created by Newcomer, Grayson on 3/17/23.
//

import UIKit

class SwipeTransitioningDelegate: NSObject, UIViewControllerTransitioningDelegate {
    

        var direction: Direction = .left

        func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
            return SwipeTransitioning(direction: direction)
        }

        func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
            return SwipeTransitioning(direction: direction)
        }
    

}
