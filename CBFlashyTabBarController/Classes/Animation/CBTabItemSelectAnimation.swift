//
//  CBTabItemSelectAnimation.swift
//  CBFlashyTabBarController
//
//  Created by Anton Skopin on 28/11/2018.
//  Copyright © 2018 cuberto. All rights reserved.
//

import UIKit

struct CBTabItemSelectAnimation: CBTabItemBasicAnimation {

    let duration: Double

    func imageOffsetAnimation(forTabBarItem item: CBTabBarButton) -> CAAnimation {
        let imageOffsetAnimation = CABasicAnimation(keyPath: "transform.translation.y")
        imageOffsetAnimation.fromValue = 0.0
        imageOffsetAnimation.toValue = -((item.bounds.height - item.tabImage.frame.height) / 2.0 - 5.0)
        return imageOffsetAnimation
    }

    func imageMaskAnimation(forTabBarItem item: CBTabBarButton) -> CAAnimation {
        let maskBounds = item.tabImage.bounds

        let path1 = CGMutablePath()
        path1.move(to: .zero)
        path1.addLine(to: CGPoint(x: maskBounds.width, y: 0))
        path1.addLine(to: CGPoint(x: maskBounds.width, y: maskBounds.height))
        path1.addLine(to: CGPoint(x: 0, y: maskBounds.height))
        path1.closeSubpath()

        let path2 = CGMutablePath()
        path2.move(to: .zero)
        path2.addLine(to: CGPoint(x: maskBounds.width, y: 0))
        path2.addLine(to: CGPoint(x: maskBounds.width, y: maskBounds.height * 0.9))
        path2.addLine(to: CGPoint(x: 0, y: maskBounds.height * 0.6))
        path2.closeSubpath()

        let path3 = CGMutablePath()
        path3.move(to: .zero)
        path3.addLine(to: CGPoint(x: maskBounds.width, y: 0))
        path3.addLine(to: CGPoint(x: maskBounds.width, y: maskBounds.height * 0.25))
        path3.closeSubpath()

        let path4 = CGMutablePath()
        path4.move(to: CGPoint(x: maskBounds.width * 0.8, y: 0))
        path4.addLine(to: CGPoint(x: maskBounds.width, y: 0))
        path4.addLine(to: CGPoint(x: maskBounds.width, y: maskBounds.height * 0.15))
        path4.closeSubpath()

        let path5 = CGMutablePath()

        let maskAnimation = CAKeyframeAnimation(keyPath: "path")
        maskAnimation.values = [path1, path2, path3, path4, path5]
        maskAnimation.keyTimes = [0, 0.1, 0.5, 0.9, 1.0]

        return maskAnimation
    }

    func labelOffsetAnimation(forTabBarItem item: CBTabBarButton) -> CAAnimation {
        let labelOffsetAnimation = CABasicAnimation(keyPath: "transform.translation.y")
        labelOffsetAnimation.fromValue = (item.bounds.height - item.tabLabel.frame.height)/2.0 - 5.0
        labelOffsetAnimation.toValue = 0.0
        return labelOffsetAnimation
    }

    func labelMaskAnimation(forTabBarItem item: CBTabBarButton) -> CAAnimation {
        let maskBounds = item.tabLabel.bounds

        let path1 = CGMutablePath()
        path1.move(to: .zero)

        let path2 = CGMutablePath()
        path2.move(to: .zero)
        path2.addLine(to: CGPoint(x: maskBounds.width, y: 0))
        path2.addLine(to: CGPoint(x: maskBounds.width, y: maskBounds.height * 0.2))
        path2.closeSubpath()

        let path3 = CGMutablePath()
        path3.move(to: .zero)
        path3.addLine(to: CGPoint(x: maskBounds.width, y: 0))
        path3.addLine(to: CGPoint(x: maskBounds.width, y: maskBounds.height * 0.5))
        path3.addLine(to: CGPoint(x: 0, y: maskBounds.height * 0.1))
        path3.closeSubpath()

        let path4 = CGMutablePath()
        path4.move(to: .zero)
        path4.addLine(to: CGPoint(x: maskBounds.width, y: 0))
        path4.addLine(to: CGPoint(x: maskBounds.width, y: maskBounds.height))
        path4.addLine(to: CGPoint(x: 0, y: maskBounds.height))
        path4.closeSubpath()

        let maskAnimation = CAKeyframeAnimation(keyPath: "path")
        maskAnimation.values = [path1, path2, path3, path4]
        maskAnimation.keyTimes = [0, 0.1, 0.3, 1.0]

        return maskAnimation
    }

    func dotScaleAnimation(forTabBarItem item: CBTabBarButton) -> CAAnimation {
        let dotAnimation = CAKeyframeAnimation(keyPath: "transform.scale")
        dotAnimation.values = [0.0, 0.0, 1.0, 1.0]
        dotAnimation.keyTimes = [0, 0.2, 0.7, 1.0]
        return dotAnimation
    }

}
