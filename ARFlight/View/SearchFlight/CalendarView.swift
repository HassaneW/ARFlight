//
//  CalendarView.swift
//  ARFlight
//
//  Created by Wandianga hassane on 2021-04-09.
//

import UIKit

final class CalendarView: UIView  {

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
        
        let imageCalendar = UIImage(systemName: "calendar.circle")
        let myImageCalendar:UIImageView = UIImageView()
        myImageCalendar.contentMode = UIView.ContentMode.left
        myImageCalendar.contentMode = UIView.ContentMode.scaleAspectFit
        myImageCalendar.image = imageCalendar
        
        // Title Label Current
        let labelCalendar = UILabel()
        labelCalendar.text = "Calendar"
        labelCalendar.numberOfLines = 1
        labelCalendar.font = UIFont
            .preferredFont(forTextStyle: .largeTitle)
        labelCalendar.textAlignment = .center
        labelCalendar.font =  UIFont (name: "Helvetica Neue", size: 50)
        labelCalendar.adjustsFontSizeToFitWidth = true
        labelCalendar.textColor = .label
        labelCalendar.adjustsFontForContentSizeCategory = true
        labelCalendar.translatesAutoresizingMaskIntoConstraints = false
        
//        labelCalendar.numberOfLines = 0
//        labelCalendar.font = UIFont
//            .preferredFont(forTextStyle: .largeTitle)
//        labelCalendar.textAlignment = .center
//        labelCalendar.textColor = .black
//        labelCalendar.adjustsFontForContentSizeCategory = true
        
        let contentView = UIStackView(arrangedSubviews: [UIView(),myImageCalendar, labelCalendar, UIView()])
        
                contentView.axis = .horizontal
                contentView.alignment = .center
                contentView.distribution = .equalSpacing
        contentView.spacing = UIStackView.spacingUseSystem
                contentView.translatesAutoresizingMaskIntoConstraints = false
        
//        contentView.axis = .horizontal
//        contentView.alignment = .leading
//        contentView.distribution = .fillProportionally
//        contentView.spacing = UIStackView.spacingUseSystem
//        contentView.translatesAutoresizingMaskIntoConstraints = false
        
//        let routeStackView = UIStackView(arrangedSubviews: [UIView(),myImagePlane, titleLabel, UIView()])
//        routeStackView.axis = .horizontal
//        routeStackView.alignment = .center
//        routeStackView.distribution = .equalSpacing
//        routeStackView.spacing = UIStackView.spacingUseSystem
//        routeStackView.translatesAutoresizingMaskIntoConstraints = false
        
        
        addSubview(contentView)
        
        // Debug colors
        myImageCalendar.backgroundColor = .yellow
        labelCalendar.backgroundColor = .quaternaryLabel
        
        
        NSLayoutConstraint.activate([
            
            myImageCalendar.widthAnchor.constraint(equalToConstant: 50),
            myImageCalendar.heightAnchor.constraint(equalToConstant: 50),
            
            labelCalendar.widthAnchor.constraint(equalToConstant: 150),
            labelCalendar.heightAnchor.constraint(equalToConstant: 80),

            contentView.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1.0),
            
            bottomAnchor.constraint(equalToSystemSpacingBelow: contentView.bottomAnchor, multiplier: 1.0),
            contentView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1.0),
            trailingAnchor.constraint(equalToSystemSpacingAfter: contentView.trailingAnchor, multiplier: 1.0),
        ])
    }
}
