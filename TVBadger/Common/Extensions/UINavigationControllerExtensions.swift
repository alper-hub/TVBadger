//
//  UINavigationControllerExtensions.swift
//  TVBadger
//
//  Created by Alper Tufan on 4.02.2022.
//

import Foundation
import UIKit

extension UINavigationController {
    
    func setupNavBarUI(
        title: String,
        isLargeText: Bool,
        titleTextColor: UIColor,
        backgroundColor: UIColor?,
        isBarHidden: Bool
    ) {
        self.navigationBar.prefersLargeTitles = isLargeText
        self.navigationBar.topItem?.title = title
        self.navigationBar.isHidden = isBarHidden
        if #available(iOS 13.0, *) {
            let appearance = UINavigationBarAppearance()
            appearance.backgroundColor = backgroundColor
            appearance.titleTextAttributes = [.foregroundColor: titleTextColor]
            appearance.largeTitleTextAttributes = [.foregroundColor: titleTextColor]

            self.navigationBar.tintColor = backgroundColor
            self.navigationBar.standardAppearance = appearance
            self.navigationBar.compactAppearance = appearance
            self.navigationBar.scrollEdgeAppearance = appearance
        } else {
            self.navigationBar.tintColor = backgroundColor
            self.navigationBar.barTintColor = backgroundColor
            self.navigationBar.isTranslucent = false
        }
    }
}
