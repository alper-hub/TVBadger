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
    
    let tableView: UITableView = {
        let table = UITableView()
        table.backgroundColor = .mainBackgroundColor
        table.translatesAutoresizingMaskIntoConstraints = false
        ConnectionViewTableViewCell.register(to: table)
        ConnectionTableViewSectionHeader.register(to: table)
        return table
    }()

    // MARK: Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupTableView()
        setUpViewModel()
    }

    // MARK: Setup View Model

    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }

    // MARK: Setup View Model

    func setUpViewModel() {
        viewModel = ConnectionViewModel(delegate: self)
    }

    // MARK: SetupUI

    private func setupUI() {
        view.backgroundColor = .mainBackgroundColor
        self.navigationController?.setupNavBarUI(
            title: "Search & Connect",
            isLargeText: true,
            titleTextColor: .tintColor,
            backgroundColor: .mainBackgroundColor,
            isBarHidden: false
        )
        setupTableViewUI()
    }

    // MARK: SetupTableViewUI

    func setupTableViewUI() {
        view.addSubview(tableView)
        tableView.coverSafeArea()
    }
}

// MARK: TableView Methods

extension ConnectionViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ConnectionViewTableViewCell = tableView.dequeue(for: indexPath)

        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header: ConnectionTableViewSectionHeader = tableView.dequeueHeader()
        return header
    }
}

// MARK: ViewModel Delegate

extension ConnectionViewController: ConnectionViewModelDelegate {

    func handleViewMdelOutput(_ output: Output) {
        switch output {
        case .searching:
            break
        case .foundServices:
            break
        case .noServiceFound:
            break
        case .error:
            break
        }
    }
}
