//
//  ConstraintAnchors.swift
//  TVBadger
//
//  Created by Alper Tufan on 23.01.2022.
//

import UIKit.UIKitCore

public enum ConstraintAnchors {
    case height(CGFloat)
    case width(CGFloat)
    case widthDimension(NSLayoutDimension, CGFloat? = nil)
    case heightDimension(NSLayoutDimension, CGFloat? = nil)
    case left(NSLayoutXAxisAnchor, CGFloat? = nil, EqualToType = .equalTo)
    case right(NSLayoutXAxisAnchor, CGFloat? = nil, EqualToType = .equalTo)
    case top(NSLayoutYAxisAnchor, CGFloat? = nil, EqualToType = .equalTo)
    case bottom(NSLayoutYAxisAnchor, CGFloat? = nil, EqualToType = .equalTo)
    case centerX(NSLayoutXAxisAnchor, CGFloat? = nil)
    case centerY(NSLayoutYAxisAnchor, CGFloat? = nil)
}

public enum EqualToType {
    case equalTo
    case greaterThanOrEqualTo
    case smallerThanOrEqualTo
}
