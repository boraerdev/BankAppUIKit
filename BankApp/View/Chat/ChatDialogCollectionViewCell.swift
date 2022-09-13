//
//  Section1CollectionViewCell.swift
//  BankApp
//
//  Created by Bora Erdem on 12.09.2022.
//

import UIKit



final class ChatDialogCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "ChatDialogCollectionViewCell"
    
    
    
    //MARK: UI
    private lazy var image: UIImageView = {
       let img = UIImageView()
        img.backgroundColor = .white
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
    
    private lazy var badgeCircle: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.backgroundColor = .init(named: "Blue")
        return view
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
    
    func configure(item: ChatModel){
        image.image = .init(named: item.image)
        title.text = item.authorName
        desc.text = item.message
    }
    
    
    
    func makeConstraints(){
        
        image.snp.makeConstraints { make in
            make.width.height.equalTo(45)
        }
        
        let textStack = UIStackView(arrangedSubviews: [title,desc])
        textStack.axis = .vertical
        
        textStack.spacing = 0
        
        badgeCircle.snp.makeConstraints { make in
            make.width.height.equalTo(20)
        }
        
        let rightStack = UIStackView(arrangedSubviews: [badgeCircle])
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
