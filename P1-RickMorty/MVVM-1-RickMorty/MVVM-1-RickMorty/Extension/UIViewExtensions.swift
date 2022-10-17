//
//  UIViewExtensions.swift
//  MVVM-1-RickMorty
//
//  Created by Can Babaoğlu on 2.10.2022.
//

import UIKit

extension UIView {
    /// collection view and table view cells identifier
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
