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
//        let labelCompanyCode = UILabel(text: "Company Code")
//        labelCompanyCode.configureFlightDetailsInformationLabel()
//
        companyCode.font = UIFont.preferredFont(forTextStyle: .headline)
        companyCode.textColor = UIColor.label
        companyCode.adjustsFontForContentSizeCategory = true
        companyCode.translatesAutoresizingMaskIntoConstraints = false
//
//        let companyCodeStackView = UIStackView(arrangedSubviews: [labelCompanyCode, companyCode],
//                                               axis: .vertical,
//                                               spacing: UIStackView.spacingUseSystem,
//                                               alignment: .center,
//                                               distribution: .equalSpacing)
        
        // CodeVol
//        let labelFlightCode = UILabel(text: "Flight Code")
//        labelFlightCode.configureFlightDetailsInformationLabel()
//
//        flightCode.font = UIFont.preferredFont(forTextStyle: .body)
//        flightCode.textColor = UIColor.label
//        flightCode.adjustsFontForContentSizeCategory = true
//        flightCode.translatesAutoresizingMaskIntoConstraints = false
//
//        let flightCodeStackView = UIStackView(arrangedSubviews: [labelFlightCode, flightCode],
//                                              axis: .vertical,
//                                              spacing: UIStackView.spacingUseSystem,
//                                              alignment: .center,
//                                              distribution: .equalSpacing)
        
        // StackView Company + Flight
//        let codeFlightCompanyStackView = UIStackView(arrangedSubviews: [companyCodeStackView, flightCodeStackView],
//                                                     axis: .horizontal,
//                                                     spacing: UIStackView.spacingUseSystem,
//                                                     alignment: .firstBaseline,
//                                                     distribution: .fillEqually)
        
        // airport Depart
//        let labelDepartureAirport = UILabel(text: "Departure Airport")
//        labelDepartureAirport.configureFlightDetailsInformationLabel()
        
        
        let labelTextTo = UILabel(text: "TO")
        labelTextTo.textColor = UIColor.label
        labelTextTo.font = UIFont.preferredFont(forTextStyle: .body)
        labelTextTo.allowsDefaultTighteningForTruncation = true
        labelTextTo.adjustsFontForContentSizeCategory = true
        labelTextTo.translatesAutoresizingMaskIntoConstraints = false
        
        
        let arrowshapeImage = UIImage(systemName: "arrowshape.zigzag.forward.fill")
        let arrowshapeImageView = UIImageView(image: arrowshapeImage)
        arrowshapeImageView.contentMode = .scaleAspectFit
 
        let airportImage = UIImage(systemName: "airplane.circle.fill")
        let leadingAirportImageView = UIImageView(image: airportImage)
        leadingAirportImageView.contentMode = .scaleAspectFit
        
        departureAirport.font = UIFont.preferredFont(forTextStyle: .body)
        departureAirport.numberOfLines = 0
        departureAirport.textColor = UIColor.label
        departureAirport.allowsDefaultTighteningForTruncation = true
        departureAirport.adjustsFontForContentSizeCategory = true
        departureAirport.translatesAutoresizingMaskIntoConstraints = false
        
        airportArrival.font = UIFont.preferredFont(forTextStyle: .body)
        airportArrival.textColor = UIColor.label
        airportArrival.numberOfLines = 0
        airportArrival.allowsDefaultTighteningForTruncation = true
        airportArrival.adjustsFontForContentSizeCategory = true
        airportArrival.translatesAutoresizingMaskIntoConstraints = false
        
        
//        labelDepartureAirport,
        let nameAirportTripStackView = UIStackView(arrangedSubviews: [leadingAirportImageView, departureAirport,labelTextTo,airportArrival],
                                                   axis: .horizontal,
                                                   spacing: 8,
                                                   alignment: .firstBaseline,
                                                   distribution: .equalSpacing)
       //
        
        // Hour Depart
        
