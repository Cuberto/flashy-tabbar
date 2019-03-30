//
//  CBFlashyTabBar.swift
//  CBFlashyTabBarController
//
//  Created by Anton Skopin on 28/11/2018.
//  Copyright © 2018 cuberto. All rights reserved.
//

import UIKit

open class CBFlashyTabBar: UITabBar {

    private var buttons: [CBTabBarButton] = []
    public var animationSpeed: Double = 1.0 {
        didSet {
            reloadAnimations()
        }
    }

    fileprivate var shouldSelectOnTabBar = true
    open override var selectedItem: UITabBarItem? {
        willSet {
            guard let newValue = newValue else {
                buttons.forEach { $0.setSelected(false, animated: false) }
                return
            }
            guard let index = items?.index(of: newValue),
                index != NSNotFound else {
                    return
            }

            select(itemAt: index, animated: false)

        }
    }

    open override var tintColor: UIColor! {
        didSet {
            buttons.forEach { $0.tintColor = tintColor }
        }
    }

    open override var items: [UITabBarItem]? {
        didSet {
            reloadViews()
        }
    }

    open override func setItems(_ items: [UITabBarItem]?, animated: Bool) {
        super.setItems(items, animated: animated)
        reloadViews()
    }
    
    
    var barHeight: CGFloat = 60
    
    override open func sizeThatFits(_ size: CGSize) -> CGSize {
        var sizeThatFits = super.sizeThatFits(size)
        sizeThatFits.height = barHeight
        if #available(iOS 11.0, *) {
            sizeThatFits.height = sizeThatFits.height + safeAreaInsets.bottom
        }
        return sizeThatFits
    }

    open override func layoutSubviews() {
        super.layoutSubviews()
        let btnWidth = bounds.width / CGFloat(buttons.count)
        var btnHeight = bounds.height
        if #available(iOS 11.0, *) {
            btnHeight -= safeAreaInsets.bottom
        }

        for (index, button) in buttons.enumerated() {
            button.frame = CGRect(x: btnWidth * CGFloat(index), y: 0, width: btnWidth, height: btnHeight)
            button.setNeedsLayout()
        }
    }

    func reloadViews() {
        subviews.filter { String(describing: type(of: $0)) == "UITabBarButton" }.forEach { $0.removeFromSuperview() }
        buttons.forEach { $0.removeFromSuperview()}
        buttons = items?.map { self.button(forItem: $0) } ?? []
        reloadAnimations()
        setNeedsLayout()
    }

    private func reloadAnimations() {
        buttons.forEach { (button) in
            button.selectAnimation = CBTabItemSelectAnimation(duration: 0.5 / animationSpeed)
            button.deselectAnimation = CBTabItemDeselectAnimation(duration: 0.5 / animationSpeed)
        }
    }

    private func button(forItem item: UITabBarItem) -> CBTabBarButton {
        let button = CBTabBarButton(item: item)
        button.tintColor = tintColor
        button.addTarget(self, action: #selector(btnPressed), for: .touchUpInside)
        if selectedItem != nil && item === selectedItem {
            button.select(animated: false)
        }
        self.addSubview(button)
        return button
    }

    @objc private func btnPressed(sender: CBTabBarButton) {
        guard let index = buttons.index(of: sender),
              index != NSNotFound,
              let item = items?[index] else {
            return
        }
        buttons.forEach { (button) in
            guard button != sender else {
                return
            }
            button.setSelected(false, animated: true)
        }
        sender.setSelected(true, animated: true)
        delegate?.tabBar?(self, didSelect: item)
    }

    func select(itemAt index: Int, animated: Bool = false) {
        guard index < buttons.count else {
            return
        }
        let selectedbutton = buttons[index]
        buttons.forEach { (button) in
            guard button != selectedbutton else {
                return
            }
            button.setSelected(false, animated: false)
        }
        selectedbutton.setSelected(true, animated: false)
    }

}
