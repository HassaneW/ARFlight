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
        
        let imageNotification = UIImage(systemName: "bell.circle.fill")
        let myImageNotification:UIImageView = UIImageView()
        myImageNotification.contentMode = UIView.ContentMode.left
        myImageNotification.contentMode = UIView.ContentMode.scaleAspectFit
        myImageNotification.image = imageNotification
        
        // Title Label Current
        let labelNotification = UILabel()
        labelNotification.text = "Notification "
        labelNotification.numberOfLines = 0
        labelNotification.font = UIFont
            .preferredFont(forTextStyle: .headline)
        labelNotification.textAlignment = .center
        labelNotification.textColor = .black
        labelNotification.adjustsFontForContentSizeCategory = true
        
        let buttonAddCalendar = UIButton()
        buttonAddCalendar.clipsToBounds = true
        buttonAddCalendar.layer.cornerRadius = 12
        buttonAddCalendar.layer.borderWidth = 1.0
        buttonAddCalendar.layer.borderColor = UIColor.red.cgColor
        backgroundColor = UIColor.purple
        
        
        let contentView = UIStackView(arrangedSubviews: [myImageNotification, labelNotification,buttonAddCalendar])
        contentView.axis = .horizontal
        contentView.alignment = .fill
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
