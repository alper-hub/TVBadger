//
//  ConnectionViewController.swift
//  TVBadger
//
//  Created by Alper Tufan on 9.01.2022.
//

import UIKit

class ConnectionViewController: BaseViewController {

    // MARK: Properties

    let tableView: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()

    // MARK: Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        tableView.delegate = self
        tableView.dataSource = self
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
        setupTableViewUI()
    }

    // MARK: SetupTableViewUI

    func setupTableViewUI() {
        tableView.backgroundColor = .mainBackgroundColor
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        NSLayoutConstraint.activate(tableView.constraints(with: [
            .top(view.safeAreaLayoutGuide.topAnchor),
            .bottom(view.safeAreaLayoutGuide.bottomAnchor),
            .left(view.safeAreaLayoutGuide.leftAnchor),
            .right(view.safeAreaLayoutGuide.rightAnchor)
        ]))
    }
}

// MARK: TableView Methods

extension ConnectionViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "annen \(indexPath.row+1)"
        cell.textLabel?.textColor = .white
        cell.backgroundColor = .mainBackgroundColor
        return cell
    }
}
