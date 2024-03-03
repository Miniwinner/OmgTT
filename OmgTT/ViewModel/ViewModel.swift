//
//  ViewModel.swift
//  OmgTT
//
//  Created by Александр Кузьминов on 3.03.24.
//

import Foundation

final class ViewModel: ViewModelProtocol {
    
    private var sectionData: [[Int]] = []
    
    init(numberOfSections: Int) {
        generateData(numberOfSections: numberOfSections)
    }
    
    private func generateData(numberOfSections: Int) {
        sectionData = (0..<numberOfSections).map { _ in
            let count = Int.random(in: 11...20)
            return (0..<count).map { _ in
                return Int.random(in: 16...30)
            }
        }
    }
    
    func reload(withNumberOfSections numberOfSections: Int) {
        generateData(numberOfSections: numberOfSections)
    }
    
    func numberOfItems(inSection section: Int) -> Int {
        return sectionData[section].count
    }
    
    func item(for indexPath: IndexPath) -> Int {
        return sectionData[indexPath.section][indexPath.item]
    }
    
    func reloadRandomNumber() {
        for sectionIndex in 0..<sectionData.count {
            let section = sectionData[sectionIndex]
            let randomItem = Int.random(in: 0..<section.count)
            let newValue = Int.random(in: 11...20)
            sectionData[sectionIndex][randomItem] = newValue
        }
    }

}

