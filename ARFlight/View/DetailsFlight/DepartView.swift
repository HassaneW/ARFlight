//
//  DepartView.swift
//  ARFlight
//
//  Created by Wandianga hassane on 2021-04-09.
//


import UIKit

final class DepartView: UIView  {
    
    
    //    var titleCompany: String? {
    //        didSet {
    //            titleLabel.text = titleCompany
    //        }
    //    }
        
        var titleDepartAirport: String? {
            didSet {
                resultDepartAirport.text = titleDepartAirport
            }
        }
        
        var titleHour: String? {
            didSet {
                resultHourDepart.text = titleHour
            }
        }
        

    //    private let titleLabel = UILabel()
        private let resultDepartAirport = UILabel()
        private let resultHourDepart = UILabel()

        override init(frame: CGRect) {
            super.init(frame: frame)
            setupView()
        }
        
        required init?(coder: NSCoder) {
            super.init(coder: coder)
            setupView()
        }
        
        private func setupView(withTitle title: String? = nil) {
            
            let labelAirportDepart = UILabel()
            labelAirportDepart.text = "Airport Depart"
            labelAirportDepart.numberOfLines = 0
            labelAirportDepart.font = UIFont
                .preferredFont(forTextStyle: .headline)
            labelAirportDepart.textAlignment = .center
            labelAirportDepart.textColor = .black
            labelAirportDepart.adjustsFontForContentSizeCategory = true
            
            let labelHeureDepart = UILabel()
            labelHeureDepart.text = "Heure Depart"
            labelHeureDepart.numberOfLines = 0
            labelHeureDepart.font = UIFont
                .preferredFont(forTextStyle: .headline)
            labelHeureDepart.textAlignment = .center
            labelHeureDepart.textColor = .black
            labelHeureDepart.adjustsFontForContentSizeCategory = true
            
            let departStackView = UIStackView(arrangedSubviews: [labelAirportDepart, labelHeureDepart])
            departStackView.axis = .horizontal
            departStackView.alignment = .fill
            departStackView.spacing = UIStackView.spacingUseSystem
            departStackView.translatesAutoresizingMaskIntoConstraints = false
      
            resultDepartAirport.text = title
            resultDepartAirport.numberOfLines = 0
            resultDepartAirport.font = UIFont
                .preferredFont(forTextStyle: .headline)
            resultDepartAirport.textAlignment = .center
            resultDepartAirport.textColor = .label
            resultDepartAirport.adjustsFontForContentSizeCategory = true
            resultDepartAirport.translatesAutoresizingMaskIntoConstraints = false
            
            resultHourDepart.text = title
            resultHourDepart.numberOfLines = 0
            resultHourDepart.font = UIFont
                .preferredFont(forTextStyle: .headline)
            resultHourDepart.textAlignment = .center
            resultHourDepart.textColor = .label
            resultHourDepart.adjustsFontForContentSizeCategory = true
            resultHourDepart.translatesAutoresizingMaskIntoConstraints = false
            
            let resultStackView = UIStackView(arrangedSubviews: [resultDepartAirport,resultHourDepart])
            resultStackView.axis = .horizontal
            resultStackView.alignment = .fill
            resultStackView.spacing = UIStackView.spacingUseSystem
            resultStackView.translatesAutoresizingMaskIntoConstraints = false
            
            let contentView = UIStackView(arrangedSubviews: [departStackView, resultStackView])
            
            contentView.axis = .vertical
            contentView.alignment = .fill
                contentView.distribution = .fill
            contentView.spacing = 30
            contentView.translatesAutoresizingMaskIntoConstraints = false
                
                addSubview(contentView)
            
            addSubview(contentView)
            
            // Debug colors
    //        titleLabel.backgroundColor = .yellow
    //        labelCodeFlight.backgroundColor = .tertiaryLabel
    //        labelFlightType.backgroundColor = .brown
    //
            NSLayoutConstraint.activate([

                contentView.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1.0),
                
                bottomAnchor.constraint(equalToSystemSpacingBelow: contentView.bottomAnchor, multiplier: 1.0),
                contentView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1.0),
                trailingAnchor.constraint(equalToSystemSpacingAfter: contentView.trailingAnchor, multiplier: 1.0),
            ])
        }
    }


