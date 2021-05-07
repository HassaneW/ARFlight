//
//  TownView.swift
//  ARFlight
//
//  Created by Wandianga hassane on 2021-05-05.
//

import UIKit

/*
 SearchTextField
 UILabel -> UITextField* (passer le title placeholder)
    Exploration:    Heriter de UItextField (leftView) version plus simple
 */

final class SearchTextField: UITextField {

    override init(frame: CGRect) {
        super.init(frame: frame)
        sharedInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        sharedInit()
    }
    
    private func sharedInit() {
        borderStyle = .roundedRect
        layer.borderWidth = 2
        layer.borderColor = UIColor.label.cgColor
        
        leftViewMode = .always
        leftView = UILabel(text: " Ville : ", font: .preferredFont(forTextStyle: .title3))
        
        textColor = .label
        textAlignment = .center
        font = .preferredFont(forTextStyle: .headline)
        adjustsFontForContentSizeCategory = true
        translatesAutoresizingMaskIntoConstraints = false
        
        spellCheckingType = .no
        autocorrectionType = .no
        autocapitalizationType = .words
        clearButtonMode = .whileEditing
        enablesReturnKeyAutomatically = true
        textContentType = .addressCity
    }
}
