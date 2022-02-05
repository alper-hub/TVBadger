//
//  ConnectionTableViewSectionHeader.swift
//  TVBadger
//
//  Created by Alper Tufan on 4.02.2022.
//

import Foundation
import UIKit

class ConnectionTableViewSectionHeader: UITableViewHeaderFooterView {

    private lazy var titleLabel: UILabel = {
        let label = UILabel.funcMakeLabel(
            text: "Online TVs",
            font: UIFont(name: "Helvetica", size: 16.0),
            color: .white,
            textAlignment: .left,
            numberOfLines: 0
        )
        return label
    }()

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        prepareUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) hasn't been implemented")
    }
    
    private func prepareUI() {
        contentView.backgroundColor = .mainBackgroundColor
        contentView.addSubview(titleLabel)
        titleLabel.activateConstraints(constraints: [
            .top(contentView.topAnchor),
            .bottom(contentView.bottomAnchor),
            .left(contentView.leftAnchor, 15),
            .width(100)
        ])
    }
}
