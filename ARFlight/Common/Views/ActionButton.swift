//
//  ActionButton.swift
//  ARFlight
//
//  Created by Wandianga hassane on 2021-04-08.
//

import UIKit

class ActionButton: UIButton {

    var backgroundColorNormal: UIColor? = Constant.backgroundColorDefault {
        didSet {
            backgroundColor = backgroundColorNormal
        }
    }

    var title: String? {
        didSet {
            setTitle(title, for: .normal)
        }
    }

    private enum Constant {
        static let backgroundColorDefault = UIColor.systemBlue
        static let edgeInsets = UIEdgeInsets(top: 14, left: 12, bottom: 14, right: 12)
        static let cornerRadius: CGFloat = 10
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
        layer.cornerRadius = Constant.cornerRadius
        
        titleLabel?.lineBreakMode = .byTruncatingTail
        titleLabel?.adjustsFontForContentSizeCategory = true
        titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        
        contentEdgeInsets = Constant.edgeInsets
        
        backgroundColor = Constant.backgroundColorDefault
    }
    
    
    // MARK: - Overrides
    
    override var isHighlighted: Bool {
        didSet {
            if !isEnabled { return }
            backgroundColor = isHighlighted ? backgroundColorNormal?.withAlphaComponent(0.5) : backgroundColorNormal
        }
    }
}
