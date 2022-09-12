//
//  Section1CollectionViewCell.swift
//  BankApp
//
//  Created by Bora Erdem on 12.09.2022.
//

import UIKit

final class HomeSection1CollectionViewCell: UICollectionViewCell {
    
    static let identifier = "Section1CollectionViewCell"
    
    //MARK: UI
    private lazy var image: UIImageView = {
       let img = UIImageView()
        img.backgroundColor = .black
        img.layer.cornerRadius = 45/2
        return img
    }()
    
    private lazy var title: UILabel = {
       let lbl = UILabel()
        lbl.text =  "Test"
        lbl.font = .systemFont(ofSize: 16)
        lbl.textColor = UIColor(named: "Black")
        return lbl
    }()
    
    private lazy var desc: UILabel = {
       let lbl = UILabel()
        lbl.text =  "Description"
        lbl.font = .systemFont(ofSize: 12)
        lbl.textColor = UIColor(named: "Grey")
        return lbl
    }()
    
    private lazy var amount: UILabel = {
       let lbl = UILabel()
        lbl.text =  "+180.65"
        lbl.font = .systemFont(ofSize: 16)
        lbl.textColor = UIColor.green

        return lbl
    }()
    
    private lazy var currency: UILabel = {
       let lbl = UILabel()
        lbl.text =  "USD"
        lbl.font = .systemFont(ofSize: 12)
        lbl.textColor = UIColor(named: "Grey")

        return lbl
    }()
    
    private lazy var divider: UIView = {
       let div = UIView()
        div.backgroundColor = UIColor(named: "Grey")
        return div
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func makeConstraints(){
        
        image.snp.makeConstraints { make in
            make.width.height.equalTo(45)
        }
        
        let textStack = UIStackView(arrangedSubviews: [title,desc])
        textStack.axis = .vertical
        
        textStack.spacing = 0
        
        
        let rightStack = UIStackView(arrangedSubviews: [amount,currency])
        rightStack.axis = .horizontal
        rightStack.alignment = .bottom
        rightStack.spacing = 4
        
        let leftStack = UIStackView(arrangedSubviews: [image,textStack])
        leftStack.axis = .horizontal
        leftStack.alignment = .center
        leftStack.spacing = 12
        
        let stack = UIStackView(arrangedSubviews: [leftStack,rightStack])
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .equalSpacing
        
        
        addSubview(stack)
        addSubview(divider)
        
        stack.snp.makeConstraints { make in
            make.height.equalTo(45)
            make.right.equalToSuperview().offset(-20)
            make.left.equalToSuperview().offset(20)
            make.centerY.equalToSuperview()
        }
        
        divider.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.bottom.equalToSuperview()
            make.height.equalTo(0.4)
        }
        
        
    }
    
    
}
