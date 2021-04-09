//
//  FlightResultTableViewCell.swift
//  ARFlight
//
//  Created by Wandianga hassane on 2021-04-06.
//

import UIKit

/*
 
 // Modele :
 
 /*
 1)
 Code vol (Identifiant vol) :
 Flight -> flightNumber;
 
 2)
 Code Company:
 Flight -> company -> code
 
 3)
 Airport Depart:
 FlightLegs -> departure -> Airport Location -> latitude, longitude
 
 Airport Arrivée:
 FlightLegs -> arrival -> Airport Location -> latitude, longitude
 
 4)
 Heure Départ
 Flight -> departureDate
 
 5)
 Flight -> FlightLegs -> arrival -> times -> scheduled
 
 */
 
 // Modele :
 
 /*
 1)
 Code vol (Identifiant vol) :
 Flight -> flightNumber;
 
 2)
 Code Company:
 Flight -> company -> code
 
 3)
 Airport Depart:
 FlightLegs -> departure -> Airport Location -> latitude, longitude
 
 Airport Arrivée:
 FlightLegs -> arrival -> Airport Location -> latitude, longitude
 
 4)
 Heure Départ
 Flight -> departureDate
 
 5)
 Flight -> FlightLegs -> arrival -> times -> scheduled
 
 */
 */
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
        companyCode.font = UIFont.preferredFont(forTextStyle: .body)
        companyCode.textColor = UIColor.label
        companyCode.adjustsFontForContentSizeCategory = true
        companyCode.translatesAutoresizingMaskIntoConstraints = false
        
        // codeVol
        flightCode.font = UIFont.preferredFont(forTextStyle: .body)
        flightCode.textColor = UIColor.label
        flightCode.adjustsFontForContentSizeCategory = true
        flightCode.translatesAutoresizingMaskIntoConstraints = false
        
        // Hour Depart
        departureTime.font = UIFont.preferredFont(forTextStyle: .body)
        departureTime.textColor = UIColor.label
        departureTime.adjustsFontForContentSizeCategory = true
        departureTime.translatesAutoresizingMaskIntoConstraints = false
        
        // airport Depart
        departureAirport.font = UIFont.preferredFont(forTextStyle: .body)
        departureAirport.textColor = UIColor.label
        departureAirport.adjustsFontForContentSizeCategory = true
        departureAirport.translatesAutoresizingMaskIntoConstraints = false
        
        // Aiport Arrive
        
        airportArrival.font = UIFont.preferredFont(forTextStyle: .body)
        airportArrival.textColor = UIColor.label
        airportArrival.adjustsFontForContentSizeCategory = true
        airportArrival.translatesAutoresizingMaskIntoConstraints = false
        
        // scheduled
        timeArrived.font = UIFont.preferredFont(forTextStyle: .body)
        timeArrived.textColor = UIColor.label
        timeArrived.adjustsFontForContentSizeCategory = true
        timeArrived.translatesAutoresizingMaskIntoConstraints = false
        
        
        let contentStackView = UIStackView(arrangedSubviews: [companyCode,flightCode,departureTime, departureAirport, airportArrival, timeArrived])
        contentStackView.alignment = .fill
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
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
