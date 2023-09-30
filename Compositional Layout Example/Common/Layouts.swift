//
//  Layouts.swift
//  iOS Assignment
//
//  Created by Raju Kumar on 07/09/23.
//

import Foundation
import UIKit

class Layouts {
    static let shared = Layouts()
    
    private init() {
        
    }
    
    func offerBannerSection()-> NSCollectionLayoutSection {
        //item
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        //group
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.8), heightDimension: .fractionalWidth(0.4))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        
        //section
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0)
        section.orthogonalScrollingBehavior = .groupPagingCentered
        
        //      animation and scrollOffest
        section.visibleItemsInvalidationHandler = { (items, offset, environment) in
            items.forEach { item in
                let distanceFromCenter = abs((item.frame.midX - offset.x) - environment.container.contentSize.width / 2.0)
                let minScale: CGFloat = 0.9
                let maxScale: CGFloat = 1.0
                let scale = max(maxScale - (distanceFromCenter / environment.container.contentSize.width), minScale)
                item.transform = CGAffineTransform(scaleX: scale, y: scale)
            }
        }
        return section
    }
    
    func categoryListLayout() -> NSCollectionLayoutSection {
        //item
        let item_size = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.2), heightDimension: .absolute(85))
        let item = NSCollectionLayoutItem(layoutSize: item_size)
        
        //Group
        let group_size = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(85.0))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: group_size, subitems: [item])
        
        //spacing between cells
//        group.interItemSpacing = .fixed(20)
        
        //Section
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 0, bottom: 20, trailing: 0)
        section.orthogonalScrollingBehavior = .continuous
        
       
        
        return section
    }
    
    func storeListLayout() -> NSCollectionLayoutSection {
        //item
        let item_size = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.3), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: item_size)

        //Group
        let group_size = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(0.35))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: group_size, subitems: [item])

        //spacing between cells
        group.interItemSpacing = .fixed(10)

        //Section
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 0, bottom: 20, trailing: 0)
        section.boundarySupplementaryItems = [.init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.09)), elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)]
        section.boundarySupplementaryItems.first?.pinToVisibleBounds = true
        return section
    }
    
   

}
