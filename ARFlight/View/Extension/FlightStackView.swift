//
//  FlightStackView.swift
//  ARFlight
//
//  Created by Wandianga hassane on 2021-04-23.
//

import UIKit

extension UIStackView {

    private func sharedInitStackView() {
        axis = .horizontal
        alignment = .center
        spacing = 20
        distribution = .fill
        translatesAutoresizingMaskIntoConstraints = false
    }
    private func sharedInitContentStackView() {
        axis = .vertical
        alignment = .fill
            distribution = .fill
        spacing = 30
        translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([

//            contenttopAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1.0),
//            
//            bottomAnchor.constraint(equalToSystemSpacingBelow: contentbottomAnchor, multiplier: 1.0),
//            contentleadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1.0),
//            trailingAnchor.constraint(equalToSystemSpacingAfter: contenttrailingAnchor, multiplier: 1.0),
        ])
        
    }

}
