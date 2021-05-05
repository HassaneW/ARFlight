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

final class TownView: UIView {
    
    
    var searchPlaceHolder: String? {
        didSet {
            textField.placeholder = searchPlaceHolder
        }
    }
    
    
    let textField = UITextField()
    
    
    init(textfield: UITextField) {
        super.init(frame: .zero)
        setupView(textfield: textfield)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView(textfield: UITextField) {
    
        textfield.textAlignment = .center
        textfield.textColor = .black
        textfield.borderStyle = .roundedRect
        textfield.font = .preferredFont(forTextStyle: .headline)
        textfield.leftView = UILabel(text: "Ville : ", font: .preferredFont(forTextStyle: .title3))
        textfield.leftViewMode = .always
        textfield.adjustsFontSizeToFitWidth = true
        textfield.translatesAutoresizingMaskIntoConstraints = false
        
        let contentStackView = UIStackView(
            arrangedSubviews: [textfield],
            axis: .horizontal,
            spacing: UIStackView.spacingUseSystem,
            alignment: .fill,
            distribution: .fillEqually)
        contentStackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(contentStackView)
        
        NSLayoutConstraint.activate([
//            leadingImageView.widthAnchor.constraint(equalToConstant: Constant.imageWidth),
//            leadingImageView.heightAnchor.constraint(equalTo: leadingImageView.widthAnchor),
            
            contentStackView.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1.0),
            contentStackView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1.0),
            bottomAnchor.constraint(equalToSystemSpacingBelow: contentStackView.bottomAnchor, multiplier: 1.0),
            trailingAnchor.constraint(equalToSystemSpacingAfter: contentStackView.trailingAnchor, multiplier: 1.0),
        ])
    }

}