//        let labelDepartureTime = UILabel(text: "Departure Time")
//        labelDepartureTime.configureFlightDetailsInformationLabel()
        
        let timeImage = UIImage(systemName: "timer")
        let leadingTimeImageView = UIImageView(image: timeImage)
        leadingTimeImageView.contentMode = .scaleAspectFit
        
        departureTime.font = UIFont.preferredFont(forTextStyle: .body)
        departureTime.textColor = UIColor.label
        departureTime.allowsDefaultTighteningForTruncation = true
        departureTime.adjustsFontForContentSizeCategory = true
        departureTime.translatesAutoresizingMaskIntoConstraints = false
        
        timeArrived.font = UIFont.preferredFont(forTextStyle: .body)
        timeArrived.textColor = UIColor.label
        timeArrived.allowsDefaultTighteningForTruncation = true
        timeArrived.adjustsFontForContentSizeCategory = true
        timeArrived.translatesAutoresizingMaskIntoConstraints = false
        
//        labelDepartureTime,
        let timeTripStackView = UIStackView(arrangedSubviews: [leadingTimeImageView, timeArrived,arrowshapeImageView, departureTime],
                                            axis: .horizontal,
                                            spacing: UIStackView.spacingUseSystem,
                                            alignment: .firstBaseline,
                                            distribution: .equalSpacing)
//
//        let departureAirportTimeStackView = UIStackView(arrangedSubviews: [NameAirportTripStackView, timeTripStackView],
//                                                        axis: .horizontal,
//                                                        spacing: UIStackView.spacingUseSystem,
//                                                        alignment: .firstBaseline,
//                                                        distribution: .fillEqually)
        
        // Aiport Arrive
//        let labelairportArrival = UILabel(text: "Arrival Airport")
//        labelairportArrival.configureFlightDetailsInformationLabel()
        
//        airportArrival.font = UIFont.preferredFont(forTextStyle: .body)
//        airportArrival.textColor = UIColor.label
//        airportArrival.numberOfLines = 0
//        airportArrival.allowsDefaultTighteningForTruncation = true
//        airportArrival.adjustsFontForContentSizeCategory = true
//        airportArrival.translatesAutoresizingMaskIntoConstraints = false
        
//        labelairportArrival,
//        let arrivaleAirporteStackView = UIStackView(arrangedSubviews: [airportArrival],
//                                                    axis: .vertical,
//                                                    spacing: UIStackView.spacingUseSystem,
//                                                    alignment: .center,
//                                                    distribution: .equalSpacing)
        
        // scheduled
//        let labeltimeArrived = UILabel(text: "Arrival Time")
//        labeltimeArrived.configureFlightDetailsInformationLabel()
        
//        timeArrived.font = UIFont.preferredFont(forTextStyle: .body)
//        timeArrived.textColor = UIColor.label
//        timeArrived.allowsDefaultTighteningForTruncation = true
//        timeArrived.adjustsFontForContentSizeCategory = true
//        timeArrived.translatesAutoresizingMaskIntoConstraints = false
        
//        labeltimeArrived
//        let arrivedTimeStackView = UIStackView(arrangedSubviews: [timeArrived],
//                                               axis: .vertical,
//                                               spacing: UIStackView.spacingUseSystem,
//                                               alignment: .center,
//                                               distribution: .equalSpacing)
//
//        let arrivedAirportTimeStackView = UIStackView(arrangedSubviews: [arrivaleAirporteStackView, arrivedTimeStackView],
//                                                      axis: .horizontal,
//                                                      spacing: UIStackView.spacingUseSystem,
//                                                      alignment: .firstBaseline,
//                                                      distribution: .fillEqually)
        
//         codeFlightCompanyStackView,departureAirportTimeStackView, arrivedAirportTimeStackView
        let contentStackView = UIStackView(arrangedSubviews: [companyCode, nameAirportTripStackView, timeTripStackView])
        contentStackView.alignment = .fill
        contentStackView.spacing = UIStackView.spacingUseSystem
        contentStackView.distribution = .equalSpacing
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
        
        labelTextTo.backgroundColor = .yellow
//        labelCompanyCode.backgroundColor = .red
//        companyCode.backgroundColor = .yellow
//        labelFlightCode.backgroundColor = .blue
        flightCode.backgroundColor = .purple
//        labelDepartureAirport.backgroundColor = .brown
        departureAirport.backgroundColor = .darkGray
//        labelDepartureTime.backgroundColor = .green
        departureTime.backgroundColor = .magenta
//        labelairportArrival.backgroundColor = .orange
        airportArrival.backgroundColor = .blue
//        labeltimeArrived.backgroundColor = .cyan
        timeArrived.backgroundColor = .red
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
