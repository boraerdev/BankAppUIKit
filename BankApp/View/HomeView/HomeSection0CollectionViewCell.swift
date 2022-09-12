//
//  Section0CollectionViewCell.swift
//  BankApp
//
//  Created by Bora Erdem on 12.09.2022.
//

import UIKit
import SnapKit

final class HomeSection0CollectionViewCell: UICollectionViewCell {
    
    static let identifier = "Section0CollectionViewCell"
    
    //MARK: UI
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .init(named: "Blue")
        layer.cornerRadius = 8
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
}
