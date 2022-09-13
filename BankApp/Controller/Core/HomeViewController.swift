//
//  HomeViewController.swift
//  BankApp
//
//  Created by Bora Erdem on 12.09.2022.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {
    
    let transactions : [TransactionsModel] = [
        TransactionsModel(amount: -453.23, title: "Steam", desc: "Gaming", image: "image1"),
        TransactionsModel(amount: 32.43, title: "Salary", desc: "Money Transfer", image: "image2"),
        TransactionsModel(amount: -156.93, title: "Josh S.", desc: "Money Transfer", image: "image3"),
        TransactionsModel(amount: 3.23, title: "QQ", desc: "Travel", image: "image4"),
    ]
    
    //MARK: UI
    private lazy var leftTitle: UILabel = {
        let lbl = UILabel()
        lbl.text = "Your Wallet"
        lbl.font = .systemFont(ofSize: 20, weight: .bold)
        lbl.textColor = .label
        return lbl
    }()
    
    private lazy var searchBar: UISearchBar = {
       let sb = UISearchBar()
        sb.placeholder = "Search..."
        sb.searchBarStyle = .minimal
        return sb
    }()
    
    private lazy var circleImage : UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .label
        btn.setImage(.init(named: "pp"), for: .normal)
        btn.clipsToBounds = true
        btn.layer.cornerRadius = 20
        return btn
    }()
    
    
    private lazy var collectionView: UICollectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: UICollectionViewCompositionalLayout{ sectionIndex, _ -> NSCollectionLayoutSection? in
            return HomeViewController.createSEctionLayout(section: sectionIndex)
    })
    
    
    //MARK: Core Funcs
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: leftTitle)
        collectionView.dataSource = self
        collectionView.delegate = self
        view.backgroundColor = .systemBackground
        collectionViewOps()
        makeConstraints()
        
           let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
          view.addGestureRecognizer(tap)
        
        
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func makeConstraints()  {
        view.addSubview(leftTitle)
        leftTitle.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
                .offset(28)
            make.left.equalTo(view.safeAreaLayoutGuide.snp.left)
                .offset(20)
            make.width.equalTo(200)
            make.height.equalTo(40)
        }
        
        view.addSubview(circleImage)
        circleImage.snp.makeConstraints { make in
            make.right.equalTo(view.safeAreaLayoutGuide.snp.right)
                .offset(-20)
            make.centerY.equalTo(leftTitle)
            make.width.height.equalTo(40)
        }
        
        view.addSubview(searchBar)
        searchBar.snp.makeConstraints { make in
            make.right.equalToSuperview()
                .offset(-10)
            make.left.equalToSuperview()
                .offset(10)
            make.top.equalTo(circleImage.snp.bottom)
                .offset(14)
        }
        
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.right.left.equalToSuperview()
            make.top.equalTo(searchBar.snp.bottom)
                .offset(10)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
        
        
    }
    
    func collectionViewOps(){
        collectionView.register(HomeSection0CollectionViewCell.self, forCellWithReuseIdentifier: HomeSection0CollectionViewCell.identifier)
        collectionView.register(HomeSection1CollectionViewCell.self, forCellWithReuseIdentifier: HomeSection1CollectionViewCell.identifier)
        collectionView.register(section0Header.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: section0Header.identifier)
        collectionView.register(section1Header.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: section1Header.identifier)
        
    }
    
    static func createSEctionLayout(section: Int) -> NSCollectionLayoutSection{
        //Item
        switch section{
        case 0:
            let item = NSCollectionLayoutItem(
                layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .fractionalHeight(1.0)))
            
            let group = NSCollectionLayoutGroup.horizontal(
                layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(0.7),
                heightDimension: .absolute(170)),
                
            subitem: item,
                count: 1
            )
            let lySize: NSCollectionLayoutSize = .init(
                widthDimension: .fractionalWidth(1),
                heightDimension: .absolute(50))
            
            let sup = NSCollectionLayoutBoundarySupplementaryItem(
                layoutSize: lySize,
                elementKind: UICollectionView.elementKindSectionHeader,
                alignment: .top)
            
            
            
            
            //Section
            let section = NSCollectionLayoutSection(group: group)
            section.orthogonalScrollingBehavior = .groupPaging
            section.interGroupSpacing = 20
            section.boundarySupplementaryItems = [sup]
            section.contentInsets = .init(top: 25, leading: 20, bottom: 20, trailing: 20)
            return section
            
            
        case 1:
            let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .fractionalHeight(1.0)))
            
            //Group
            let group = NSCollectionLayoutGroup.horizontal(
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .absolute(70)),
                subitem: item,
                count: 1
            )
            
            
            let lySize: NSCollectionLayoutSize = .init(
                widthDimension: .fractionalWidth(1),
                heightDimension: .absolute(50))
            
            let sup = NSCollectionLayoutBoundarySupplementaryItem(
                layoutSize: lySize,
                elementKind: UICollectionView.elementKindSectionHeader,
                alignment: .top)
            
            sup.contentInsets = .init(top: 0, leading: 20, bottom: 0, trailing: 20)
            
            
            //Section
            let section = NSCollectionLayoutSection(group: group)
            section.contentInsets = .init(top: 10, leading: 0, bottom: 0, trailing: 0)
            section.boundarySupplementaryItems = [sup]
            section.interGroupSpacing = 0
            return section
        
        default:
            let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .fractionalHeight(1.0)))
            
            //Group
            let group = NSCollectionLayoutGroup.horizontal(
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .absolute(70)),
                subitem: item,
                count: 1
            )
            
            //Section
            let section = NSCollectionLayoutSection(group: group)
            section.orthogonalScrollingBehavior = .continuous
            return section
        }
    }
    


}

extension HomeViewController : UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        transactions.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let section = indexPath.section
        switch section {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeSection0CollectionViewCell.identifier, for: indexPath)
            return cell
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeSection1CollectionViewCell.identifier, for: indexPath) as! HomeSection1CollectionViewCell
            cell.configure(item: transactions[indexPath.row])
            return cell
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeSection0CollectionViewCell.identifier, for: indexPath)
            return cell
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        2
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let section = indexPath.section
        switch section {
        case 0:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: section0Header.identifier, for: indexPath) as! section0Header
            header.configure(title: "Balance", desc: "456523.65")
            return header
        case 1:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: section1Header.identifier, for: indexPath) as! section1Header
            
            return header
        default:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: section0Header.identifier, for: indexPath) as! section0Header
            return header
        }
    }
    
    
}


