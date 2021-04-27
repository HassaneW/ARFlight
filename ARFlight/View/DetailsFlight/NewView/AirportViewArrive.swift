//
//  AirportViewArrive.swift
//  ARFlight
//
//  Created by Wandianga hassane on 2021-04-27.
//

import Foundation
import UIKit




class AirportViewArrive: UIView {
    
    
    
    var flight: Flight? {
        didSet {
            resultArrivalAirport.text =  flight?.arrivalCodeAirport
            resultHourArrival.text = flight?.arrivalDateTime?.timeString()
            titleLabelArrival.text = flight?.arrivalTerminalAirport ?? " - "
            
        }
    }
    
    
    private let titleLabelArrival = UILabel()
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
        
        let contentViewArrival = UIStackView(arrangedSubviews: [arrivalStackView, resultStackView])
        
        contentViewArrival.axis = .vertical
        contentViewArrival.alignment = .fill
        contentViewArrival.distribution = .fill
        contentViewArrival.spacing = 30
        contentViewArrival.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(contentViewArrival)
        
        let LabelTerminalArrival = UILabel()
        LabelTerminalArrival.text = "Terminal Arrival"
        LabelTerminalArrival.numberOfLines = 0
        LabelTerminalArrival.font = UIFont.preferredFont(forTextStyle: .headline)
        LabelTerminalArrival.textColor = .cyan
        LabelTerminalArrival.adjustsFontForContentSizeCategory = true
        LabelTerminalArrival.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabelArrival.text = title
        titleLabelArrival.numberOfLines = 0
        titleLabelArrival.font = UIFont
            .preferredFont(forTextStyle: .headline)
        titleLabelArrival.textAlignment = .center
        titleLabelArrival.textColor = .label
        titleLabelArrival.adjustsFontForContentSizeCategory = true
        titleLabelArrival.translatesAutoresizingMaskIntoConstraints = false
        
        
        let contentViewTerminal = UIStackView(arrangedSubviews: [LabelTerminalArrival,titleLabelArrival])
        
        contentViewTerminal.axis = .vertical
        contentViewTerminal.alignment = .fill
        contentViewTerminal.spacing = UIStackView.spacingUseSystem
        contentViewTerminal.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(contentViewTerminal)
        
        let contentStackView = UIStackView(arrangedSubviews: [contentViewArrival, contentViewTerminal])
        contentStackView.axis = .vertical
        contentStackView.alignment = .fill
        contentStackView.spacing = 20
        contentStackView.translatesAutoresizingMaskIntoConstraints = false
        
        let scrollView = UIScrollView()
        scrollView.addSubview(contentStackView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentStackView.addSubview(scrollView)
        
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: contentStackView.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: contentStackView.safeAreaLayoutGuide.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: contentStackView.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: contentStackView.safeAreaLayoutGuide.bottomAnchor),
            scrollView.trailingAnchor.constraint(equalToSystemSpacingAfter: contentStackView.trailingAnchor, multiplier: 1.5),
            scrollView.bottomAnchor.constraint(equalToSystemSpacingBelow: contentStackView.bottomAnchor, multiplier: 1.0),
            
            contentStackView.centerXAnchor.constraint(equalTo: contentStackView.safeAreaLayoutGuide.centerXAnchor),
            contentStackView.topAnchor.constraint(equalToSystemSpacingBelow: scrollView.topAnchor, multiplier: 2),
            contentStackView.leadingAnchor.constraint(equalToSystemSpacingAfter: scrollView.leadingAnchor, multiplier: 1.5)
        ])
    }
}
