//
//  UILabel.swift
//  ARFlight
//
//  Created by Wandianga hassane on 2021-04-21.
//

import Foundation
import UIKit


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

