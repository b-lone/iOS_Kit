//
//  CollectionViewTestViewController.swift
//  iOS_Kit_Example
//
//  Created by 尤坤 on 2022/7/25.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import UIKit
import iOS_Kit

class CollectionViewTestViewController: UIViewController {
    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "UICollectionViewCell")
        collectionView.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "UICollectionReusableView")
        collectionView.showsVerticalScrollIndicator = false
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubviewAndFill(collectionView)
    }
    
    private func createLayout() -> UICollectionViewLayout {
        return UICollectionViewCompositionalLayout { section, environment in
            let containerSize = environment.container.effectiveContentSize
            let headerHeight = 40.0
            if section == 0 {
                let itemWidth = 50.0
                let itemHeight = 50.0
                
                let layoutSize = NSCollectionLayoutSize(widthDimension: .absolute(itemWidth), heightDimension: .absolute(itemHeight))
                let layoutItem = NSCollectionLayoutItem(layoutSize: layoutSize)
                layoutItem.contentInsets = .zero
                
                let groupSize = NSCollectionLayoutSize (widthDimension: .absolute(50), heightDimension: .absolute(50))
                let layoutGroup = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [layoutItem])
                
                let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
                
                let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(headerHeight))
                let sectionHeaderItem = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind:UICollectionElementKindSectionHeader, alignment: .top)
                layoutSection.boundarySupplementaryItems = [ sectionHeaderItem ]
                
                layoutSection.orthogonalScrollingBehavior = .continuous
                
                return layoutSection
            } else {
                let itemWidth = 120.0
                let itemHeight = 120.0
                let minimumInterItemSpacing = 2.0
                let minimumLineSpacing = 2.0
                let countPerRow = Int(containerSize.width) / Int(itemWidth + minimumInterItemSpacing * 2)
                let interItemSpacing = (containerSize.width - itemWidth * CGFloat(countPerRow)) / CGFloat(countPerRow) / 2
                
                let itemSize = NSCollectionLayoutSize(widthDimension: .absolute(itemWidth), heightDimension: .absolute(itemHeight))
                let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
                layoutItem.contentInsets = .init(top: minimumLineSpacing, leading: interItemSpacing, bottom: minimumLineSpacing, trailing: interItemSpacing)
                
                let groupSize = NSCollectionLayoutSize (widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(itemHeight))
                let layoutGroup = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: layoutItem, count: countPerRow)
                
                let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
                
                let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(headerHeight))
                let sectionHeaderItem = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind:UICollectionElementKindSectionHeader, alignment: .top)
                layoutSection.boundarySupplementaryItems = [ sectionHeaderItem ]
                
                return layoutSection
            }
        }
    }
}

extension CollectionViewTestViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView .dequeueReusableCell(withReuseIdentifier: "UICollectionViewCell", for: indexPath)
        cell.removeAllSubviews()
        
        cell.backgroundColor = .random
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let view = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "UICollectionReusableView", for: indexPath)
        view.backgroundColor = .random
        return view
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 20
        } else {
            return 100
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
}

extension CollectionViewTestViewController: UICollectionViewDelegate {
    
}
