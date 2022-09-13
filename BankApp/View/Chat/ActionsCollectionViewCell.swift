//
//  ActionsCollectionViewCell.swift
//  BankApp
//
//  Created by Bora Erdem on 13.09.2022.
//

import UIKit
import SnapKit

class ActionsCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "ActionsCollectionViewCell"
    
    //MARK: UI
    private lazy var titleLabel: UILabel = {
       let lbl = UILabel()
        lbl.text = "Ask for help"
        lbl.font = .systemFont(ofSize: 16, weight: .regular)
        return lbl
        
    }()
    
    private lazy var imgBtn: UIButton = {
       let btn = UIButton()
        btn.setImage(.init(systemName: "headphones"), for: .normal)
        btn.backgroundColor = .init(named: "Blue")
        btn.layer.cornerRadius = 36/2
        btn.tintColor = .init(named: "White")
        return btn
        
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .init(named: "White")
        layer.cornerRadius = 8
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(item: ActionModel){
        imgBtn.setImage(.init(systemName: item.image), for: .normal)
        imgBtn.tintColor = .init(named: "White")
        titleLabel.text = item.title
    }
    
    func makeConstraints(){
        addSubview(titleLabel)
        addSubview(imgBtn)
        
        imgBtn.snp.makeConstraints { make in
            make.left.equalTo(titleLabel)
            make.bottom.equalTo(titleLabel.snp.top).offset(-12)
            make.width.height.equalTo(36)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-12)
        }
    }
    
}
