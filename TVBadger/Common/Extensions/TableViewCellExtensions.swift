//
//  TableViewCellExtensions.swift
//  TVBadger
//
//  Created by Alper Tufan on 22.01.2022.
//

import Foundation
import UIKit

extension UITableViewCell {
    static func register(to tableView: UITableView?) {
        tableView?.register(self, forCellReuseIdentifier: self.typeName)
    }
}

extension UITableViewHeaderFooterView {
    static func register(to tableView: UITableView?) {
        tableView?.register(self, forHeaderFooterViewReuseIdentifier: self.typeName)
    }
}
