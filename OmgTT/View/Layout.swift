//
//  Layout.swift
//  OmgTT
//
//  Created by Александр Кузьминов on 2.03.24.
//
import UIKit
import Foundation

final class Layout {
    private var count: Int
    private let commonWidth: CGFloat = 60
    init(width:CGFloat, count: Int) {
        self.count = count
    }
    
    lazy var layout: UICollectionViewCompositionalLayout = {
        UICollectionViewCompositionalLayout { (section,enviroment) -> NSCollectionLayoutSection? in
            let itemsize = NSCollectionLayoutSize(widthDimension: .absolute(self.commonWidth),
                                                  heightDimension: .absolute(self.commonWidth))
            let item = NSCollectionLayoutItem(layoutSize: itemsize)
            let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(CGFloat(Int(self.commonWidth) * self.count + self.count * 10)),
                                                   heightDimension: .absolute(self.commonWidth))
            item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, repeatingSubitem: item, count: self.count)
            group.interItemSpacing = NSCollectionLayoutSpacing.fixed(10)
            let section = NSCollectionLayoutSection(group: group)
            section.contentInsets = NSDirectionalEdgeInsets(top: 16, leading: 16, bottom: 0, trailing: 6)
            section.orthogonalScrollingBehavior = .continuous
            return section
        }
    }()
}
