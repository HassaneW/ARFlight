//
//  ArrivalView.swift
//  ARFlight
//
//  Created by Wandianga hassane on 2021-04-09.
//

import UIKit

final class ArrivalView: UIView  {


//    var titleCompany: String? {
//        didSet {
//            titleLabel.text = titleCompany
//        }
//    }
    
    var titleArrivalAirport: String? {
        didSet {
            resultArrivalAirport.text = titleArrivalAirport
        }
    }
    
    var titleHour: String? {
        didSet {
            resultHourArrival.text = titleHour
        }
    }
    

//    private let titleLabel = UILabel()
    private let resultArrivalAirport = UILabel()
    private let resultHourArrival = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView(withTitle title: String? = nil) {
        
        let labelAirportArrival = UILabel()
        labelAirportArrival.text = "Airport Arrival"
        labelAirportArrival.numberOfLines = 0
        labelAirportArrival.font = UIFont
            .preferredFont(forTextStyle: .headline)
        labelAirportArrival.textAlignment = .center
        labelAirportArrival.textColor = .black
        labelAirportArrival.adjustsFontForContentSizeCategory = true
        
        let labelHeureArrival = UILabel()
        labelHeureArrival.text = "Heure Arrivee"
        labelHeureArrival.numberOfLines = 0
        labelHeureArrival.font = UIFont
            .preferredFont(forTextStyle: .headline)
        labelHeureArrival.textAlignment = .center
        labelHeureArrival.textColor = .black
        labelHeureArrival.adjustsFontForContentSizeCategory = true
        
        let arrivalStackView = UIStackView(arrangedSubviews: [labelAirportArrival, labelHeureArrival])
        arrivalStackView.axis = .horizontal
        arrivalStackView.alignment = .fill
        arrivalStackView.spacing = UIStackView.spacingUseSystem
        arrivalStackView.translatesAutoresizingMaskIntoConstraints = false
  
        resultArrivalAirport.text = title
        resultArrivalAirport.numberOfLines = 0
        resultArrivalAirport.font = UIFont
            .preferredFont(forTextStyle: .headline)
        resultArrivalAirport.textAlignment = .center
        resultArrivalAirport.textColor = .label
        resultArrivalAirport.adjustsFontForContentSizeCategory = true
        resultArrivalAirport.translatesAutoresizingMaskIntoConstraints = false
        
        resultHourArrival.text = title
        resultHourArrival.numberOfLines = 0
        resultHourArrival.font = UIFont
            .preferredFont(forTextStyle: .headline)
        resultHourArrival.textAlignment = .center
        resultHourArrival.textColor = .label
        resultHourArrival.adjustsFontForContentSizeCategory = true
        resultHourArrival.translatesAutoresizingMaskIntoConstraints = false
        
        let resultStackView = UIStackView(arrangedSubviews: [resultArrivalAirport,resultHourArrival])
        resultStackView.axis = .horizontal
        resultStackView.alignment = .fill
        resultStackView.spacing = UIStackView.spacingUseSystem
        resultStackView.translatesAutoresizingMaskIntoConstraints = false
        
        let contentView = UIStackView(arrangedSubviews: [arrivalStackView, resultStackView])
        
        contentView.axis = .vertical
        contentView.alignment = .fill
            contentView.distribution = .fill
        contentView.spacing = 30
        contentView.translatesAutoresizingMaskIntoConstraints = false

        addSubview(contentView)
//        contentView.axis = .horizontal
//        contentView.alignment = .fill
//        contentView.spacing = UIStackView.spacingUseSystem
//        contentView.translatesAutoresizingMaskIntoConstraints = false
//
//
//        addSubview(contentView)
//
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


