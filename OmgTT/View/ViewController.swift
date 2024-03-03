//
//  ViewController.swift
//  OmgTT
//
//  Created by Александр Кузьминов on 2.03.24.
//
import SnapKit
import UIKit

final class ViewController: UIViewController {
    private let vm = ViewModel(numberOfSections: 10)
    
    lazy var mainCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.backgroundColor = .lightGray
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.alwaysBounceVertical = false
        collection.alwaysBounceHorizontal = false
        return collection
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupLayout()
        reloadNums()
    }
    
    private func reloadNums() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.vm.reloadRandomNumber()
            self.mainCollection.reloadData()
            self.reloadNums()
        }
    }
    
    private func setupUI() {
        view.backgroundColor = .black
        
        mainCollection.delegate = self
        mainCollection.dataSource = self
        mainCollection.register(Cell.self, forCellWithReuseIdentifier: "cell")
        let layout = Layout(width: view.frame.size.width,count: vm.numberOfItems(inSection: 0))
        
        mainCollection.collectionViewLayout = layout.layout
        
        view.addSubview(mainCollection)
    }
    
    private func setupLayout() {
        mainCollection.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return vm.numberOfItems(inSection: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = mainCollection.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! Cell
        cell.setupData(num: vm.item(for: indexPath))
        return cell
    }
}


