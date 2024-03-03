//
//  VmProtocol.swift
//  OmgTT
//
//  Created by Александр Кузьминов on 3.03.24.
//

import Foundation

protocol ViewModelProtocol {
    init(numberOfSections: Int)
    func reload(withNumberOfSections numberOfSections: Int)
    func numberOfItems(inSection section: Int) -> Int
    func item(for indexPath: IndexPath) -> Int
    func reloadRandomNumber()
}
