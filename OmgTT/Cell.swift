//
//  Cell.swift
//  OmgTT
//
//  Created by Александр Кузьминов on 2.03.24.
//

import UIKit

class Cell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupLayout()
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLayout() {
        
    }
    
    func setupUI() {
        backgroundColor = .blue
    }
}
