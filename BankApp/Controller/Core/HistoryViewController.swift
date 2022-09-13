//
//  HistoryViewController.swift
//  BankApp
//
//  Created by Bora Erdem on 12.09.2022.
//

import UIKit
import SnapKit

final class HistoryViewController: UIViewController {
    
    let transactions : [TransactionsModel] = [
        TransactionsModel(amount: -453.23, title: "Steam", desc: "Gaming", image: "image1"),
        TransactionsModel(amount: 32.43, title: "Salary", desc: "Money Transfer", image: "image2"),
        TransactionsModel(amount: -156.93, title: "Josh S.", desc: "Money Transfer", image: "image3"),
        TransactionsModel(amount: 3.23, title: "QQ", desc: "Travel", image: "image4"),
    ]
    
    //MARK: UI
    private lazy var collencionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = .init(width: view.frame.width, height: 60)
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.delegate = self
        cv.dataSource = self
        cv.register(HomeSection1CollectionViewCell.self, forCellWithReuseIdentifier: HomeSection1CollectionViewCell.identifier)
        return cv
    }()
    
    
    //MARK: Core Funcs
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "History"
        makeConstraints()
    }
    
    private func makeConstraints(){
        view.addSubview(collencionView)
        collencionView.snp.makeConstraints { make in
            make.right.left.bottom.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
        }
    }
    
}

extension HistoryViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        transactions.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeSection1CollectionViewCell.identifier, for: indexPath) as! HomeSection1CollectionViewCell
        cell.configure(item: transactions[indexPath.row])
        return cell
    }
    
   
    
    
}
