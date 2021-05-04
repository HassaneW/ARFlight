//
//  ActionButton.swift
//  ARFlight
//
//  Created by Wandianga hassane on 2021-04-08.
//

import UIKit

class ActionButton: UIButton {
    
    var title: String? {
        didSet {
            setTitle(title, for: .normal)
        }
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        sharedInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        sharedInit()
    }
    
    private func sharedInit() {
        clipsToBounds = true
        layer.cornerRadius = 12
        layer.borderWidth = 1.0
        layer.borderColor = UIColor.red.cgColor
        backgroundColor = UIColor.purple
    }
}
