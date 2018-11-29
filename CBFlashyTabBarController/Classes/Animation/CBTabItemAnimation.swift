//
//  CBTabItemAnimation.swift
//  CBFlashyTabBarController
//
//  Created by Anton Skopin on 28/11/2018.
//  Copyright © 2018 cuberto. All rights reserved.
//

import Foundation

protocol CBTabItemAnimation {

    func playAnimation(forTabBarItem item: CBTabBarButton)
    func playAnimation(forTabBarItem item: CBTabBarButton, completion: (() -> Void)?)

}

extension CBTabItemAnimation {

    func playAnimation(forTabBarItem item: CBTabBarButton) {
        playAnimation(forTabBarItem: item, completion: nil)
    }

}
