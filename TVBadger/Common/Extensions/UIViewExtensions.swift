//
//  UIViewExtensions.swift
//  TVBadger
//
//  Created by Alper Tufan on 23.01.2022.
//

import Foundation
import UIKit

public extension UIView {
    
    func constraints(with: [ConstraintAnchors]) -> [NSLayoutConstraint] {
        let constraints: [NSLayoutConstraint] = with.map { (anchor) -> NSLayoutConstraint in
            switch anchor {
            case .height(let constant):
                return heightAnchor.constraint(equalToConstant: constant)
            case .width(let constant):
                return widthAnchor.constraint(equalToConstant: constant)
            case .widthDimension(let width, let multiplier):
                return widthAnchor.constraint(equalTo: width, multiplier: multiplier ?? 1)
            case .heightDimension(let height, let multiplier):
                return heightAnchor.constraint(equalTo: height, multiplier: multiplier ?? 1)
            case .left(let equalTo, let constant):
                return leftAnchor.constraint(equalTo: equalTo, constant: constant ?? 0)
            case .right(let equalTo, let constant):
                return rightAnchor.constraint(equalTo: equalTo, constant: constant ?? 0)
            case .top(let equalTo, let constant):
                return topAnchor.constraint(equalTo: equalTo, constant: constant ?? 0)
            case .bottom(let equalTo, let constant):
                return bottomAnchor.constraint(equalTo: equalTo, constant: constant ?? 0)
            case .centerX(let equalTo, let constant):
                return centerXAnchor.constraint(equalTo: equalTo, constant: constant ?? 0)
            case .centerY(let equalTo, let constant):
                return centerYAnchor.constraint(equalTo: equalTo, constant: constant ?? 0)
            }
        }
        return constraints
    }
}
