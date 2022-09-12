//
//  ExpensesSection1CollectionViewCell.swift
//  BankApp
//
//  Created by Bora Erdem on 12.09.2022.
//

import UIKit

final class ExpensesSection1CollectionViewCell: UICollectionViewCell {
    static let identifier = "ExpensesSection1CollectionViewCell"
    
    let titles: [String] = ["Travel","Food","Transfers","Other"]
    
    //MARK: UI
    private lazy var totalEx: UILabel = {
       let lbl = UILabel()
        lbl.text = "Total expenses"
        lbl.font = .systemFont(ofSize: 12, weight: .regular)
        lbl.textColor = .init(named: "Grey")
        return lbl
    }()
    
    private lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: makeFlowLayout())
    
    private lazy var amount: UILabel = {
       let lbl = UILabel()
        lbl.text = "$3243443"
        lbl.font = .systemFont(ofSize: 20, weight: .black)
        lbl.textColor = .init(named: "Black")
        return lbl
    }()
    
    private lazy var calBtn: UIButton = {
        let btn = UIButton()
        let config = UIImage.SymbolConfiguration(pointSize: 25)
        btn.setImage(UIImage(
            systemName: "calendar",
            withConfiguration: config),
                     for: .normal)
        btn.tintColor = UIColor(named: "Grey")
        return btn
    }()
    
    private lazy var chart: UIView = chartView()
    
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        makeConstraints()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(pliceCell.self, forCellWithReuseIdentifier: pliceCell.identifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func makeFlowLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        return layout
    }
    
    func makeConstraints(){
        chart.snp.makeConstraints { make in
            make.width.equalTo(170)
            make.height.equalTo(170)
        }
        
        let cell0LeftStack = UIStackView(arrangedSubviews: [totalEx,amount])
        cell0LeftStack.axis = .vertical
        
        let cell1 = UIStackView(arrangedSubviews: [cell0LeftStack, calBtn])
        cell1.axis = .horizontal
        cell1.alignment = .center
        cell1.distribution = .equalSpacing
        
        
        
        
        let cell2 = UIStackView(arrangedSubviews: [chart])
        cell2.axis = .horizontal
        cell2.distribution = .equalSpacing
        
        let stack = UIStackView(arrangedSubviews: [cell1,cell2])
        stack.axis = .vertical
        stack.distribution = .equalSpacing
        stack.alignment = .fill

        addSubview(stack)
        stack.snp.makeConstraints { make in
            make.left.top.right.equalToSuperview()
            make.height.equalTo(230)
        }
        
        addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.right.left.bottom.equalToSuperview()
            make.height.equalTo(20)
        }
        
    }
    
}

extension ExpensesSection1CollectionViewCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        titles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: pliceCell.identifier, for: indexPath) as! pliceCell
        cell.configure(title: titles[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: frame.width/CGFloat(titles.count), height: 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        0
    }
    
    
    
}

final class pliceCell: UICollectionViewCell {
    static let identifier = "pliceCell"
    
    private lazy var label: UILabel = {
       let lbl = UILabel()
        lbl.text = "Test"
        lbl.textColor = .label
        lbl.font = .systemFont(ofSize: 12)
        return lbl
    }()
    
    private lazy var circle: UIView = {
        let view = UIView()
        view.backgroundColor = .systemRed
        view.layer.cornerRadius = 4
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func makeConstraints(){
      
        circle.snp.makeConstraints { make in
            make.width.height.equalTo(8)
        }
        
        let stack = UIStackView(arrangedSubviews: [circle,label])
        stack.axis = .horizontal
        stack.spacing = 4
        stack.alignment = .center
        stack.distribution = .fillProportionally
        addSubview(stack)
        stack.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
    
    func configure(title:String){
        self.label.text = title
    }
    
}

final class chartView: UIView {
    
    private lazy var circle: UIView = {
       let view = UIView()
        view.backgroundColor = .red
        view.layer.cornerRadius = 170/2
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func makeConstraints(){
        addSubview(circle)
        circle.snp.makeConstraints { make in
            make.width.height.equalTo(170)
            make.center.equalToSuperview()
        }
    }
    
    
}


