//
//  SettingsViewController.swift
//  BankApp
//
//  Created by Bora Erdem on 12.09.2022.
//

import UIKit
import SnapKit

struct ListItem{
    var title: String
    var image: String
    var handle: (()->Void)?
}

final class SettingsViewController: UIViewController {
    
    var data = [[ListItem]]()
    
    let mainSetting: [ListItem] = [
        ListItem(title: "Notification", image: "bell"),
        ListItem(title: "Security", image: "shield"),
        ListItem(title: "Privacy", image: "lock.shield"),
    ]
    
    let theme: [ListItem] = [
        ListItem(title: "Dark Theme", image: "moon"),
        ListItem(title: "Colors", image: "drop"),
        ListItem(title: "Background", image: "photo.stack"),
    ]
    
    let other: [ListItem] = [
        ListItem(title: "About Us", image: "info.circle"),
        ListItem(title: "Privacy Policy", image: "exclamationmark.shield"),
      
    ]
    
    
    
    
    
    //MARK: UI
    private lazy var searchController: UISearchBar = {
        let sb = UISearchBar()
        sb.searchBarStyle = .minimal
        sb.placeholder = "Search..."
        return sb
    }()
    
    private lazy var tableView: UITableView = {
        let tv = UITableView(frame: .zero, style: .plain)
        tv.backgroundColor = .clear
        tv.separatorEffect = .none
        tv.separatorStyle = .none
        tv.showsVerticalScrollIndicator = false
        return tv
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Settings"
        makeConstraints()
        prepareTableView()
        data.append(contentsOf: [mainSetting,theme,other])
    }
    
    private func prepareTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    private func makeConstraints() {
        view.addSubview(searchController)
        searchController.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
        }
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.right.left.bottom.equalToSuperview()
            make.top.equalTo(searchController.snp.bottom)
        }
    }
}

extension SettingsViewController : UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        data.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = data[indexPath.section][indexPath.row].title
        cell.accessoryType = .disclosureIndicator
        cell.selectionStyle = .none
        cell.imageView?.image = .init(systemName: data[indexPath.section][indexPath.row].image)
        cell.imageView?.tintColor = .init(named: "Blue")
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        var lbl: UILabel = {
           let lbl = UILabel()
            switch section{
            case 0:
                lbl.text = "Main Settings"
            case 1:
                lbl.text = "Theme"
            case 2:
                lbl.text = "Others"
            default:
                lbl.text = "Others"
                
            }
            lbl.font = .systemFont(ofSize: 16, weight: .bold)
            lbl.backgroundColor = .systemBackground
            lbl.frame = .init(x: 20, y: 0, width: 200, height: 20)
            return lbl
        }()
        
        let containerView = UIView()
        containerView.addSubview(lbl)
        
        return containerView
    }
    
}


