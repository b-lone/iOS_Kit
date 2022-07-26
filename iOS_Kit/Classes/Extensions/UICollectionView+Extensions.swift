//
//  UICollectionView+Extensions.swift
//
//
//  Created by 尤坤 on 2022/7/18.
//

import UIKit

public extension UICollectionView {
    func reloadLayout() {
        let layout = collectionViewLayout
        setCollectionViewLayout(UICollectionViewFlowLayout(), animated: false)
        layoutSubviews()
        setCollectionViewLayout(layout, animated: false)
    }
}
