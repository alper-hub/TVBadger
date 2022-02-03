//
//  ConnectionViewTableViewCell.swift
//  TVBadger
//
//  Created by Alper Tufan on 23.01.2022.
//

import UIKit

class ConnectionViewTableViewCell: UITableViewCell {

    private lazy var IconImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "TVSymbol")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) hasn't been implemented")
    }

    private func prepareUI() {
    }
    
}
