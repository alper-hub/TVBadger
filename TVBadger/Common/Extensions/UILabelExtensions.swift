//
//  UILabelExtensions.swift
//  TVBadger
//
//  Created by Alper Tufan on 23.01.2022.
//

import Foundation
import UIKit

extension UILabel {
    
    static func funcMakeLabel(
        text: String? = nil,
        font: UIFont? = nil,
        color: UIColor? = nil,
        textAlignment: NSTextAlignment = .left,
        numberOfLines: Int = 0
    ) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = font
        label.textColor = color
        label.textAlignment = textAlignment
        label.numberOfLines = numberOfLines
        return label
    }
}
