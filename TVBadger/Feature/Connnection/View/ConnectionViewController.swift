//
//  ConnectionViewController.swift
//  TVBadger
//
//  Created by Alper Tufan on 9.01.2022.
//

import UIKit

class ConnectionViewController: BaseViewController {

    // MARK: Properties

    private var viewModel: ConnectionViewModelProtocol?
    private var tableView: BaseTableView<ConnectionViewTableViewCell, ConnectionTableViewSectionHeader>!

    // MARK: Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setUpViewModel()
    }

    // MARK: Setup View Model

    func setUpViewModel() {
        viewModel = ConnectionViewModel(delegate: self)
    }

    // MARK: SetupUI

    private func setupUI() {
        view.backgroundColor = .mainBackgroundColor
        setupNavBarUI(
            title: "Search & Connect",
            isLargeText: true,
            titleTextColor: .tintColor,
            backgroundColor: .mainBackgroundColor,
            isBarHidden: false
        )
        tableView = BaseTableView(
            items: [],
            selectHandler: { [weak self] (item) in },
            backgroundColor: .mainBackgroundColor
        )
        view.coverSafeArea(newView: tableView)
        buildError()
    }

    private func buildSearching() {
    }

    private func buildFoundServices() {
        let tableData = ConnectionTableViewCellDataModel(viewType: .loading, name: "[TV] Samsung 5 Series(40)")
        let tableData2 = ConnectionTableViewCellDataModel(viewType: .onlineTV, name: "[TV] Samsung 5 Series(40)")
        let items = [
            TableItems(headerTitle: nil, cellItems: [tableData]),
            TableItems(headerTitle: "Previously Connected", cellItems: [tableData2, tableData2])
        ]

        tableView = BaseTableView(
            items: items,
            selectHandler: { [weak self] (item) in
                guard let cellData = item as? ConnectionTableViewCellDataModel else {
                    return
                }
            },
            backgroundColor: .mainBackgroundColor
        )
    }

    private func buildNoServiceFound() {
    }

    private func buildError() {
        tableView.reload(data: [])
        tableView.backgroundView = BaseTableBackgroundView()
    }
}

// MARK: ViewModel Delegate

extension ConnectionViewController: ConnectionViewModelDelegate {

    func handleViewMdelOutput(_ output: Output) {
        switch output {
        case .searching:
            buildSearching()
        case .foundServices:
            buildFoundServices()
        case .noServiceFound:
            buildNoServiceFound()
        case .error:
            buildError()
        }
    }
}
