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
            codeVol.text = flight?.flightNumber
            hourDepart.text = flight?.departureDate?.timeString()
            scheduled.text = flight?.arrivalDateTime?.timeString()
            airportDepart.text = flight?.departureAirportName
            airportArrive.text = flight?.arrivalAirportName
        }
    }
    
//    private func configureView(with flight: Flight?) {
//        companyCode.text = flightCompanyCode?.company?.code
//        codeVol.text = flightcodeVol?.flightNumber
//    }
    var flightCompanyCode: Flight? {
        didSet {
            
            // configure toi
        }
    }
    
    var flightcodeVol: Flight? {
        didSet {
            
            // configure toi
        }
    }
    

    var flightHourDepart: Flight? {
        didSet {
            
            // configure toi
        }
    }
    
    var flightscheduled: Flight? {
        didSet {
            
            //flightscheduled?.flightInformations?.first?.arrival?.times?.scheduled
            // configure toi
        }
    }
    
    
    var flightairportDepart: Flight? {
        didSet {
            
            // configure toi
        }
    }
    
    var flightairportArrive: Flight? {
        didSet {
           
            // configure toi
        }
    }
    
    
    
    private let companyCode = UILabel()
    private let codeVol = UILabel()
    private let hourDepart = UILabel()
    private let airportDepart = UILabel()
    private let airportArrive = UILabel()
    private let scheduled = UILabel()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // CompanyCode
        companyCode.font = UIFont.preferredFont(forTextStyle: .body)
        companyCode.textColor = UIColor.label
        companyCode.adjustsFontForContentSizeCategory = true
        companyCode.translatesAutoresizingMaskIntoConstraints = false
        
        // codeVol
        codeVol.font = UIFont.preferredFont(forTextStyle: .body)
        codeVol.textColor = UIColor.label
        codeVol.adjustsFontForContentSizeCategory = true
        codeVol.translatesAutoresizingMaskIntoConstraints = false
        
        // Hour Depart
        hourDepart.font = UIFont.preferredFont(forTextStyle: .body)
        hourDepart.textColor = UIColor.label
        hourDepart.adjustsFontForContentSizeCategory = true
        hourDepart.translatesAutoresizingMaskIntoConstraints = false
        
        // airport Depart
        airportDepart.font = UIFont.preferredFont(forTextStyle: .body)
        airportDepart.textColor = UIColor.label
        airportDepart.adjustsFontForContentSizeCategory = true
        airportDepart.translatesAutoresizingMaskIntoConstraints = false
        
        // Aiport Arrive
        airportArrive.font = UIFont.preferredFont(forTextStyle: .body)
        airportArrive.textColor = UIColor.label
        airportArrive.adjustsFontForContentSizeCategory = true
        airportArrive.translatesAutoresizingMaskIntoConstraints = false
        
        // scheduled
        scheduled.font = UIFont.preferredFont(forTextStyle: .body)
        scheduled.textColor = UIColor.label
        scheduled.adjustsFontForContentSizeCategory = true
        scheduled.translatesAutoresizingMaskIntoConstraints = false
        
        
        let contentStackView = UIStackView(arrangedSubviews: [companyCode,codeVol,hourDepart, airportDepart, airportArrive, scheduled])
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
