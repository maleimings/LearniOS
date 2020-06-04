//
//  FadeOutAnimationController.swift
//  StoreSearch
//
//  Created by Valiant on 2020/6/4.
//  Copyright © 2020 Valiant. All rights reserved.
//

import Foundation
import UIKit

class FadeOutAnimationController: NSObject,
UIViewControllerAnimatedTransitioning {
  func transitionDuration(using transitionContext:
    UIViewControllerContextTransitioning?) -> TimeInterval {
    return 0.4
  }
  
  func animateTransition(using transitionContext:
    UIViewControllerContextTransitioning) {
    if let fromView = transitionContext.view(
      forKey: UITransitionContextViewKey.from) {
      let time = transitionDuration(using: transitionContext)
      UIView.animate(withDuration: time, animations: {
        fromView.alpha = 0
      }, completion: { finished in
        transitionContext.completeTransition(finished)
      })
    }
  }
}
