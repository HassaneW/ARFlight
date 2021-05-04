//
//  DateTripView.swift
//  ARFlight
//
//  Created by Wandianga hassane on 2021-04-09.
//

import UIKit


final class DateTripView: UIView  {

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
        
        titleLabelDepart.textAlignment = .center
        titleLabelDepart.numberOfLines = 1
        titleLabelDepart.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        titleLabelDepart.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        titleLabelDepart.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        titleLabelDepart.textColor = .cyan
        titleLabelDepart.adjustsFontForContentSizeCategory = true
        titleLabelDepart.translatesAutoresizingMaskIntoConstraints = false
        
//        titleLabelDepart.numberOfLines = 0
//        titleLabelDepart.font = UIFont.preferredFont(forTextStyle: .headline)
//        titleLabelDepart.textColor = .cyan
//        titleLabelDepart.adjustsFontForContentSizeCategory = true
//        titleLabelDepart.translatesAutoresizingMaskIntoConstraints = false
        
        /*
         let cityLabel = UILabel()
         cityLabel.text = "Ville : "
         cityLabel.textAlignment = .center
         cityLabel.numberOfLines = 1
         cityLabel.font = UIFont.preferredFont(forTextStyle: .largeTitle)
         cityLabel.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
         cityLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
         cityLabel.textColor = .cyan
         cityLabel.adjustsFontForContentSizeCategory = true
         cityLabel.translatesAutoresizingMaskIntoConstraints = false
         */
        
        
        
        let textFieldDepart = UITextField()
//        textFieldDepart.textAlignment = .center
        textFieldDepart.placeholder = "Date de Depart"
        
        textFieldDepart.font = UIFont
             .preferredFont(forTextStyle: .largeTitle)
        textFieldDepart.font = UIFont(name: "HelveticaNeue", size: 30)
        textFieldDepart.adjustsFontSizeToFitWidth = true
        textFieldDepart.textAlignment = .center
        textFieldDepart.textColor = .label
        textFieldDepart.adjustsFontForContentSizeCategory = true
        textFieldDepart.translatesAutoresizingMaskIntoConstraints = false
         
        
        
        let dateDepartStackView = UIStackView(arrangedSubviews: [titleLabelDepart,textFieldDepart])
        
//        let citystackView = UIStackView(arrangedSubviews: [cityLabel, textField])
        dateDepartStackView.axis = .horizontal
        dateDepartStackView.alignment = .center
        dateDepartStackView.spacing = 20
        dateDepartStackView.distribution = .fill
        dateDepartStackView.translatesAutoresizingMaskIntoConstraints = false
        
//        dateDepartStackView.axis = .horizontal
//        dateDepartStackView.alignment = .fill
//        dateDepartStackView.distribution = .fill
//        dateDepartStackView.spacing = UIStackView.spacingUseSystem
//        dateDepartStackView.translatesAutoresizingMaskIntoConstraints = false
        
        
 

        let titleLabelArrive = UILabel()
        titleLabelArrive.text = "Et le "
        
        titleLabelArrive.textAlignment = .center
        titleLabelArrive.numberOfLines = 1
        titleLabelArrive.font = UIFont.preferredFont(forTextStyle: .title1)
        titleLabelArrive.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        titleLabelArrive.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        titleLabelArrive.textColor = .cyan
        titleLabelArrive.adjustsFontForContentSizeCategory = true
        titleLabelArrive.translatesAutoresizingMaskIntoConstraints = false
        
        
//        titleLabelArrive.numberOfLines = 0
//        titleLabelArrive.font = UIFont.preferredFont(forTextStyle: .headline)
//        titleLabelArrive.textColor = .cyan
//        titleLabelArrive.adjustsFontForContentSizeCategory = true
//        titleLabelArrive.translatesAutoresizingMaskIntoConstraints = false
        
        // TextField
        let textFieldDateArrive = UITextField()
//        textFieldDateArrive.textAlignment = .center
        textFieldDateArrive.placeholder = "Date d'arrivee"
        
        textFieldDateArrive.font = UIFont
             .preferredFont(forTextStyle: .largeTitle)
        textFieldDateArrive.font = UIFont(name: "HelveticaNeue", size: 30)
        textFieldDateArrive.adjustsFontSizeToFitWidth = true
        textFieldDateArrive.textAlignment = .center
        textFieldDateArrive.textColor = .label
        textFieldDateArrive.adjustsFontForContentSizeCategory = true
        textFieldDateArrive.translatesAutoresizingMaskIntoConstraints = false
        
        // StackView Ville Depart
        let dateArriveStackView = UIStackView(arrangedSubviews: [titleLabelArrive, textFieldDateArrive])
        
        dateArriveStackView.axis = .horizontal
        dateArriveStackView.alignment = .center
        dateArriveStackView.spacing = 20
        dateArriveStackView.distribution = .fill
        dateArriveStackView.translatesAutoresizingMaskIntoConstraints = false
        
        
//        dateArriveStackView.axis = .horizontal
//        dateArriveStackView.alignment = .fill
//        dateArriveStackView.spacing = UIStackView.spacingUseSystem
//        dateArriveStackView.translatesAutoresizingMaskIntoConstraints = false
        
    let contentView = UIStackView(arrangedSubviews: [dateDepartStackView,dateArriveStackView])
    
        contentView.axis = .vertical
        contentView.alignment = .fill
            contentView.distribution = .fill
        contentView.spacing = 30
        contentView.translatesAutoresizingMaskIntoConstraints = false
            
            addSubview(contentView)
        
        
//    contentView.axis = .vertical
//    contentView.alignment = .fill
//    contentView.spacing = UIStackView.spacingUseSystem
//    contentView.translatesAutoresizingMaskIntoConstraints = false
//
//        addSubview(contentView)
        
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
 let cityLabel = UILabel()
 cityLabel.text = "Ville : "
 cityLabel.textAlignment = .center
 cityLabel.numberOfLines = 1
 cityLabel.font = UIFont.preferredFont(forTextStyle: .largeTitle)
 cityLabel.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
 cityLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
 cityLabel.textColor = .cyan
 cityLabel.adjustsFontForContentSizeCategory = true
 cityLabel.translatesAutoresizingMaskIntoConstraints = false
 
 // Textfield
 
 
 
 textField.font = UIFont
     .preferredFont(forTextStyle: .largeTitle)
 textField.font = UIFont(name: "HelveticaNeue", size: 30)
 textField.adjustsFontSizeToFitWidth = true
 textField.textAlignment = .center
 textField.textColor = .label
 textField.adjustsFontForContentSizeCategory = true
 textField.translatesAutoresizingMaskIntoConstraints = false
 
 // hugging ressitance priperoty
 //titleLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
 //titleLabel.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)

 //cityLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
// textField.setContentHuggingPriority(.defaultHigh, for: .horizontal)
 
 // StackView Ville Depart
 let citystackView = UIStackView(arrangedSubviews: [cityLabel, textField])
 citystackView.axis = .horizontal
 citystackView.alignment = .center
 citystackView.spacing = 20
 citystackView.distribution = .fill
 citystackView.translatesAutoresizingMaskIntoConstraints = false
 */
