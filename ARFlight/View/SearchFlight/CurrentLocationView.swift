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
        myImageSearch.contentMode = UIView.ContentMode.left
        myImageSearch.contentMode = UIView.ContentMode.scaleAspectFit
        myImageSearch.image = imageSearch
        
//        myImageSearch.setContentHuggingPriority(.defaultHigh, for: .vertical)
//        myImageSearch.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        
        // Title Label Current
        let labelTitle = UILabel()
        labelTitle.text = "Current"
        labelTitle.numberOfLines = 0
        labelTitle.font = UIFont
            .preferredFont(forTextStyle: .title1)
        labelTitle.textAlignment = .center
        labelTitle.textColor = .black
        labelTitle.adjustsFontForContentSizeCategory = true
        
        // Switch Current
        
        let currentSwitch = UISwitch()
        currentSwitch.setOn(false, animated: false)
        currentSwitch.tintColor = UIColor.blue
        currentSwitch.onTintColor = UIColor.cyan
        currentSwitch.thumbTintColor = UIColor.red
        
       //               currentSwitch.addTarget(self, action: #selector(switchChanged(sender:)), for: UIControlEvents.valueChanged)

        let contentView = UIStackView(arrangedSubviews: [myImageSearch, labelTitle, currentSwitch])
        contentView.axis = .horizontal
        contentView.alignment = .leading
        contentView.distribution = .fill
        contentView.spacing = UIStackView.spacingUseSystem
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(contentView)
        
        // Debug colors
        myImageSearch.backgroundColor = .yellow
        labelTitle.backgroundColor = .tertiaryLabel
        currentSwitch.backgroundColor = .brown
        
        NSLayoutConstraint.activate([

            contentView.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1.0),
            
            bottomAnchor.constraint(equalToSystemSpacingBelow: contentView.bottomAnchor, multiplier: 1.0),
            contentView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1.0),
            trailingAnchor.constraint(equalToSystemSpacingAfter: contentView.trailingAnchor, multiplier: 1.0),
        ])
    }
}
