//
//  CurrentLocationView.swift
//  ARFlight
//
//  Created by Wandianga hassane on 2021-04-09.
//

import UIKit


final class CurrentLocationView: UIView  {

//    private let titleLabelDepart = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView(withTitle title: String? = nil) {
        
        // Créér Image
        let imageSearch = UIImage(systemName: "magnifyingglass.circle.fill")
        let myImageSearch:UIImageView = UIImageView()
        myImageSearch.contentMode = UIView.ContentMode.center
        myImageSearch.clipsToBounds = true
        myImageSearch.contentMode = UIView.ContentMode.scaleAspectFit
        myImageSearch.image = imageSearch
   
        
        // Title Label Current
        let labelTitle = UILabel()
        labelTitle.text = "Current"
        labelTitle.numberOfLines = 1
        labelTitle.font = UIFont
            .preferredFont(forTextStyle: .largeTitle)
        labelTitle.textAlignment = .center
        labelTitle.font =  UIFont (name: "Helvetica Neue", size: 50)
        labelTitle.adjustsFontSizeToFitWidth = true
        labelTitle.textColor = .label
        labelTitle.adjustsFontForContentSizeCategory = true
        labelTitle.translatesAutoresizingMaskIntoConstraints = false
        
        // Switch Current
        let currentSwitch = UISwitch()
        currentSwitch.setOn(false, animated: false)
        currentSwitch.tintColor = UIColor.blue
        currentSwitch.onTintColor = UIColor.cyan
        currentSwitch.thumbTintColor = UIColor.red
              
       //               currentSwitch.addTarget(self, action: #selector(switchChanged(sender:)), for: UIControlEvents.valueChanged)

        let contentView = UIStackView(arrangedSubviews: [myImageSearch, labelTitle, currentSwitch])
        contentView.axis = .horizontal
        contentView.alignment = .center
        contentView.distribution = .fillProportionally
        contentView.spacing = UIStackView.spacingUseSystem
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(contentView)
        
        // Debug colors
        myImageSearch.backgroundColor = .yellow
        labelTitle.backgroundColor = .tertiaryLabel
        currentSwitch.backgroundColor = .brown
        
        NSLayoutConstraint.activate([
            
            myImageSearch.widthAnchor.constraint(equalToConstant: 50),
            myImageSearch.heightAnchor.constraint(equalToConstant: 50),
            
            currentSwitch.widthAnchor.constraint(equalToConstant: 50),
            
            labelTitle.heightAnchor.constraint(equalToConstant: 50),

            contentView.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1.0),
            
            bottomAnchor.constraint(equalToSystemSpacingBelow: contentView.bottomAnchor, multiplier: 1.0),
            contentView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1.0),
            trailingAnchor.constraint(equalToSystemSpacingAfter: contentView.trailingAnchor, multiplier: 1.0),
        ])
    }
}
