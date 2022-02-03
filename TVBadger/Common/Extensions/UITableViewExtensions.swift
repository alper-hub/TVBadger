//
//  UITableViewExtensions.swift
//  TVBadger
//
//  Created by Alper Tufan on 22.01.2022.
//

import UIKit

extension UITableView {
    
    func dequeue<T: UITableViewCell>(withIdentifier identifier: String = String(describing: T.self), for indexPath: IndexPath) -> T {
        guard let cell = self.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier \(identifier) from collectionView \(self)")
        }
        return cell
    }
}
