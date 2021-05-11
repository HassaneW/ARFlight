//
//  FlightResultTableViewCell.swift
//  ARFlight
//
//  Created by Wandianga hassane on 2021-04-06.
//

import UIKit

import Foundation

extension Date {
    func timeString(ofStyle style: DateFormatter.Style = .short) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = style
        dateFormatter.dateStyle = .none
        return dateFormatter.string(from: self)
    }
    
    func dateTimeString(ofDateStyle dateStyle: DateFormatter.Style = .medium, timeStyle: DateFormatter.Style = .short) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = timeStyle
        dateFormatter.dateStyle = dateStyle
        return dateFormatter.string(from: self)
    }
}

class FlightResultTableViewCell: UITableViewCell {
    
    var flight: Flight? {
        didSet {
            companyCode.text = flight?.company?.code
            flightCode.text = flight?.flightNumber
            departureTime.text = flight?.departureDate?.timeString()
            timeArrived.text = flight?.arrivalDateTime?.timeString()
            departureAirport.text = flight?.departureAirportName
            airportArrival.text = flight?.arrivalAirportName
        }
    }
    
    //    private func configureView(with flight: Flight?) {
    //        companyCode.text = flightCompanyCode?.company?.code
    //        codeVol.text = flightcodeVol?.flightNumber
    //    }
    
    
    private let companyCode = UILabel()
    private let
        flightCode = UILabel()
    private let departureTime = UILabel()
    private let departureAirport = UILabel()
    private let airportArrival = UILabel()
    private let timeArrived = UILabel()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // CompanyCode
        let labelCompanyCode = UILabel(text: "Company Code")
        labelCompanyCode.configureFlightDetailsInformationLabel()
        
        companyCode.font = UIFont.preferredFont(forTextStyle: .body)
        companyCode.textColor = UIColor.label
        companyCode.adjustsFontForContentSizeCategory = true
        companyCode.translatesAutoresizingMaskIntoConstraints = false
        
        let companyCodeStackView = UIStackView(arrangedSubviews: [labelCompanyCode, companyCode],
                                               axis: .vertical,
                                               spacing: UIStackView.spacingUseSystem,
                                               alignment: .center,
                                               distribution: .equalSpacing)
        
        // CodeVol
        let labelFlightCode = UILabel(text: "Flight Code")
        labelFlightCode.configureFlightDetailsInformationLabel()
        
        flightCode.font = UIFont.preferredFont(forTextStyle: .body)
        flightCode.textColor = UIColor.label
        flightCode.adjustsFontForContentSizeCategory = true
        flightCode.translatesAutoresizingMaskIntoConstraints = false
        
        let flightCodeStackView = UIStackView(arrangedSubviews: [labelFlightCode, flightCode],
                                              axis: .vertical,
                                              spacing: UIStackView.spacingUseSystem,
                                              alignment: .center,
                                              distribution: .equalSpacing)
        
        // StackView Company + Flight
        let codeFlightCompanyStackView = UIStackView(arrangedSubviews: [companyCodeStackView, flightCodeStackView],
                                                     axis: .horizontal,
                                                     spacing: UIStackView.spacingUseSystem,
                                                     alignment: .firstBaseline,
                                                     distribution: .fillEqually)
        
        // airport Depart
        let labelDepartureAirport = UILabel(text: "Departure Airport")
        labelDepartureAirport.configureFlightDetailsInformationLabel()
        
        departureAirport.font = UIFont.preferredFont(forTextStyle: .body)
        departureAirport.textColor = UIColor.label
        departureAirport.allowsDefaultTighteningForTruncation = true
        departureAirport.adjustsFontForContentSizeCategory = true
        departureAirport.translatesAutoresizingMaskIntoConstraints = false
        
        let departureAirporteStackView = UIStackView(arrangedSubviews: [labelDepartureAirport, departureAirport],
                                                     axis: .vertical,
                                                     spacing: UIStackView.spacingUseSystem,
                                                     alignment: .center,
                                                     distribution: .equalSpacing)
        
        // Hour Depart
        
