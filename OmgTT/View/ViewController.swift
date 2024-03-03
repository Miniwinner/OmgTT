//
//  ViewController.swift
//  OmgTT
//
//  Created by Александр Кузьминов on 2.03.24.
//
import SnapKit
import UIKit

final class ViewController: UIViewController {
    private lazy var random: Int = {
           Int.random(in: 100...200)
       }()
    private lazy var vm = ViewModel(numberOfSections: self.random)
    private var index: IndexPath?
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
    
    private func reloadNums() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.vm.reloadRandomNumber()
            if self.index == nil {
                self.mainCollection.reloadData()}
            else {
                self.reloadIndex()
            }
            self.reloadIndex()
            self.reloadNums()
        }
    }
   
    private func reloadIndex() {
        var indexReload = mainCollection.indexPathsForVisibleItems
        indexReload.removeAll(where: { $0 == index})
        mainCollection.reloadItems(at: indexReload)
    }
    
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return random
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return vm.numberOfItems(inSection: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = mainCollection.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! Cell
        cell.setupData(num: vm.item(for: indexPath))
        cell.callBack = { [weak self] in
            guard let self = self else { return }
            index = indexPath
        }
        cell.callBackSwitch = { [weak self] in
            self?.index = nil
        }
        return cell
    }
}


