//
//  ViewController.swift
//  OmgTT
//
//  Created by Александр Кузьминов on 2.03.24.
//

import UIKit

class ViewController: UIViewController {

    
    lazy var mainCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.backgroundColor = .cyan
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.alwaysBounceVertical = false
        collection.alwaysBounceHorizontal = false
        return collection
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupLayout()
    }

    func setupUI() {
        view.backgroundColor = .white
        
        mainCollection.delegate = self
        mainCollection.dataSource = self
        mainCollection.register(Cell.self, forCellWithReuseIdentifier: "cell")
        let layout = Layout(width: view.frame.size.width)

        mainCollection.collectionViewLayout = layout.layout
        
        view.addSubview(mainCollection)
    }

    func setupLayout() {
        mainCollection.topAnchor.constraint(equalTo: view.topAnchor, constant: 30).isActive = true
        mainCollection.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        mainCollection.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        mainCollection.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: -30).isActive = true
    }
    
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 100
    }
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = mainCollection.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! Cell
        
        return cell
    }
    
    
}
