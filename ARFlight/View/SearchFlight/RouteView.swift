//
//  UIVIew2.swift
//  ARFlight
//
//  Created by Wandianga hassane on 2021-04-08.
//


import UIKit

final class RouteView: UIView  {
    
    let customUILabelVille = CustomUILabel(title: "Ville : ")
    
    var titleFlight: String? {
        didSet {
            titleLabel.text = titleFlight
        }
    }
    
    
    let textField = UITextField()

    private let titleLabel = UILabel(font: UIFont
                                        .preferredFont(forTextStyle: .largeTitle))

    init(title: String?, image: UIImage?) {
        super.init(frame: .zero)
        setupViewWith(title: title, image: image)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupViewWith(title: String? = nil, image: UIImage? = nil) {

        let myImagePlane = UIImageView(image: image)
        myImagePlane.clipsToBounds = true
        myImagePlane.contentMode = UIView.ContentMode.scaleAspectFit
        
//        myImagePlane.setContentHuggingPriority(.defaultHigh, for: .horizontal)
//        myImagePlane.setContentCompressionResistancePriority(.required, for: .horizontal)
        
        titleLabel.text = title
        titleLabel.numberOfLines = 1
        //titleLabel.font = UIFont
            //.preferredFont(forTextStyle: .largeTitle)
        
        //titleLabel.adjustsFontSizeToFitWidth = true
        titleLabel.textAlignment = .center
        titleLabel.textColor = .label
        //titleLabel.adjustsFontForContentSizeCategory = true
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
    
        let routeStackView = UIStackView(arrangedSubviews: [UIView(),myImagePlane, titleLabel, UIView()])
        routeStackView.axis = .horizontal
        routeStackView.alignment = .center
        routeStackView.distribution = .equalSpacing
        routeStackView.spacing = 30
        routeStackView.translatesAutoresizingMaskIntoConstraints = false

        // Label Ville

        let cityLabel = UILabel()
        cityLabel.text = "Ville : "
        cityLabel.textAlignment = .center
        cityLabel.numberOfLines = 1
        cityLabel.font = UIFont.preferredFont(forTextStyle: .largeTitle)
//        cityLabel.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
//        cityLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
//        cityLabel.textColor = .cyan
//        cityLabel.adjustsFontForContentSizeCategory = true
//        cityLabel.translatesAutoresizingMaskIntoConstraints = false
        
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
    
    let contentView = UIStackView(arrangedSubviews: [routeStackView, citystackView])
            
    contentView.axis = .vertical
    contentView.alignment = .fill
        contentView.distribution = .fill
    contentView.spacing = 30
    contentView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(contentView)
        
        // Debug colors
//        cityLabel.backgroundColor = .red
        myImagePlane.backgroundColor = .yellow
        titleLabel.backgroundColor = .tertiaryLabel
        textField.backgroundColor = .brown
        
        NSLayoutConstraint.activate([

            myImagePlane.widthAnchor.constraint(equalToConstant: 50),
            myImagePlane.heightAnchor.constraint(equalToConstant: 50),
            
            titleLabel.widthAnchor.constraint(equalToConstant: 150),
            titleLabel.heightAnchor.constraint(equalToConstant: 80),
            
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
      Label Ville
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
