//
//  UIVIew2.swift
//  ARFlight
//
//  Created by Wandianga hassane on 2021-04-08.
//


import UIKit

final class RouteView: UIView  {
    
    var titleFlight: String? {
        didSet {
            titleLabel.text = titleFlight
        }
    }
    
    let textField = UITextField()

    private let titleLabel = UILabel()

    init(title: String?) {
        super.init(frame: .zero)
        setupView(withTitle: title)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView(withTitle title: String? = nil) {
        
        let imagePlane = UIImage(systemName: "airplane")
        let myImagePlane = UIImageView(image: imagePlane)
        myImagePlane.contentMode = UIView.ContentMode.scaleAspectFit
        
//        myImagePlane.setContentHuggingPriority(.defaultHigh, for: .horizontal)
//        myImagePlane.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        
        titleLabel.text = title
        titleLabel.numberOfLines = 0
        titleLabel.font = UIFont
            .preferredFont(forTextStyle: .largeTitle)
        titleLabel.textAlignment = .center
        titleLabel.textColor = .label
        titleLabel.adjustsFontForContentSizeCategory = true
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
    
        let routeStackView = UIStackView(arrangedSubviews: [myImagePlane, titleLabel])
        routeStackView.axis = .horizontal
        routeStackView.alignment = .leading
        routeStackView.distribution = .fillProportionally
        routeStackView.spacing = UIStackView.spacingUseSystem
        routeStackView.translatesAutoresizingMaskIntoConstraints = false

        // Label Ville

        let cityLabel = UILabel()
        cityLabel.text = "Ville"
        cityLabel.textAlignment = .center
        cityLabel.numberOfLines = 0
        cityLabel.font = UIFont.preferredFont(forTextStyle: .title1)
        cityLabel.textColor = .cyan
        cityLabel.adjustsFontForContentSizeCategory = true
        cityLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // hugging ressitance priperoty
        //titleLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        //titleLabel.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
    
        // StackView Ville Depart
        let citystackView = UIStackView(arrangedSubviews: [cityLabel, textField])
        citystackView.axis = .horizontal
        citystackView.alignment = .fill
        citystackView.spacing = UIStackView.spacingUseSystem
        citystackView.translatesAutoresizingMaskIntoConstraints = false
    
    let contentView = UIStackView(arrangedSubviews: [routeStackView, citystackView])
    
    contentView.axis = .vertical
    contentView.alignment = .fill
    contentView.spacing = UIStackView.spacingUseSystem
    contentView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(contentView)
        
        // Debug colors
        cityLabel.backgroundColor = .red
        myImagePlane.backgroundColor = .yellow
        titleLabel.backgroundColor = .tertiaryLabel
        textField.backgroundColor = .brown
        
        NSLayoutConstraint.activate([

            
            contentView.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1.0),
            
            bottomAnchor.constraint(equalToSystemSpacingBelow: contentView.bottomAnchor, multiplier: 1.0),
            contentView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1.0),
            trailingAnchor.constraint(equalToSystemSpacingAfter: contentView.trailingAnchor, multiplier: 1.0),
        ])
    }
}


/*
 
     let imagePlane = UIImage(systemName: "airplane")
     let myImagePlane:UIImageView = UIImageView()
     myImagePlane.contentMode = UIView.ContentMode.left
     myImagePlane.contentMode = UIView.ContentMode.scaleAspectFit
     myImagePlane.image = imagePlane
     //        view.addSubview(myImagePlane)
 
     // Title Label Depart
     let titleLabelDepart = UILabel()
     titleLabelDepart.text = "Depart"
     titleLabelDepart.numberOfLines = 0
     titleLabelDepart.font = UIFont
         .preferredFont(forTextStyle: .headline)
     titleLabelDepart.textAlignment = .center
     titleLabelDepart.textColor = .black
     titleLabelDepart.adjustsFontForContentSizeCategory = true
     titleLabelDepart.translatesAutoresizingMaskIntoConstraints = false
 
     //  StackView Depart
     let contentStackViewDepart = UIStackView(arrangedSubviews: [myImagePlane, titleLabelDepart])
     contentStackViewDepart.axis = .horizontal
     contentStackViewDepart.alignment = .fill
     contentStackViewDepart.distribution = .fill
     contentStackViewDepart.spacing = UIStackView.spacingUseSystem
     contentStackViewDepart.translatesAutoresizingMaskIntoConstraints = false
 
 
     // 2) StackView Ville Depart
     // Label Ville
     let titleLabel = UILabel()
     titleLabel.text = "Ville"
     titleLabel.numberOfLines = 0
     titleLabel.font = UIFont.preferredFont(forTextStyle: .headline)
     titleLabel.textColor = .cyan
     titleLabel.adjustsFontForContentSizeCategory = true
     titleLabel.translatesAutoresizingMaskIntoConstraints = false
 
     // TextField
     let textField = UITextField()
     textField.delegate = self
     textField.placeholder = "Depart"
 
     // StackView Ville Depart
     let stackViewCityStart = UIStackView(arrangedSubviews: [titleLabel, textField])
     stackViewCityStart.axis = .horizontal
     stackViewCityStart.alignment = .fill
     stackViewCityStart.spacing = UIStackView.spacingUseSystem
     stackViewCityStart.translatesAutoresizingMaskIntoConstraints = false
 
 let contentView = UIStackView(arrangedSubviews: [contentStackViewDepart, stackViewCityStart])
 
 contentView.axis = .vertical
 contentView.alignment = .fill
 contentView.spacing = UIStackView.spacingUseSystem
 contentView.translatesAutoresizingMaskIntoConstraints = false

 // 4 : Ajouter les contraintes à ces caractéristiques
 */
