//
//  UITableViewExtensions.swift
//  TVBadger
//
//  Created by Alper Tufan on 22.01.2022.
//

import UIKit

extension UITableView {
    
    func dequeue<T: UITableViewCell>(withIdentifier identifier: String = T.typeName, for indexPath: IndexPath) -> T {
        guard let cell = self.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier \(identifier) from tableView \(self)")
        }
        return cell
    }

    func dequeueHeader<T: UITableViewHeaderFooterView>(withIdentifier identifier: String = T.typeName) -> T {
        guard let headerFooterView = self.dequeueReusableHeaderFooterView(withIdentifier: identifier) as? T else {
            fatalError("Could not dequeue header/footer with identifier \(identifier) from tableView \(self)")
        }
        return headerFooterView
    }

    static func buildTableView() {
        
    }
}
