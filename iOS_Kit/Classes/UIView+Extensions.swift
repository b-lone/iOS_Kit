//
//  UIView+Extensions.swift
//  
//
//  Created by 尤坤 on 2022/7/25.
//

import UIKit

public typealias EdgeConstraints = (top: NSLayoutConstraint, bottom: NSLayoutConstraint, leading: NSLayoutConstraint, trailing: NSLayoutConstraint)

public extension UIView {
    @discardableResult func addSubviewAndFill(_ subView: UIView) -> EdgeConstraints {
        addSubview(subView)
        subView.translatesAutoresizingMaskIntoConstraints = false
        let topConstraint = subView.topAnchor.constraint(equalTo: topAnchor)
        topConstraint.isActive = true
        let bottomConstraint = subView.bottomAnchor.constraint(equalTo: bottomAnchor)
        bottomConstraint.isActive = true
        let leadingConstraint = subView.leadingAnchor.constraint(equalTo: leadingAnchor)
        leadingConstraint.isActive = true
        let trailingConstraint = subView.trailingAnchor.constraint(equalTo: trailingAnchor)
        trailingConstraint.isActive = true
        return (topConstraint, bottomConstraint, leadingConstraint, trailingConstraint)
    }
}
