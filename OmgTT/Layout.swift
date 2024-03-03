//
//  Layout.swift
//  OmgTT
//
//  Created by Александр Кузьминов on 2.03.24.
//
import UIKit
import Foundation

class Layout {
    
    var width:CGFloat?
    
    init(width:CGFloat) {
        self.width = width
    }
    
    lazy var layout: UICollectionViewCompositionalLayout = {
        UICollectionViewCompositionalLayout { (section,enviroment) -> NSCollectionLayoutSection? in
            
            let itemsize = NSCollectionLayoutSize(widthDimension: .absolute(55),
                                                  heightDimension: .absolute(55))
            let item = NSCollectionLayoutItem(layoutSize: itemsize)
            let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(55 * 10 + 32 + 5*10),
                                                   heightDimension: .absolute(55))
            item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 0)
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, repeatingSubitem: item, count: 10)
            let section = NSCollectionLayoutSection(group: group)
            section.contentInsets = NSDirectionalEdgeInsets(top: 16, leading: 16, bottom: 16, trailing: -16)
            section.orthogonalScrollingBehavior = .continuous
            return section
        }
    }()
    
    
}
