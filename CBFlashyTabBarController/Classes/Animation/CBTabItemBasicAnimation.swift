//
//  CBTabItemBasicAnimation.swift
//  CBFlashyTabBarController
//
//  Created by Anton Skopin on 28/11/2018.
//  Copyright © 2018 cuberto. All rights reserved.
//

import UIKit

protocol CBTabItemBasicAnimation: CBTabItemAnimation {

    func imageOffsetAnimation(forTabBarItem item: CBTabBarButton) -> CAAnimation
    func imageMaskAnimation(forTabBarItem item: CBTabBarButton) -> CAAnimation
    func labelOffsetAnimation(forTabBarItem item: CBTabBarButton) -> CAAnimation
    func labelMaskAnimation(forTabBarItem item: CBTabBarButton) -> CAAnimation
    func dotScaleAnimation(forTabBarItem item: CBTabBarButton) -> CAAnimation

    var duration: Double { get }

}

extension CBTabItemBasicAnimation {

    func playAnimation(forTabBarItem item: CBTabBarButton, completion: (() -> Void)? = nil) {
        let animateImageOffset = imageOffsetAnimation(forTabBarItem: item)
        let animateImageMask = imageMaskAnimation(forTabBarItem: item)
        animateImageMask.isRemovedOnCompletion = false

        let animateLabelOffset = labelOffsetAnimation(forTabBarItem: item)
        let animateLabelMask = labelMaskAnimation(forTabBarItem: item)
        animateLabelMask.isRemovedOnCompletion = false

        let dotAnimation = dotScaleAnimation(forTabBarItem: item)

        let mainAnimations: [CAAnimation] = [animateImageOffset,
                                             animateImageMask,
                                             animateLabelOffset,
                                             animateLabelMask,
                                             dotAnimation]
        mainAnimations.forEach { (animation) in
            animation.duration = duration
            animation.isRemovedOnCompletion = false
            animation.fillMode = .forwards
        }
        if item.tabImage.layer.mask == nil {
            let imageMask = CAShapeLayer()
            imageMask.frame = item.tabImage.bounds
            item.tabImage.layer.mask = imageMask
        }

        if let animateImageMask = animateImageMask as? CAKeyframeAnimation,
           let imageMask = item.tabImage.layer.mask as? CAShapeLayer {
            imageMask.path = (animateImageMask.values as? [CGPath])?.last
        }

        if item.tabLabel.layer.mask == nil {
            let labelMask = CAShapeLayer()
            labelMask.frame = item.tabLabel.bounds
            item.tabLabel.layer.mask = labelMask
        }

        if let animateLabelMask = animateLabelMask as? CAKeyframeAnimation,
           let labelMask = item.tabLabel.layer.mask as? CAShapeLayer {
            labelMask.path = (animateLabelMask.values as? [CGPath])?.last
        }

        let timing = CAMediaTimingFunction(name: .easeOut)
        CATransaction.begin()
        CATransaction.setAnimationTimingFunction(timing)
        CATransaction.setCompletionBlock { completion?() }
        item.tabImage.layer.add(animateImageOffset, forKey: "offset")
        item.tabLabel.layer.add(animateLabelOffset, forKey: "offset")
        item.dotView.layer.add(dotAnimation, forKey: "scale")
        item.tabImage.layer.mask?.add(animateImageMask, forKey: "path")
        item.tabLabel.layer.mask?.add(animateLabelMask, forKey: "path")
        CATransaction.commit()
    }

}
