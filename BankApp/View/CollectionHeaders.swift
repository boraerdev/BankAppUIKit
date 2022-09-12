//
//  HomeCollectionHeaders.swift
//  BankApp
//
//  Created by Bora Erdem on 12.09.2022.
//

import Foundation
import UIKit
import SnapKit


//MARK: CollectionView Headers

//Home CollectionView Section0 Header
final class section0Header: UICollectionReusableView {
    
    static let identifier = "section0Header"
    
    private lazy var balanceTitle: UILabel = {
        let lbl = UILabel()
        lbl.text = "Balance"
        lbl.font = .systemFont(ofSize: 16, weight: .regular)
        lbl.textColor = UIColor(named: "Grey")
        return lbl
    }()
    
    private lazy var balanceCount: UILabel = {
        let lbl = UILabel()
        lbl.text = "24023.65"
        lbl.font = .systemFont(ofSize: 32, weight: .black)
        lbl.textColor = UIColor(named: "Black")
        return lbl
    }()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func makeConstraints(){
        let balanceStack = UIStackView(arrangedSubviews: [balanceTitle,balanceCount])
        balanceStack.axis = .vertical
        
        addSubview(balanceStack)
        balanceStack.snp.makeConstraints { make in
            make.centerY.left.equalToSuperview()
        }
        
    }
    
    func configure(title: String, desc: String){
        self.balanceTitle.text = title
        self.balanceCount.text = desc
    }
    
    
}


//Home CollectionView Section1 Header
final class section1Header: UICollectionReusableView {
    
    static let identifier = "section1Header"
    
    private lazy var hdtitle: UILabel = {
        let lbl = UILabel()
        lbl.text = "Transactions"
        lbl.font = .systemFont(ofSize: 24, weight: .bold)
        lbl.textColor = UIColor(named: "Black")
        return lbl
    }()
    
    private lazy var filterBtn: UIButton = {
        let btn = UIButton()
        let config = UIImage.SymbolConfiguration(pointSize: 25)
        btn.setImage(UIImage(
            systemName: "line.3.horizontal.decrease",
            withConfiguration: config),
                     for: .normal)
        btn.tintColor = UIColor(named: "Grey")
        return btn
    }()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func makeConstraints(){
        let balanceStack = UIStackView(arrangedSubviews: [hdtitle,filterBtn])
        balanceStack.axis = .horizontal
        balanceStack.distribution = .fill
        addSubview(balanceStack)
        balanceStack.snp.makeConstraints { make in
            make.centerY.left.right.equalToSuperview()
        }
        
    }
    
    
}


//Expenses CollectionView Section1 Header
final class expensesSection1Header: UICollectionReusableView {
    
    static let identifier = "expensesSection1Header"
    
    private var segmentedControl: UISegmentedControl = {
       let sc = UISegmentedControl(items: ["Week", "Month","Year"])
        sc.selectedSegmentIndex = 0
        let titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        UISegmentedControl.appearance().setTitleTextAttributes(titleTextAttributes, for: .selected)
        sc.selectedSegmentTintColor = UIColor(named: "Blue")
        
        return sc
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func makeConstraints(){
        addSubview(segmentedControl)
        segmentedControl.snp.makeConstraints { make in
            make.centerY.left.right.equalToSuperview()
            
        }
    }
    
}
