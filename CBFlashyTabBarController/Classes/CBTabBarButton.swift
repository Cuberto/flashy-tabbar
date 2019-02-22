//
//  CBTabBarButton.swift
//  CBFlashyTabBarController
//
//  Created by Anton Skopin on 28/11/2018.
//  Copyright © 2018 cuberto. All rights reserved.
//

import UIKit

class CBTabBarButton: UIControl {

    var tabImage = UIImageView()
    var tabLabel = UILabel()
    var dotView = UIView()

    var selectAnimation: CBTabItemAnimation?
    var deselectAnimation: CBTabItemAnimation?
    private var _isSelected: Bool = false
    override var isSelected: Bool {
        get {
            return _isSelected
        }
        set {
            guard newValue != _isSelected else {
                return
            }
            if newValue {
                select(animated: false)
            } else {
                deselect(animated: false)
            }
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureSubviews()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureSubviews()
    }

    init(item: UITabBarItem) {
        super.init(frame: .zero)
        configureSubviews()
        defer {
            self.item = item
        }
    }

    var item: UITabBarItem? {
        didSet {
            tabImage.image = item?.image?.withRenderingMode(.alwaysTemplate)
            tabLabel.attributedText = attributedText(fortitle: item?.title)
        }
    }

    override var tintColor: UIColor! {
        didSet {
            tabImage.tintColor = tintColor.withAlphaComponent(0.4)
            tabLabel.textColor = tintColor
            dotView.backgroundColor = tintColor
        }
    }

    private func attributedText(fortitle title: String?) -> NSAttributedString {
        var attrs: [NSAttributedString.Key: Any] = [:]
        attrs[.kern] = -0.2
        attrs[.foregroundColor] = tintColor
        attrs[.font] = UIFont.systemFont(ofSize: 12, weight: .semibold)
        return NSAttributedString(string: title ?? "", attributes: attrs)
    }

    private func configureSubviews() {
        addSubview(tabLabel)
        addSubview(tabImage)
        addSubview(dotView)
        tabLabel.numberOfLines = 2
        tabLabel.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        tabLabel.isHidden = true
        tabImage.contentMode = .center
        let dotSize: CGFloat = 5.0
        dotView.frame = CGRect(origin: .zero, size: CGSize(width: dotSize, height: dotSize))
        dotView.layer.cornerRadius = dotSize / 2.0
        dotView.layer.shouldRasterize = true
        dotView.layer.rasterizationScale = UIScreen.main.scale
        dotView.isHidden = true
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        tabImage.sizeToFit()
        tabImage.center = CGPoint(x: bounds.width/2.0, y: bounds.height/2.0)
        tabLabel.frame = bounds
        tabLabel.sizeToFit()
        tabLabel.center = tabImage.center
        let dotX: CGFloat = tabImage.center.x - dotView.frame.width/2.0
        let dotY: CGFloat = tabLabel.frame.maxY + 13.0
        dotView.frame = CGRect(origin: CGPoint(x: dotX, y: dotY), size: dotView.frame.size)
    }

    func setSelected(_ selected: Bool, animated: Bool) {
        if selected {
            select(animated: animated)
        } else {
            deselect(animated: animated)
        }
    }

    func select(animated: Bool = true) {
        guard !_isSelected else {
            return
        }
        _isSelected = true
        guard animated, let selectAnimation = selectAnimation else {
            tabLabel.isHidden = false
            tabImage.isHidden = true
            dotView.isHidden = false
            return
        }
        tabLabel.isHidden = false
        dotView.isHidden = false
        selectAnimation.playAnimation(forTabBarItem: self) {[weak self] in
            if self?._isSelected ?? false {
                self?.tabImage.isHidden = true
            }
        }
    }

    func deselect(animated: Bool = true) {
        guard _isSelected else {
            return
        }
        _isSelected = false
        guard animated, let deselectAnimation = deselectAnimation else {
                tabLabel.isHidden = true
                tabImage.isHidden = false
                dotView.isHidden = true
                return
        }
        tabImage.isHidden = false
        deselectAnimation.playAnimation(forTabBarItem: self) {[weak self] in
            if !(self?._isSelected ?? true) {
                self?.tabLabel.isHidden = true
                self?.dotView.isHidden = true
            }
        }
    }

}
