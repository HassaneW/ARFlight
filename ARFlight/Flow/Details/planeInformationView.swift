//
//  planeInformationView.swift
//  ARFlight
//
//  Created by Wandianga hassane on 2021-04-26.
//

import Foundation
import UIKit



final class PlaneInformationView: UIView  {
    
    var plane: Plane? {
        didSet {
            guard let plane = plane else { return }
            configureViewWithPlane(plane)
        }
    }
    
    private let titlePlane = UILabel()
    private let imageView = UIImageView()
    
    private let resultvitesse = UILabel()
    private let resultLongeur = UILabel()
    private let resultTypeDeMoteur = UILabel()
    private let resultNombreDeSiege = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView() {
        
        titlePlane.configureFlightDetailsInformationLabel()
        titlePlane.font = .preferredFont(forTextStyle: .largeTitle)
        
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        let titlePlaneStackView = UIStackView(arrangedSubviews: [titlePlane, imageView],
                                              axis: .vertical,
                                              spacing: UIStackView.spacingUseSystem,
                                              alignment: .center,
                                              distribution: .equalSpacing)
        addSubview(titlePlaneStackView)
        
        let labelTypeDeMoteur = UILabel(text: "Type de Moteur")
        configureTitleLabel(labelTypeDeMoteur)
        resultTypeDeMoteur.configureFlightDetailsInformationLabel()
        
        let typeMoteurStackView = UIStackView(arrangedSubviews: [labelTypeDeMoteur, resultTypeDeMoteur],
                                              axis: .vertical,
                                              spacing: UIStackView.spacingUseSystem,
                                              alignment: .center,
                                              distribution: .equalSpacing)
        addSubview(typeMoteurStackView)
        
        let labelNombreDeSiege = UILabel(text: "Nombre de sieges")
        configureTitleLabel(labelNombreDeSiege)
        resultNombreDeSiege.configureFlightDetailsInformationLabel()
        
        let nombreDeSiegeStackView = UIStackView(arrangedSubviews: [labelNombreDeSiege, resultNombreDeSiege],
                                                 axis: .vertical,
                                                 spacing: UIStackView.spacingUseSystem,
                                                 alignment: .center,
                                                 distribution: .equalSpacing)
        addSubview(nombreDeSiegeStackView)
        
        let moteurSiegeStackView = UIStackView(arrangedSubviews: [typeMoteurStackView, nombreDeSiegeStackView],
                                               axis: .horizontal,
                                               spacing: UIStackView.spacingUseSystem,
                                               alignment: .firstBaseline,
                                               distribution: .fillEqually)
        addSubview(moteurSiegeStackView)
        
        let labelVitesseDeCroisiere = UILabel(text: "Vitesse de Croisiere")
        configureTitleLabel(labelVitesseDeCroisiere)
        resultvitesse.configureFlightDetailsInformationLabel()
        
        let vitesseStackView = UIStackView(arrangedSubviews: [labelVitesseDeCroisiere, resultvitesse],
                                           axis: .vertical,
                                           spacing: UIStackView.spacingUseSystem,
                                           alignment: .center,
                                           distribution: .equalSpacing)
        addSubview(vitesseStackView)
        
        let labelLongeurPlane = UILabel(text: "Longeur Plane")
        configureTitleLabel(labelLongeurPlane)
        resultLongeur.configureFlightDetailsInformationLabel()
        
        let longeurPlaneStackView = UIStackView(arrangedSubviews: [labelLongeurPlane, resultLongeur],
                                                axis: .vertical,
                                                spacing: UIStackView.spacingUseSystem,
                                                alignment: .center,
                                                distribution: .equalSpacing)
        
        addSubview(longeurPlaneStackView)
        
        let longeurVitesseeStackView = UIStackView(arrangedSubviews: [vitesseStackView, longeurPlaneStackView],
                                                   axis: .horizontal,
                                                   spacing: UIStackView.spacingUseSystem,
                                                   alignment: .firstBaseline,
                                                   distribution: .fillEqually)
        addSubview(longeurVitesseeStackView)
        
        let labelNotification = UILabel(text: "Notification")
        configureTitleLabel(labelNotification)
        resultLongeur.configureFlightDetailsInformationLabel()
        
        let imageNotification = UIImage(systemName: "bell.circle.fill")
        let myImageNotification:UIImageView = UIImageView()
        myImageNotification.contentMode = UIView.ContentMode.scaleAspectFit
        myImageNotification.image = imageNotification
        
        let notificationStackView = UIStackView(arrangedSubviews: [labelNotification, myImageNotification],
                                                axis: .vertical,
                                                spacing: UIStackView.spacingUseSystem,
                                                alignment: .center,
                                                distribution: .equalSpacing)
        
        addSubview(notificationStackView)
        
        let labelCalendar = UILabel(text: "Add Calendar")
        configureTitleLabel(labelCalendar)
        
        // Button Calendar
        let buttonAddCalendar = UIButton()
        buttonAddCalendar.setImage(UIImage(systemName: "calendar.badge.plus"), for: .normal);
        buttonAddCalendar.clipsToBounds = true
        buttonAddCalendar.layer.cornerRadius = 12
        buttonAddCalendar.layer.borderWidth = 1.0
        buttonAddCalendar.layer.borderColor = UIColor.blue.cgColor
        backgroundColor = UIColor.purple
        
        let calendarStackView = UIStackView(arrangedSubviews: [labelCalendar, buttonAddCalendar],
                                            axis: .vertical,
                                            spacing: UIStackView.spacingUseSystem,
                                            alignment: .center,
                                            distribution: .equalSpacing)
        
        addSubview(calendarStackView)
        
        let notificationCalendarStackView = UIStackView(arrangedSubviews: [notificationStackView, calendarStackView],
                                                        axis: .horizontal,
                                                        spacing: UIStackView.spacingUseSystem,
                                                        alignment: .firstBaseline,
                                                        distribution: .fillProportionally)
        
        addSubview(notificationCalendarStackView)
        
        let contentStackView = UIStackView(arrangedSubviews: [titlePlaneStackView, moteurSiegeStackView, longeurVitesseeStackView, notificationCalendarStackView])
        contentStackView.axis = .vertical
        contentStackView.alignment = .fill
        contentStackView.spacing = 20
        contentStackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(contentStackView)
        
        NSLayoutConstraint.activate([
            
            imageView.widthAnchor.constraint(equalToConstant: 150),
            imageView.heightAnchor.constraint(equalToConstant: 150),
            
            myImageNotification.widthAnchor.constraint(equalToConstant: 50),
            myImageNotification.heightAnchor.constraint(equalToConstant: 50),
            
            buttonAddCalendar.widthAnchor.constraint(equalToConstant: 50),
            buttonAddCalendar.heightAnchor.constraint(equalToConstant: 50),
            
            contentStackView.topAnchor.constraint(equalToSystemSpacingBelow: safeAreaLayoutGuide.topAnchor, multiplier: 1.0),
            contentStackView.leadingAnchor.constraint(equalToSystemSpacingAfter: safeAreaLayoutGuide.leadingAnchor, multiplier: 1.5),
            safeAreaLayoutGuide.trailingAnchor.constraint(equalToSystemSpacingAfter: contentStackView.trailingAnchor, multiplier: 1.5),
            safeAreaLayoutGuide.bottomAnchor.constraint(equalToSystemSpacingBelow: contentStackView.bottomAnchor, multiplier: 1.0)
        ])
    }
    private  func configureViewWithPlane(_ plane: Plane) {
        titlePlane.text = plane.id
        resultTypeDeMoteur.text = plane.motorType
        resultNombreDeSiege.text = plane.numberOfSeats
        resultvitesse.text = plane.cruisingSpeed
        resultLongeur.text = "\(plane.length)"
        imageView.image = UIImage(named: plane.image)
    }
    func configureTitleLabel(_ label: UILabel) {
        //        label.text = title
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .label
        label.adjustsFontSizeToFitWidth = true
        label.adjustsFontForContentSizeCategory = true
        label.font = .preferredFont(forTextStyle: .headline)
    }
}


/*
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
 buttonAddCalendar.setImage(UIImage(systemName: "calendar.badge.plus"), for: .normal);
 buttonAddCalendar.clipsToBounds = true
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
 */
