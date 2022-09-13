//
//  ExpensesSection1CollectionViewCell.swift
//  BankApp
//
//  Created by Bora Erdem on 12.09.2022.
//

import UIKit
import Charts

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
    
    let chart = PieChartView()
    
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
    
    var entries: [ChartDataEntry] = []
    
    //private lazy var chart: UIView = chartView()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        makeConstraints()
        makeCharts(received: entries, totalExpense: "$3243443")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func makeFlowLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        return layout
    }
    
    func makeCharts(received: [ChartDataEntry], totalExpense: String){
        entries = received
        let dataSet = PieChartDataSet(entries: entries, label: "")
        dataSet.colors = ChartColorTemplates.colorful()
        chart.data = PieChartData(dataSet: dataSet)
        amount.text = totalExpense
        chart.snp.makeConstraints { make in
            make.width.height.equalTo(250)
        }
    }
    
    func configure(){
        
    }
    
    func makeConstraints(){
       
        
        let cell0LeftStack = UIStackView(arrangedSubviews: [totalEx,amount])
        cell0LeftStack.axis = .vertical
        
        let cell1 = UIStackView(arrangedSubviews: [cell0LeftStack, calBtn])
        cell1.axis = .horizontal
        cell1.alignment = .center
        cell1.distribution = .equalSpacing
        
        
        
        
        let cell2 = UIStackView(arrangedSubviews: [chart])
        cell2.axis = .horizontal
        cell2.distribution = .equalSpacing
        
        let stack = UIStackView(arrangedSubviews: [cell1,chart])
        stack.axis = .vertical
        stack.distribution = .equalSpacing
        stack.alignment = .fill

        addSubview(stack)
        stack.snp.makeConstraints { make in
            make.left.top.right.equalToSuperview()
            make.height.equalTo(300)
        }
        

        
    }
    
}


