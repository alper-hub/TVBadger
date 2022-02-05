//
//  ConnectionViewTableViewCell.swift
//  TVBadger
//
//  Created by Alper Tufan on 23.01.2022.
//

import UIKit

class ConnectionViewTableViewCell: UITableViewCell {

    private lazy var iconImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "tvIcon")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        prepareUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) hasn't been implemented")
    }

    private func prepareUI() {
        contentView.addSubview(iconImage)
        contentView.backgroundColor = .mainBackgroundColor
        iconImage.activateConstraints(constraints: [
            .top(contentView.topAnchor),
            .bottom(contentView.bottomAnchor),
            .left(contentView.leftAnchor),
            .width(100)
        ])
    }
}
