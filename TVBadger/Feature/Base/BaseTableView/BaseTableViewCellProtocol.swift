//
//  BaseTableViewCellProtocol.swift
//  TVBadger
//
//  Created by Alper Tufan on 5.02.2022.
//

import Foundation
import UIKit

protocol BaseTableViewCellProtocol where Self: UITableViewCell {
    func setupCell(data: Any)
}

protocol BaseTableViewHeaderFooterViewProtocol where Self: UITableViewHeaderFooterView {
    func setupCell(data: Any)
}
