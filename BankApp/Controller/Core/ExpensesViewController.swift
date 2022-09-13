//
//  ExpensesViewController.swift
//  BankApp
//
//  Created by Bora Erdem on 12.09.2022.
//

import UIKit
import SnapKit
import Charts

final class ExpensesViewController: UIViewController {
    
    //MARK: UI
    private lazy var collectionView: UICollectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: UICollectionViewCompositionalLayout{ sectionIndex, _ -> NSCollectionLayoutSection? in
            return ExpensesViewController.createSEctionLayout(section: sectionIndex)
    })
    
    var entriesData = [
        PieChartDataEntry(value: 2, label: "Travel"),
        PieChartDataEntry(value: 4, label: "Food"),
        PieChartDataEntry(value: 21, label: "Transfers"),
        PieChartDataEntry(value: 5, label: "Others"),
    ]
    
    var totalExpenses: String = "$345987324"

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        title = "Expenses"
        collectionView.delegate = self
        collectionView.dataSource = self
        makeConstraints()
        collectionViewOps()
        collectionView.isScrollEnabled = false
    }
    
    func collectionViewOps(){
        collectionView.register(HomeSection0CollectionViewCell.self, forCellWithReuseIdentifier: HomeSection0CollectionViewCell.identifier)
        collectionView.register(ExpensesSection1CollectionViewCell.self, forCellWithReuseIdentifier: ExpensesSection1CollectionViewCell.identifier)
        collectionView.register(section0Header.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: section0Header.identifier)
        collectionView.register(expensesSection1Header.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: expensesSection1Header.identifier)
        
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
            section.contentInsets = .init(top: 25, leading: 20, bottom: 10, trailing: 20)
            return section
            
            
        case 1:
            let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .fractionalHeight(1.0)))
            
            //Group
            let group = NSCollectionLayoutGroup.horizontal(
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .estimated(300)),
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
            section.contentInsets = .init(top: 10, leading: 20, bottom: 20, trailing: 20)
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
    
    func makeConstraints(){
        view.addSubview(collectionView)
        collectionView.frame = view.bounds
    }
    

}

extension ExpensesViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section{
        case 0:
            return 10
        case 1:
            return 1
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let  section = indexPath.section
        switch section {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeSection0CollectionViewCell.identifier, for: indexPath) as! HomeSection0CollectionViewCell
            return cell
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ExpensesSection1CollectionViewCell.identifier, for: indexPath) as! ExpensesSection1CollectionViewCell
            cell.makeCharts(received: entriesData, totalExpense: totalExpenses)
            return cell
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeSection0CollectionViewCell.identifier, for: indexPath) as! HomeSection0CollectionViewCell
            return cell
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        2
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let section = indexPath.section
        switch section{
        case 0:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: section0Header.identifier, for: indexPath) as! section0Header
            header.configure(title: "Total Income", desc: "2345235.65")
            return header
        case 1:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: expensesSection1Header.identifier, for: indexPath) as! expensesSection1Header
            header.delegate = self
            return header
        default:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: section0Header.identifier, for: indexPath) as! section0Header
            header.configure(title: "Total Income", desc: "$3287324.43")
            return header
        }
    }
    
    
}

extension ExpensesViewController: expensesSection1HeaderDelegate {
    func segmentChanged(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            entriesData = [
                PieChartDataEntry(value: 2, label: "Travel"),
                PieChartDataEntry(value: 4, label: "Food"),
                PieChartDataEntry(value: 21, label: "Transfers"),
                PieChartDataEntry(value: 5, label: "Others"),
            ]
            totalExpenses = "$345987324"
        case 1:
            entriesData = [
                PieChartDataEntry(value: 16, label: "Travel"),
                PieChartDataEntry(value: 40, label: "Food"),
                PieChartDataEntry(value: 1, label: "Transfers"),
                PieChartDataEntry(value: 65, label: "Others"),
            ]
            totalExpenses = "$39857938"

        case 2:
            entriesData = [
                PieChartDataEntry(value: 66, label: "Travel"),
                PieChartDataEntry(value: 35, label: "Food"),
                PieChartDataEntry(value: 31, label: "Transfers"),
                PieChartDataEntry(value: 1, label: "Others"),
            ]
            totalExpenses = "$12897456"

        default:
            print("NaN")
        }
        collectionView.reloadData()
    }
    
    
}
