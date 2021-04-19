//
//  NotificationCalendarView.swift
//  ARFlight
//
//  Created by Wandianga hassane on 2021-04-10.
//

import UIKit

final class NotificationCalendarView: UIView  {


    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView(withTitle title: String? = nil) {
        
      
        // Title Label Notification
        let labelNotification = UILabel()
        labelNotification.text = "Notification "
        labelNotification.numberOfLines = 0
        labelNotification.font = UIFont
            .preferredFont(forTextStyle: .headline)
        labelNotification.textAlignment = .center
        labelNotification.textColor = .black
        labelNotification.adjustsFontForContentSizeCategory = true
        
        // Title Label Calendar
        let labelCalendar = UILabel()
        labelCalendar.text = "Add Calendar"
        labelCalendar.numberOfLines = 0
        labelCalendar.font = UIFont
            .preferredFont(forTextStyle: .headline)
        labelCalendar.textAlignment = .center
        labelCalendar.textColor = .black
        labelCalendar.adjustsFontForContentSizeCategory = true
        
        let titleStackView = UIStackView(arrangedSubviews: [labelNotification, labelCalendar])
        titleStackView.axis = .horizontal
        titleStackView.alignment = .fill
        titleStackView.spacing = UIStackView.spacingUseSystem
        titleStackView.translatesAutoresizingMaskIntoConstraints = false
        
        // Image Notification
        let imageNotification = UIImage(systemName: "bell.circle.fill")
        let myImageNotification:UIImageView = UIImageView()
        myImageNotification.contentMode = UIView.ContentMode.left
        myImageNotification.contentMode = UIView.ContentMode.scaleAspectFit
        myImageNotification.image = imageNotification
        
        // Button Calendar
        let buttonAddCalendar = UIButton()
        buttonAddCalendar.setImage(UIImage(systemName: "calendar.badge.plus"), for: .normal);        buttonAddCalendar.clipsToBounds = true
        buttonAddCalendar.layer.cornerRadius = 12
        buttonAddCalendar.layer.borderWidth = 1.0
        buttonAddCalendar.layer.borderColor = UIColor.blue.cgColor
        backgroundColor = UIColor.purple
        
        let resultStackView = UIStackView(arrangedSubviews: [myImageNotification,buttonAddCalendar])
        
        resultStackView.axis = .horizontal
        resultStackView.alignment = .fill
        resultStackView.distribution = .fillProportionally
        resultStackView.spacing = UIStackView.spacingUseSystem
        resultStackView.translatesAutoresizingMaskIntoConstraints = false

        let contentView = UIStackView(arrangedSubviews: [titleStackView, resultStackView])
        
        contentView.axis = .vertical
        contentView.alignment = .fill
        contentView.distribution = .fillProportionally
        contentView.spacing = UIStackView.spacingUseSystem
        contentView.translatesAutoresizingMaskIntoConstraints = false

        addSubview(contentView)
        
        // Debug colors
//        myImageCalendar.backgroundColor = .yellow
//        labelCalendar.backgroundColor = .quaternaryLabel
        
        
        NSLayoutConstraint.activate([

            contentView.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1.0),
            
            bottomAnchor.constraint(equalToSystemSpacingBelow: contentView.bottomAnchor, multiplier: 1.0),
            contentView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1.0),
            trailingAnchor.constraint(equalToSystemSpacingAfter: contentView.trailingAnchor, multiplier: 1.0),
        ])
    }
}
