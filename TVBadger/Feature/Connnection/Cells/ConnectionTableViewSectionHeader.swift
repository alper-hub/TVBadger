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
            font: UIFont(name: "Helvetica-Bold", size: 25),
            color: .tintColor,
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
        contentView.addSubViewWithConstraints(newView: titleLabel, constraints: [
            .top(contentView.topAnchor, UIConstants.padding),
            .bottom(contentView.bottomAnchor, -UIConstants.padding),
            .left(contentView.leftAnchor, UIConstants.padding),
            .right(contentView.rightAnchor, -UIConstants.padding)
        ])
    }
}

extension ConnectionTableViewSectionHeader: BaseTableViewHeaderFooterViewProtocol {

    func setupCell(data: Any) {
        titleLabel.text = data as? String
    }
}
