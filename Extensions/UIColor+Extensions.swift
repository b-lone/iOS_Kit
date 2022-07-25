//
//  UIColor+Extensions.swift
//  iOS_Kit
//
//  Created by 尤坤 on 2022/7/25.
//

import UIKit

public extension UIColor {
    class var random: UIColor {
        return .init(
            red: (CGFloat(arc4random() % 256)) / 255.0,
            green: (CGFloat(arc4random() % 256)) / 255.0,
            blue: (CGFloat(arc4random() % 256)) / 255.0,
            alpha: 1.0
        )
    }
}
