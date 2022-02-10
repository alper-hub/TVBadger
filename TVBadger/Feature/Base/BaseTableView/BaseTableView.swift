//
//  BaseTableView.swift
//  TVBadger
//
//  Created by Alper Tufan on 5.02.2022.
//

import Foundation
import UIKit

class BaseTableView<Cell: UITableViewCell, SectionHeader: UITableViewHeaderFooterView>: UITableView, UITableViewDelegate, UITableViewDataSource {

    var items: [TableItems]
    var selectHandler: (Any) -> ()

    init(
        items: [TableItems],
        selectHandler: @escaping (Any) -> (),
        backgroundColor: UIColor
    ) {
        self.items = items
        self.selectHandler = selectHandler
        super.init(frame: .zero, style: .plain)

        self.delegate = self
        self.dataSource = self
        self.translatesAutoresizingMaskIntoConstraints = false
        self.separatorStyle = .none
        self.backgroundColor = backgroundColor
        Cell.register(to: self)
        SectionHeader.register(to: self)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        items.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items[section].cellItems.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: Cell = tableView.dequeue(for: indexPath)
        guard let reuseCell = cell as? BaseTableViewCellProtocol else {
            return UITableViewCell()
        }
        reuseCell.setupCell(data: items[indexPath.section].cellItems[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectHandler(items[indexPath.section].cellItems[indexPath.row])
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header: SectionHeader = tableView.dequeueHeader()
        guard let headerTitle = items[section].headerTitle else {
            return nil
        }
        guard let reuseHeader = header as? BaseTableViewHeaderFooterViewProtocol else {
            return nil
        }
        reuseHeader.setupCell(data: headerTitle)
        return header
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if items[section].headerTitle != nil {
            return UITableView.automaticDimension
        } else {
            return .zero
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
}

extension BaseTableView {
    func reload(data items: [TableItems]) {
        self.items = items
        self.reloadData()
    }
}

class TableItems {
    var headerTitle: String?
    var cellItems: [Any]
    
    init(
        headerTitle: String?,
        cellItems: [Any]
    ) {
        self.headerTitle = headerTitle
        self.cellItems = cellItems
    }
}
