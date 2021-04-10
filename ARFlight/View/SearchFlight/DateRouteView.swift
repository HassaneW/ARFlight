//
//  DateRouteView.swift
//  ARFlight
//
//  Created by Wandianga hassane on 2021-04-09.
//

import UIKit


final class DateRouteView: UIView  {

    let textField = UITextField()

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
        
        let titleLabelDepart = UILabel()
        titleLabelDepart.text = "Date entre le "
        titleLabelDepart.numberOfLines = 0
        titleLabelDepart.font = UIFont.preferredFont(forTextStyle: .headline)
        titleLabelDepart.textColor = .cyan
        titleLabelDepart.adjustsFontForContentSizeCategory = true
        titleLabelDepart.translatesAutoresizingMaskIntoConstraints = false
        
        let textFieldDepart = UITextField()
        textFieldDepart.textAlignment = .center
        textFieldDepart.placeholder = "Date de Depart"
        
        let dateDepartStackView = UIStackView(arrangedSubviews: [titleLabelDepart,textFieldDepart])
        
        dateDepartStackView.axis = .horizontal
        dateDepartStackView.alignment = .fill
        dateDepartStackView.distribution = .fill
        dateDepartStackView.spacing = UIStackView.spacingUseSystem
        dateDepartStackView.translatesAutoresizingMaskIntoConstraints = false
 
//        // hugging ressitance priperoty
//        //titleLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
//        //titleLabel.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)

        let titleLabelArrive = UILabel()
        titleLabelArrive.text = "Et le "
        titleLabelArrive.numberOfLines = 0
        titleLabelArrive.font = UIFont.preferredFont(forTextStyle: .headline)
        titleLabelArrive.textColor = .cyan
        titleLabelArrive.adjustsFontForContentSizeCategory = true
        titleLabelArrive.translatesAutoresizingMaskIntoConstraints = false
        
        // TextField
        let textFieldDateArrive = UITextField()
        textFieldDateArrive.textAlignment = .center
        textFieldDateArrive.placeholder = "Date d'arrivee"
        
        // StackView Ville Depart
        let dateArriveStackView = UIStackView(arrangedSubviews: [titleLabelArrive, textFieldDateArrive])
        dateArriveStackView.axis = .horizontal
        dateArriveStackView.alignment = .fill
        dateArriveStackView.spacing = UIStackView.spacingUseSystem
        dateArriveStackView.translatesAutoresizingMaskIntoConstraints = false
        
    let contentView = UIStackView(arrangedSubviews: [dateDepartStackView,dateArriveStackView])
    
    contentView.axis = .vertical
    contentView.alignment = .fill
    contentView.spacing = UIStackView.spacingUseSystem
    contentView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(contentView)
        
        // Debug colors
        titleLabelDepart.backgroundColor = .tertiaryLabel
        textFieldDepart.backgroundColor = .yellow
        
        titleLabelArrive.backgroundColor = .tertiaryLabel
        textFieldDateArrive.backgroundColor = .yellow
        
        NSLayoutConstraint.activate([

            contentView.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1.0),
            
            bottomAnchor.constraint(equalToSystemSpacingBelow: contentView.bottomAnchor, multiplier: 1.0),
            contentView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1.0),
            trailingAnchor.constraint(equalToSystemSpacingAfter: contentView.trailingAnchor, multiplier: 1.0),
        ])
    }
}


/*
 // StackView Date Depart
 
 // Label Ville
 let titleLabelDateDepart = UILabel()
 titleLabelDateDepart.text = "Date entre le "
 titleLabelDateDepart.numberOfLines = 0
 titleLabelDateDepart.font = UIFont.preferredFont(forTextStyle: .headline)
 titleLabelDateDepart.textColor = .cyan
 titleLabelDateDepart.adjustsFontForContentSizeCategory = true
 titleLabelDateDepart.translatesAutoresizingMaskIntoConstraints = false
 
 // TextField
 let textFieldDateDepart = UITextField()
 textFieldDateDepart.placeholder = "Date"
 
 // StackView Ville Depart
 let contentStackViewDateDepart = UIStackView(arrangedSubviews: [titleLabelDateDepart, textFieldDateDepart])
 contentStackViewDateDepart.axis = .horizontal
 contentStackViewDateDepart.alignment = .fill
 contentStackViewDateDepart.spacing = UIStackView.spacingUseSystem
 contentStackViewDateDepart.translatesAutoresizingMaskIntoConstraints = false
 
 // StackView Date Arrive
 
 // Label Ville
 let titleLabelDateArrive = UILabel()
 titleLabelDateArrive.text = "Et le "
 titleLabelDateArrive.numberOfLines = 0
 titleLabelDateArrive.font = UIFont.preferredFont(forTextStyle: .headline)
 titleLabelDateArrive.textColor = .cyan
 titleLabelDateArrive.adjustsFontForContentSizeCategory = true
 titleLabelDateArrive.translatesAutoresizingMaskIntoConstraints = false
 
 // TextField
 let textFieldDateArrive = UITextField()
 textFieldDateArrive.placeholder = "Date"
 
 // StackView Ville Depart
 let contentStackViewDateArrive = UIStackView(arrangedSubviews: [titleLabelDateArrive, textFieldDateArrive])
 contentStackViewDateArrive.axis = .horizontal
 contentStackViewDateArrive.alignment = .fill
 contentStackViewDateArrive.spacing = UIStackView.spacingUseSystem
 contentStackViewDateArrive.translatesAutoresizingMaskIntoConstraints = false
 
 */
