//
//  Cell.swift
//  OmgTT
//
//  Created by Александр Кузьминов on 2.03.24.
//

import UIKit
import SnapKit

final class Cell: UICollectionViewCell {
    private var isEnlarged: Bool = false {
        didSet {
            if isEnlarged {
                enlargeCell()
            } else {
                resetCellSize()
            }
        }
    }
    
    lazy var labelNum: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .clear
        return label
    }()
    
    lazy var buttonTap: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(toggleSize), for: .touchDown)
        button.backgroundColor = .clear
        
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        labelNum.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        buttonTap.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func setupUI() {
        backgroundColor = .white
        layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        layer.borderWidth = 1
        addSubview(labelNum)
        addSubview(buttonTap)
    }
    func setupData(num: Int) {
        labelNum.text = "\(num)"
        setCorner(corner: num)
    }
    private func setCorner(corner: Int) {
        self.layer.cornerRadius = CGFloat(corner)
    }
    @objc func toggleSize() {
        isEnlarged.toggle()
    }
    
    private func enlargeCell() {
        print("tap")
        UIView.animate(withDuration: 0.2) {
            self.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        }
    }
    
    private func resetCellSize() {
        print("rel")
        UIView.animate(withDuration: 0.2) {
            self.transform = CGAffineTransform.identity
        }
    }
    
}
