//
//  FlightStackView.swift
//  ARFlight
//
//  Created by Wandianga hassane on 2021-04-23.
//

import UIKit

// MARK: - Initializers
extension UIStackView {
    
    convenience init(
        arrangedSubviews: [UIView],
        axis: NSLayoutConstraint.Axis,
        spacing: CGFloat = UIStackView.spacingUseSystem,
        alignment: UIStackView.Alignment = .fill,
        distribution: UIStackView.Distribution = .fill) {
        self.init(arrangedSubviews: arrangedSubviews)
        self.axis = axis
        self.spacing = spacing
        self.alignment = alignment
        self.distribution = distribution
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}

// MARK: - Methods
extension UIStackView {
    
    func addArrangedSubviews(_ subviews: UIView...) {
        subviews.forEach(addArrangedSubview)
    }
}
