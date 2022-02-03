//
//  SettingsViewController.swift
//  TVBadger
//
//  Created by Alper Tufan on 18.01.2022.
//

import Foundation
import UIKit

class SettingsViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupUI() {
        view.backgroundColor = .mainBackgroundColor
        setupNavBarUI(
            title: "Settings",
            isLargeText: true,
            titleTextColor: .color3,
            backgroundColor: .mainBackgroundColor,
            isBarHidden: false
        )
    }
}
