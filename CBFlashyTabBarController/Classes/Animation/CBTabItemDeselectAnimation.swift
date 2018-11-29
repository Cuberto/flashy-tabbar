//
//  CBTabItemDeselectAnimation.swift
//  CBFlashyTabBarController
//
//  Created by Anton Skopin on 28/11/2018.
//  Copyright © 2018 cuberto. All rights reserved.
//

import UIKit

struct CBTabItemDeselectAnimation: CBTabItemBasicAnimation {

    let duration: Double

    func imageOffsetAnimation(forTabBarItem item: CBTabBarButton) -> CAAnimation {
        let imageOffsetAnimation = CABasicAnimation(keyPath: "transform.translation.y")
        imageOffsetAnimation.fromValue = -((item.bounds.height - item.tabImage.frame.height) / 2.0 - 5.0)
        imageOffsetAnimation.toValue = 0.0
        return imageOffsetAnimation
    }

    func imageMaskAnimation(forTabBarItem item: CBTabBarButton) -> CAAnimation {
        let maskBounds = item.tabImage.bounds

        let path1 = CGMutablePath()

        let path2 = CGMutablePath()
        path2.move(to: CGPoint(x: maskBounds.width * 0.8, y: 0))
        path2.addLine(to: CGPoint(x: maskBounds.width, y: 0))
        path2.addLine(to: CGPoint(x: maskBounds.width, y: maskBounds.height * 0.15))
        path2.closeSubpath()

        let path3 = CGMutablePath()
        path3.move(to: .zero)
        path3.addLine(to: CGPoint(x: maskBounds.width, y: 0))
        path3.addLine(to: CGPoint(x: maskBounds.width, y: maskBounds.height * 0.25))
        path3.closeSubpath()

        let path4 = CGMutablePath()
        path4.move(to: .zero)
        path4.addLine(to: CGPoint(x: maskBounds.width, y: 0))
        path4.addLine(to: CGPoint(x: maskBounds.width, y: maskBounds.height * 0.9))
        path4.addLine(to: CGPoint(x: 0, y: maskBounds.height * 0.6))
        path4.closeSubpath()

        let path5 = CGMutablePath()
        path5.move(to: .zero)
        path5.addLine(to: CGPoint(x: maskBounds.width, y: 0))
        path5.addLine(to: CGPoint(x: maskBounds.width, y: maskBounds.height))
        path5.addLine(to: CGPoint(x: 0, y: maskBounds.height))
        path5.closeSubpath()

        let maskAnimation = CAKeyframeAnimation(keyPath: "path")
        maskAnimation.values = [path1, path2, path3, path4, path5]
        maskAnimation.keyTimes = [0.0, 0.1, 0.3, 0.7, 1.0]

        return maskAnimation
    }

    func labelOffsetAnimation(forTabBarItem item: CBTabBarButton) -> CAAnimation {
        let labelOffsetAnimation = CABasicAnimation(keyPath: "transform.translation.y")
        labelOffsetAnimation.fromValue = 0.0
        labelOffsetAnimation.toValue = (item.bounds.height - item.tabLabel.frame.height)/2.0 - 5.0
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
        maskAnimation.values = [path1, path2, path3, path4].reversed()
        maskAnimation.keyTimes = [0.0, 0.5, 0.7, 1.0]

        return maskAnimation
    }

    func dotScaleAnimation(forTabBarItem item: CBTabBarButton) -> CAAnimation {
        let dotAnimation = CAKeyframeAnimation(keyPath: "transform.scale")
        dotAnimation.values = [1.0, 1.0, 0.0, 0.0]
        dotAnimation.keyTimes = [0, 0.2, 0.7, 1.0]
        return dotAnimation
    }

}
