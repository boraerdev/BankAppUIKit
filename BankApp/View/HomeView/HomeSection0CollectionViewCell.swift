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
    private lazy var imageView: UIImageView = {
       let img = UIImageView()
        img.image = UIImage(named: "Frame")
        img.contentMode = .scaleAspectFit
        img.clipsToBounds = true
        img.layer.masksToBounds = true
        return img
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .init(named: "Blue")
        layer.cornerRadius = 8
        createConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createConstraints(){
        addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.right.left.bottom.top.equalToSuperview()
        }
    }
    
    
    
    
}
