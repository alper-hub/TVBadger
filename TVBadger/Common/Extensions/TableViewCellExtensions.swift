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
        let className = String(describing: Self.self)
        let nib = UINib(nibName: className, bundle: nil)
        tableView?.register(nib, forCellReuseIdentifier: className)
    }
}

extension UICollectionReusableView {
    
    static func registerForFooter(to collectionView: UICollectionView?) {
        let className = String(describing: Self.self)
        let nib = UINib(nibName: className, bundle: nil)
        collectionView?.register(nib, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: className)
    }
}
