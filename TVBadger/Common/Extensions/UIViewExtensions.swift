//
//  UIViewExtensions.swift
//  TVBadger
//
//  Created by Alper Tufan on 23.01.2022.
//

import Foundation
import UIKit

public extension UIView {
    
    // MARK: Constraints
    
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
            case .left(let equalTo, let constant, let equalToType):
                switch equalToType {
                case .equalTo:
                    return leftAnchor.constraint(equalTo: equalTo, constant: constant ?? 0)
                case .greaterThanOrEqualTo:
                    return leftAnchor.constraint(greaterThanOrEqualTo: equalTo, constant:  constant ?? 0)
                case .smallerThanOrEqualTo:
                    return leftAnchor.constraint(lessThanOrEqualTo: equalTo, constant: constant ?? 0)
                }
            case .right(let equalTo, let constant, let equalToType):
                switch equalToType {
                case .equalTo:
                    return rightAnchor.constraint(equalTo: equalTo, constant: constant ?? 0)
                case .greaterThanOrEqualTo:
                    return rightAnchor.constraint(greaterThanOrEqualTo: equalTo, constant:  constant ?? 0)
                case .smallerThanOrEqualTo:
                    return rightAnchor.constraint(lessThanOrEqualTo: equalTo, constant: constant ?? 0)
                }
            case .top(let equalTo, let constant, let equalToType):
                switch equalToType {
                case .equalTo:
                    return topAnchor.constraint(equalTo: equalTo, constant: constant ?? 0)
                case .greaterThanOrEqualTo:
                    return topAnchor.constraint(greaterThanOrEqualTo: equalTo, constant:  constant ?? 0)
                case .smallerThanOrEqualTo:
                    return topAnchor.constraint(lessThanOrEqualTo: equalTo, constant: constant ?? 0)
                }
            case .bottom(let equalTo, let constant, let equalToType):
                switch equalToType {
                case .equalTo:
                    return bottomAnchor.constraint(equalTo: equalTo, constant: constant ?? 0)
                case .greaterThanOrEqualTo:
                    return bottomAnchor.constraint(greaterThanOrEqualTo: equalTo, constant:  constant ?? 0)
                case .smallerThanOrEqualTo:
                    return bottomAnchor.constraint(lessThanOrEqualTo: equalTo, constant: constant ?? 0)
                }
            case .centerX(let equalTo, let constant):
                return centerXAnchor.constraint(equalTo: equalTo, constant: constant ?? 0)
            case .centerY(let equalTo, let constant):
                return centerYAnchor.constraint(equalTo: equalTo, constant: constant ?? 0)
            }
        }
        return constraints
    }

    func activateConstraints(constraints: [ConstraintAnchors]) {
        NSLayoutConstraint.activate(self.constraints(with: constraints))
    }

    // MARK: View cover safe area

    func coverSafeArea(newView: UIView) {
        self.addSubview(newView)
        newView.activateConstraints(constraints: [
            .top(self.safeAreaLayoutGuide.topAnchor),
            .bottom(self.safeAreaLayoutGuide.bottomAnchor),
            .left(self.safeAreaLayoutGuide.leftAnchor),
            .right(self.safeAreaLayoutGuide.rightAnchor),
        ])
    }

    // MARK: Add View with constraints

    func addSubViewWithConstraints(
        newView: UIView,
        constraints: [ConstraintAnchors]
    ) {
        self.addSubview(newView)
        newView.activateConstraints(constraints: constraints)
    }
}

extension UIActivityIndicatorView {

    func scaleIndicator(factor: CGFloat) {
        transform = CGAffineTransform(scaleX: factor, y: factor)
    }

    func scaleIndicator() {
        style = .medium
    }
}
