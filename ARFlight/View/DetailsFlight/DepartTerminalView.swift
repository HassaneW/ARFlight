//
//  DepartTerminalView.swift
//  ARFlight
//
//  Created by Wandianga hassane on 2021-04-09.
//

import UIKit


final class DepartTerminalView: UIView  {

//    var textField = UITextField()
    
    var titleDepartTerminalAirport: String? {
        didSet {
            titleLabelDepart.text = titleDepartTerminalAirport
        }
    }

    private let titleLabelDepart = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView(withTitle title: String? = nil) {
        
        let LabelTerminalDepart = UILabel()
        LabelTerminalDepart.text = "Terminal Depart"
        LabelTerminalDepart.numberOfLines = 0
        LabelTerminalDepart.font = UIFont.preferredFont(forTextStyle: .headline)
        LabelTerminalDepart.textColor = .cyan
        LabelTerminalDepart.adjustsFontForContentSizeCategory = true
        LabelTerminalDepart.translatesAutoresizingMaskIntoConstraints = false
        
//        let textFieldTerminalDepart = UITextField()
//        textFieldTerminalDepart.placeholder = "Terminal de Départ"
 
        titleLabelDepart.text = title
        titleLabelDepart.numberOfLines = 0
        titleLabelDepart.font = UIFont
            .preferredFont(forTextStyle: .headline)
        titleLabelDepart.textAlignment = .center
        titleLabelDepart.textColor = .label
        titleLabelDepart.adjustsFontForContentSizeCategory = true
        titleLabelDepart.translatesAutoresizingMaskIntoConstraints = false
        
        
//        // hugging ressitance priperoty
//        //titleLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
//        //titleLabel.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)

    let contentView = UIStackView(arrangedSubviews: [LabelTerminalDepart,titleLabelDepart])
    
    contentView.axis = .vertical
    contentView.alignment = .fill
    contentView.spacing = UIStackView.spacingUseSystem
    contentView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(contentView)
        
        // Debug colors
        
        
        NSLayoutConstraint.activate([

            contentView.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1.0),
            
            bottomAnchor.constraint(equalToSystemSpacingBelow: contentView.bottomAnchor, multiplier: 1.0),
            contentView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1.0),
            trailingAnchor.constraint(equalToSystemSpacingAfter: contentView.trailingAnchor, multiplier: 1.0),
        ])
    }
}
