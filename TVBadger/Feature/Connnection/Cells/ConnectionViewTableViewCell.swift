//
//  ConnectionViewTableViewCell.swift
//  TVBadger
//
//  Created by Alper Tufan on 23.01.2022.
//

import UIKit

class ConnectionViewTableViewCell: UITableViewCell {

    private let cellView: UIView = {
        let content = UIView()
        content.backgroundColor = .mainBackgroundColor
        content.translatesAutoresizingMaskIntoConstraints = false
        return content
    }()

    private lazy var loadingWheel: UIActivityIndicatorView = {
        let loadingWheel = UIActivityIndicatorView()
        loadingWheel.scaleIndicator(factor: 2.5)
        loadingWheel.color = .disabledColor
        loadingWheel.translatesAutoresizingMaskIntoConstraints = false
        return loadingWheel
    }()
    
    private lazy var iconImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "TVSymbol")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private lazy var titleLabel: UILabel = {
        let label = UILabel.funcMakeLabel(
            font: UIFont(name: "Helvetica", size: 18),
            color: .tintColor,
            textAlignment: .left,
            numberOfLines: 0
        )
        return label
    }()

    private lazy var errorLabel: UILabel = {
        let label = UILabel.funcMakeLabel(
            font: UIFont(name: "ArialMT", size: 16),
            color: .disabledColor,
            textAlignment: .left,
            numberOfLines: 0
        )
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) hasn't been implemented")
    }
    
    private func prepareUI(viewType: ConnectionTableViewCellViewType) {
        contentView.backgroundColor = .mainBackgroundColor
        switch viewType {
        case .loading:
            buildUIForLoading()
        case .onlineTV:
            buildUIForOnlineTV()
        case .previouslyConnectedTV:
            buildUIForPreviouslyConnectedTV()
        }

    }
    private func buildUIForOnlineTV() {
        contentView.addSubViewWithConstraints(newView: cellView, constraints: [
            .top(contentView.topAnchor),
            .left(contentView.leftAnchor, UIConstants.padding),
            .right(contentView.rightAnchor, -UIConstants.padding),
            .bottom(contentView.bottomAnchor, -UIConstants.padding)
        ])

        cellView.addSubViewWithConstraints(newView: iconImage, constraints: [
            .top(cellView.topAnchor, UIConstants.padding),
            .left(cellView.leftAnchor, UIConstants.padding),
            .width(75),
            .height(50)
        ])

        cellView.addSubViewWithConstraints(newView: titleLabel, constraints: [
            .top(cellView.topAnchor, UIConstants.padding),
            .bottom(cellView.bottomAnchor, -UIConstants.padding, .smallerThanOrEqualTo),
            .left(iconImage.rightAnchor, UIConstants.padding),
            .right(cellView.rightAnchor, -UIConstants.padding),
        ])
    }
    
    private func buildUIForPreviouslyConnectedTV() {
    }
    
    private func buildUIForLoading() {
        loadingWheel.startAnimating()

        contentView.addSubViewWithConstraints(newView: cellView, constraints: [
            .top(contentView.topAnchor),
            .left(contentView.leftAnchor),
            .right(contentView.rightAnchor),
            .bottom(contentView.bottomAnchor)
        ])

        cellView.addSubViewWithConstraints(newView: loadingWheel, constraints: [
            .top(cellView.topAnchor, UIConstants.padding),
            .centerX(cellView.centerXAnchor),
            .width(UIConstants.deviceWidth/10),
            .height(UIConstants.deviceWidth/10)
        ])
        
        errorLabel.text = "Searching"
        cellView.addSubViewWithConstraints(newView: errorLabel, constraints: [
            .top(loadingWheel.bottomAnchor, UIConstants.padding),
            .left(cellView.leftAnchor, UIConstants.padding, .greaterThanOrEqualTo),
            .right(cellView.rightAnchor, -UIConstants.padding, .smallerThanOrEqualTo),
            .bottom(cellView.bottomAnchor, -UIConstants.padding),
            .centerX(cellView.centerXAnchor)
        ])
    }
}

extension ConnectionViewTableViewCell: BaseTableViewCellProtocol {

    func setupCell(data: Any) {
        guard let cellData = data as? ConnectionTableViewCellDataModel else {
            return
        }
        titleLabel.text = cellData.name
        prepareUI(viewType: cellData.viewType)
    }
}
