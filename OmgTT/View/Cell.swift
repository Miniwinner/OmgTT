//
//  Cell.swift
//  OmgTT
//
//  Created by Александр Кузьминов on 2.03.24.
//

import UIKit
import SnapKit

final class Cell: UICollectionViewCell {
    
    var callBack: (() -> Void)?
    var callBackSwitch: (() -> Void)?
    lazy var labelNum: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .clear
        return label
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLongPressGesture()
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
    }
    
    private func setupUI() {
        backgroundColor = .white
        layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        layer.borderWidth = 1
        addSubview(labelNum)
    }
    
    func setupData(num: Int) {
        labelNum.text = "\(num)"
        setCorner(corner: num)
    }
    
    private func setCorner(corner: Int) {
        self.layer.cornerRadius = CGFloat(corner)
    }
    
    private func setupLongPressGesture() {
        let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress(_:)))
        self.addGestureRecognizer(longPressGesture)
    }
    @objc func handleLongPress(_ gestureRecognizer: UILongPressGestureRecognizer) {
        switch gestureRecognizer.state {
        case .began:
            self.callBack?()
            UIView.animate(withDuration: 0.2) {
                self.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
            }
        case .ended, .cancelled:
            callBackSwitch?()
            UIView.animate(withDuration: 0.2) {
                self.transform = CGAffineTransform.identity
            }
        default:
            break
        }
    }
    
}
