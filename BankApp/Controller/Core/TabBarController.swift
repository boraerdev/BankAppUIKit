//
//  TabBarController.swift
//  BankApp
//
//  Created by Bora Erdem on 12.09.2022.
//

import UIKit

final class TabBarController: UITabBarController {

    override func viewDidLoad() {
            super.viewDidLoad()
            generateTabBar()
            setTabBarAppearance()
        }
        
        private func generateTabBar() {
            viewControllers = [
                generateVC(
                    viewController: HomeViewController(),
                    title: "Home",
                    image: UIImage(systemName: "house.fill")
                ),
                generateVC(
                    viewController: UINavigationController(
                        rootViewController: ExpensesViewController()),
                    title: "Expenses",
                    image: UIImage(systemName: "chart.pie")
                ),
                generateVC(
                    viewController: UINavigationController(
                        rootViewController: ChatViewController()),
                    title: "Chat",
                    image: UIImage(systemName: "message")
                ),
                generateVC(
                    viewController: UINavigationController(
                        rootViewController: HistoryViewController()),
                    title: "Histroy",
                    image: UIImage(systemName: "arrow.uturn.left.circle")
                ),
                generateVC(
                    viewController: UINavigationController(rootViewController: SettingsViewController()),
                    title: "Settings",
                    image: UIImage(systemName: "gearshape")
                )
            ]
        }
        
        private func generateVC(viewController: UIViewController, title: String, image: UIImage?) -> UIViewController {
            viewController.tabBarItem.title = title
            viewController.tabBarItem.image = image
            return viewController
        }
        
        private func setTabBarAppearance() {
            let positionOnX: CGFloat = 10
            let positionOnY: CGFloat = 14
            let width = tabBar.bounds.width
            let height = tabBar.bounds.height + positionOnY * 4
            
            let roundLayer = CAShapeLayer()
            
            let bezierPath = UIBezierPath(
                roundedRect: CGRect(
                    x: 0,
                    y: tabBar.bounds.minX - positionOnY/2,
                    width: width,
                    height: height
                ),
                cornerRadius: 0
            )
            
            roundLayer.path = bezierPath.cgPath
            
            tabBar.layer.insertSublayer(roundLayer, at: 0)
            
            tabBar.itemWidth = width / 5
            tabBar.itemPositioning = .centered
            roundLayer.fillColor = UIColor.white.cgColor
            
            tabBar.tintColor = .init(named: "Blue")
            tabBar.unselectedItemTintColor = .init(named: "Grey")
        }


}
