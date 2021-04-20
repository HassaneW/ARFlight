//
//  CustomStackView.swift
//  ARFlight
//
//  Created by Wandianga hassane on 2021-04-20.
//

import UIKit


class CustomStackView : UIStackView {
    
    let citystackView = UIStackView(arrangedSubviews: [])
    
    private func sharedInitStackView() {
        citystackView.axis = .horizontal
        citystackView.alignment = .center
        citystackView.spacing = 20
        citystackView.distribution = .fill
        citystackView.translatesAutoresizingMaskIntoConstraints = false
    }
    private func sharedInitContentStackView() {
        let contentView = UIStackView(arrangedSubviews: [])
                
        contentView.axis = .vertical
        contentView.alignment = .fill
            contentView.distribution = .fill
        contentView.spacing = 30
        contentView.translatesAutoresizingMaskIntoConstraints = false
            
            addSubview(contentView)
        
        NSLayoutConstraint.activate([

            contentView.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1.0),
            
            bottomAnchor.constraint(equalToSystemSpacingBelow: contentView.bottomAnchor, multiplier: 1.0),
            contentView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1.0),
            trailingAnchor.constraint(equalToSystemSpacingAfter: contentView.trailingAnchor, multiplier: 1.0),
        ])
        
    }
    
}
