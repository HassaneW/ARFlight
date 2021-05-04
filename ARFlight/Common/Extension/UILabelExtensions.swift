//
//  UILabel.swift
//  ARFlight
//
//  Created by Wandianga hassane on 2021-04-21.
//

import UIKit

// MARK: Initializers

extension UILabel {
    
    convenience init(text: String?) {
        self.init()
        self.text = text
    }
    
    convenience init(text: String? = nil, font: UIFont) {
        self.init()
        self.font = font
        self.text = text
        self.adjustsFontForContentSizeCategory = true
    }
}

// MARK: - Methods

extension UILabel {
    
    func configureFlightDetailsTitleLabel() {
        
    }

    func configureFlightDetailsInformationLabel() {
        numberOfLines = 0
        font = .preferredFont(forTextStyle: .body)
        textAlignment = .center
        textColor = .label
        adjustsFontSizeToFitWidth = true
        adjustsFontForContentSizeCategory = true
        translatesAutoresizingMaskIntoConstraints = false
    }
}
