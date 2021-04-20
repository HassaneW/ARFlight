//
//  CustomLabelTitle.swift
//  ARFlight
//
//  Created by Wandianga hassane on 2021-04-20.
//

import UIKit


// 1) supprimer tous les title du label et le remplacer par un seul ?

class CustomLabelTitle: UILabel {
    
    var title: String? {
        didSet {
            titleLabel.text = title
        }
    }
    
    private let titleLabel = UILabel()
    
    
    init(title: String?) {
        super.init(frame: .zero)
        sharedInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        sharedInit()
    }
    private func sharedInit() {
        titleLabel.text = title
        titleLabel.numberOfLines = 1
        titleLabel.font = UIFont
            .preferredFont(forTextStyle: .largeTitle)
        titleLabel.font = UIFont(name: "HelveticaNeue", size: 50)
        titleLabel.adjustsFontSizeToFitWidth = true
        titleLabel.textAlignment = .center
        titleLabel.textColor = .label
        titleLabel.adjustsFontForContentSizeCategory = true
    }
}
