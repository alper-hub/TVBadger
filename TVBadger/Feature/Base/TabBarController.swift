//
//  TabBarController.swift
//  TVBadger
//
//  Created by Alper Tufan on 10.01.2022.
//

import UIKit

class TabBarController: UITabBarController {

    // MARK: Constants

    private struct Constants {
        static let tabBarTopInset: CGFloat = 20
        static let tabBarBottomInset: CGFloat = -tabBarTopInset
        static let tabBarLeftInset: CGFloat = 0
        static let tabBarRightInset: CGFloat = 0
    }

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBarColors()
        setupVCs()
    }

    // MARK: Tab Bar Item Colors

    private func setupTabBarColors() {
        tabBar.tintColor = .tintColor
        tabBar.unselectedItemTintColor = .disabledColor
        tabBar.backgroundColor = .mainBackgroundColor
        tabBar.barTintColor = .mainBackgroundColor
        tabBar.isTranslucent = false
    }

    // MARK: Setup Child View Controllers

    private func setupVCs() {
        viewControllers = [
            createNavController(
                for:  ConnectionViewController(),
                   tabBarItemTitle: nil,
                   image: UIImage(named: "TVSymbol")
            ),
            createNavController(
                for: SettingsViewController(),
                   tabBarItemTitle: nil,
                   image: UIImage(named: "settingsIcon")
            ),
        ]
    }
    
    // MARK: Setup Child View Controllers

    fileprivate func createNavController(
        for rootViewController: UIViewController,
        tabBarItemTitle: String?,
        image: UIImage?
    ) -> UIViewController {
        
        let navController = UINavigationController(rootViewController: rootViewController)
        navController.tabBarItem.title = tabBarItemTitle
        navController.tabBarItem.imageInsets = UIEdgeInsets(
            top: Constants.tabBarTopInset,
            left: Constants.tabBarLeftInset,
            bottom: Constants.tabBarBottomInset,
            right: Constants.tabBarRightInset
        )
        navController.tabBarItem.image = image
        return navController
    }
}
