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
    case left(NSLayoutXAxisAnchor, CGFloat? = nil)
    case right(NSLayoutXAxisAnchor, CGFloat? = nil)
    case top(NSLayoutYAxisAnchor, CGFloat? = nil)
    case bottom(NSLayoutYAxisAnchor, CGFloat? = nil)
    case centerX(NSLayoutXAxisAnchor, CGFloat? = nil)
    case centerY(NSLayoutYAxisAnchor, CGFloat? = nil)
}
