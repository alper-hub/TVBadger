//
//  BaseTableViewBackgroundView.swift
//  TVBadger
//
//  Created by Alper Tufan on 7.02.2022.
//

import Foundation
import UIKit

class BaseTableBackgroundView: UIView {

    private lazy var iconImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "wifiIcon")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private lazy var titleLabel: UILabel = {
        let label = UILabel.funcMakeLabel(
            font: UIFont(name: "Helvetica", size: 18),
            color: .tintColor,
            textAlignment: .center,
            numberOfLines: 0
        )
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        prepareUI()
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func prepareUI() {
        self.addSubViewWithConstraints(newView: iconImage, constraints: [
            .centerX(self.centerXAnchor),
            .width(UIConstants.deviceWidth/3),
            .height(UIConstants.deviceWidth/3),
            .top(self.topAnchor, UIConstants.deviceHeight/20)
        ])
        self.addSubViewWithConstraints(newView: titleLabel, constraints: [
            .top(iconImage.bottomAnchor, UIConstants.padding),
            .centerX(self.centerXAnchor)
        ])
        titleLabel.text = "Please Connect to Wifi"
    }

}
