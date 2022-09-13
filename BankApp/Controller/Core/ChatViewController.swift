//
//  ChatViewController.swift
//  BankApp
//
//  Created by Bora Erdem on 12.09.2022.
//

import UIKit

struct ActionModel{
    var image: String
    var title: String
}

class ChatViewController: UIViewController {
    
    let chats : [ChatModel] = [
    ChatModel(authorName: "Arlene McCoy", message: "Can u come over tonight?", image: "chat1"),
    ChatModel(authorName: "Albert Flores", message: "That was awesome!", image: "chat2"),
    ChatModel(authorName: "Savannah Nguyen", message: "Can u send me 300$?", image: "chat3"),
    ]
    
    let actions: [ActionModel] = [
    ActionModel(image: "headphones", title: "Ask For Help"),
    ActionModel(image: "dollarsign", title: "Want Money"),
    ActionModel(image: "plus", title: "New Dialog"),
    ]
    
    //MARK: UI
    private lazy var searchBar: UISearchBar = {
       let sb = UISearchBar()
        sb.placeholder = "Search..."
        sb.searchBarStyle = .minimal
        return sb
    }()
    
    private lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewCompositionalLayout(sectionProvider: { sectionIndex, _ -> NSCollectionLayoutSection in
        return ChatViewController.makeLayout(section: sectionIndex)
    }))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Chat"
        makeConstraints()
        prepareCollectionView()
    }
    
    func prepareCollectionView(){
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(ActionsCollectionViewCell.self, forCellWithReuseIdentifier: ActionsCollectionViewCell.identifier)
        collectionView.register(ChatCollectionViewHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: ChatCollectionViewHeader.identifier)
        collectionView.register(ChatDialogCollectionViewCell.self, forCellWithReuseIdentifier: ChatDialogCollectionViewCell.identifier)
    }
    
    static func makeLayout(section: Int) -> NSCollectionLayoutSection {
        switch section{
        case 0:
            
            let item = NSCollectionLayoutItem(
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .fractionalHeight(1)))
            
            let group = NSCollectionLayoutGroup.horizontal(
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .absolute(120),
                    heightDimension: .absolute(100)),
                subitem: item,
                count: 1)
            
            let section = NSCollectionLayoutSection(group: group)
            
            
            //SectionHeader
            let headerSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .absolute(50))
            
            let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
            section.boundarySupplementaryItems = [header]
            
            section.orthogonalScrollingBehavior = .continuous
            section.interGroupSpacing = 16
            section.contentInsets = .init(top: 0, leading: 20, bottom: 0, trailing: 20)
            return section
            
            
            
        case 1:
            
            let item = NSCollectionLayoutItem(
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .fractionalHeight(1)))
            
            let group = NSCollectionLayoutGroup.horizontal(
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .estimated(70)),
                subitem: item,
                count: 1)
            
            let section = NSCollectionLayoutSection(group: group)
            
            //SectionHeader
            let headerSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .absolute(50))
            
            let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
            header.contentInsets = .init(top: 0, leading: 20, bottom: 0, trailing: 20)
            
            section.boundarySupplementaryItems = [header]
            section.interGroupSpacing = 2
            return section
            
            
            
        default:
            
            let item = NSCollectionLayoutItem(
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .fractionalHeight(1)))
            
            let group = NSCollectionLayoutGroup.horizontal(
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .estimated(120),
                    heightDimension: .estimated(100)),
                subitem: item,
                count: 1)
            
            let section = NSCollectionLayoutSection(group: group)
            section.orthogonalScrollingBehavior = .continuous
            return section
        }
    }
    
    private func makeConstraints(){
        view.addSubview(searchBar)
        searchBar.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
        }
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.left.right.bottom.equalToSuperview()
            make.top.equalTo(searchBar.snp.bottom)
        }
    }
}

extension ChatViewController: UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section{
        case 0:
            return actions.count
        case 1:
            return chats.count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let section = indexPath.section
        switch section {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ActionsCollectionViewCell.identifier, for: indexPath) as! ActionsCollectionViewCell
            cell.configure(item: actions[indexPath.row])
            return cell
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ChatDialogCollectionViewCell.identifier, for: indexPath) as! ChatDialogCollectionViewCell
            cell.configure(item: chats[indexPath.row])
            return cell
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ActionsCollectionViewCell.identifier, for: indexPath) as! ActionsCollectionViewCell
            return cell
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        2
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let titles = ["Actions","Dialogs"]
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: ChatCollectionViewHeader.identifier, for: indexPath) as! ChatCollectionViewHeader
        header.configure(section: indexPath.section, title: titles[indexPath.section])
        return header
    }
}