        let labelDepartureTime = UILabel(text: "Departure Time")
        labelDepartureTime.configureFlightDetailsInformationLabel()
        
        departureTime.font = UIFont.preferredFont(forTextStyle: .body)
        departureTime.textColor = UIColor.label
        departureTime.allowsDefaultTighteningForTruncation = true
        departureTime.adjustsFontForContentSizeCategory = true
        departureTime.translatesAutoresizingMaskIntoConstraints = false
        
        let departureTimeStackView = UIStackView(arrangedSubviews: [labelDepartureTime, departureTime],
                                                 axis: .vertical,
                                                 spacing: UIStackView.spacingUseSystem,
                                                 alignment: .center,
                                                 distribution: .equalSpacing)
        
        let departureAirportTimeStackView = UIStackView(arrangedSubviews: [departureAirporteStackView, departureTimeStackView],
                                                        axis: .horizontal,
                                                        spacing: UIStackView.spacingUseSystem,
                                                        alignment: .firstBaseline,
                                                        distribution: .fillEqually)
        
        // Aiport Arrive
        let labelairportArrival = UILabel(text: "Arrival Airport")
        labelairportArrival.configureFlightDetailsInformationLabel()
        
        airportArrival.font = UIFont.preferredFont(forTextStyle: .body)
        airportArrival.textColor = UIColor.label
        airportArrival.numberOfLines = 0
        airportArrival.allowsDefaultTighteningForTruncation = true
        airportArrival.adjustsFontForContentSizeCategory = true
        airportArrival.translatesAutoresizingMaskIntoConstraints = false
        
        let arrivaleAirporteStackView = UIStackView(arrangedSubviews: [labelairportArrival, airportArrival],
                                                    axis: .vertical,
                                                    spacing: UIStackView.spacingUseSystem,
                                                    alignment: .center,
                                                    distribution: .equalSpacing)
        
        // scheduled
        let labeltimeArrived = UILabel(text: "Arrival Time")
        labeltimeArrived.configureFlightDetailsInformationLabel()
        
        timeArrived.font = UIFont.preferredFont(forTextStyle: .body)
        timeArrived.textColor = UIColor.label
        timeArrived.allowsDefaultTighteningForTruncation = true
        timeArrived.adjustsFontForContentSizeCategory = true
        timeArrived.translatesAutoresizingMaskIntoConstraints = false
        
        let arrivedTimeStackView = UIStackView(arrangedSubviews: [labeltimeArrived, timeArrived],
                                               axis: .vertical,
                                               spacing: UIStackView.spacingUseSystem,
                                               alignment: .center,
                                               distribution: .equalSpacing)
        
        let arrivedAirportTimeStackView = UIStackView(arrangedSubviews: [arrivaleAirporteStackView, arrivedTimeStackView],
                                                      axis: .horizontal,
                                                      spacing: UIStackView.spacingUseSystem,
                                                      alignment: .firstBaseline,
                                                      distribution: .fillEqually)
        
        let contentStackView = UIStackView(arrangedSubviews: [codeFlightCompanyStackView,departureAirportTimeStackView, arrivedAirportTimeStackView])
        contentStackView.alignment = .fill
        contentStackView.spacing = UIStackView.spacingUseSystem
        contentStackView.distribution = .fill
        contentStackView.axis = .vertical
        contentStackView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(contentStackView)
        
        NSLayoutConstraint.activate([
            contentStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            contentStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            contentStackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            contentStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
            
        ])
        
        // Debug Color
        
        labelCompanyCode.backgroundColor = .red
        companyCode.backgroundColor = .yellow
        labelFlightCode.backgroundColor = .blue
        flightCode.backgroundColor = .purple
        labelDepartureAirport.backgroundColor = .brown
        departureAirport.backgroundColor = .darkGray
        labelDepartureTime.backgroundColor = .green
        departureTime.backgroundColor = .magenta
        labelairportArrival.backgroundColor = .orange
        airportArrival.backgroundColor = .blue
        labeltimeArrived.backgroundColor = .cyan
        timeArrived.backgroundColor = .red
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
