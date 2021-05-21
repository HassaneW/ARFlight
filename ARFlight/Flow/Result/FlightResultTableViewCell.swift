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
    private let flightCode = UILabel()
    private let departureTime = UILabel()
    private let departureAirport = UILabel()
    private let airportArrival = UILabel()
    private let timeArrived = UILabel()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        companyCode.font = UIFont.preferredFont(forTextStyle: .headline)
        companyCode.textColor = UIColor.label
        companyCode.adjustsFontForContentSizeCategory = true
        companyCode.translatesAutoresizingMaskIntoConstraints = false

        let airportImage = UIImage(systemName: "airplane.circle.fill")
        let leadingAirportImageView = UIImageView(image: airportImage)
        leadingAirportImageView.contentMode = .scaleAspectFit
        
        let timeImage = UIImage(systemName: "alarm.fill")
        let leadingTimeImageView = UIImageView(image: timeImage)
        leadingTimeImageView.contentMode = .scaleAspectFit
        
        let imageStackView = UIStackView(
            arrangedSubviews: [leadingAirportImageView, leadingTimeImageView],
            axis: .vertical,
            spacing: UIStackView.spacingUseSystem,
            alignment: .leading,
            distribution: .fill)
               
        departureAirport.font = UIFont.preferredFont(forTextStyle: .body)
        departureAirport.numberOfLines = 1
        departureAirport.textColor = UIColor.label
        departureAirport.allowsDefaultTighteningForTruncation = true
        departureAirport.adjustsFontForContentSizeCategory = true
        departureAirport.translatesAutoresizingMaskIntoConstraints = false
        
        departureTime.font = UIFont.preferredFont(forTextStyle: .body)
        departureTime.textColor = UIColor.label
        departureTime.allowsDefaultTighteningForTruncation = true
        departureTime.adjustsFontForContentSizeCategory = true
        departureTime.translatesAutoresizingMaskIntoConstraints = false
        
        let departStackView = UIStackView(
            arrangedSubviews: [departureAirport, departureTime],
            axis: .vertical,
            spacing: UIStackView.spacingUseSystem,
            alignment: .leading,
            distribution: .fill)
        
        let labelTextTo = UILabel(text: "TO")
        labelTextTo.textColor = UIColor.label
        labelTextTo.font = UIFont.preferredFont(forTextStyle: .body)
        labelTextTo.allowsDefaultTighteningForTruncation = true
        labelTextTo.adjustsFontForContentSizeCategory = true
        labelTextTo.translatesAutoresizingMaskIntoConstraints = false
        
        let arrowshapeImage = UIImage(systemName: "arrowshape.zigzag.forward.fill")
        let arrowshapeImageView = UIImageView(image: arrowshapeImage)
        arrowshapeImageView.contentMode = .scaleAspectFit
        
        let imageLabelStackView = UIStackView(
            arrangedSubviews: [labelTextTo, arrowshapeImageView],
            axis: .vertical,
            spacing: UIStackView.spacingUseSystem,
            alignment: .leading,
            distribution: .fill)

        airportArrival.font = UIFont.preferredFont(forTextStyle: .body)
        airportArrival.textColor = UIColor.label
        airportArrival.numberOfLines = 1
        airportArrival.allowsDefaultTighteningForTruncation = true
        airportArrival.adjustsFontForContentSizeCategory = true
        airportArrival.translatesAutoresizingMaskIntoConstraints = false
        
        timeArrived.font = UIFont.preferredFont(forTextStyle: .body)
        timeArrived.textColor = UIColor.label
        timeArrived.allowsDefaultTighteningForTruncation = true
        timeArrived.adjustsFontForContentSizeCategory = true
        timeArrived.translatesAutoresizingMaskIntoConstraints = false
        
        let arrivalStackView = UIStackView(
            arrangedSubviews: [airportArrival, timeArrived],
            axis: .vertical,
            spacing: UIStackView.spacingUseSystem,
            alignment: .leading,
            distribution: .fill)

        let contentStackView = UIStackView(
            arrangedSubviews: [companyCode,
                               imageStackView,
                               departStackView,
                               imageLabelStackView,
                               arrivalStackView])
        contentStackView.alignment = .firstBaseline
        contentStackView.spacing = UIStackView.spacingUseSystem
        contentStackView.distribution = .equalCentering
        contentStackView.axis = .horizontal
        contentStackView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(contentStackView)
      
        NSLayoutConstraint.activate([
            contentStackView.topAnchor.constraint(equalToSystemSpacingBelow: contentView.safeAreaLayoutGuide.topAnchor, multiplier: 1.0),
            contentStackView.leadingAnchor.constraint(equalToSystemSpacingAfter: contentView.safeAreaLayoutGuide.leadingAnchor, multiplier: 1.0),
            contentView.safeAreaLayoutGuide.trailingAnchor.constraint(equalToSystemSpacingAfter: contentStackView.trailingAnchor, multiplier: 1.0),
            contentView.safeAreaLayoutGuide.bottomAnchor.constraint(equalToSystemSpacingBelow: contentStackView.bottomAnchor, multiplier: 1.0)
        ])
        
        // Debug Color
        
//        labelTextTo.backgroundColor = .yellow
//        labelCompanyCode.backgroundColor = .red
//        companyCode.backgroundColor = .yellow
//        labelFlightCode.backgroundColor = .blue
//        flightCode.backgroundColor = .purple
//        labelDepartureAirport.backgroundColor = .brown
//        departureAirport.backgroundColor = .darkGray
//        labelDepartureTime.backgroundColor = .green
//        departureTime.backgroundColor = .magenta
//        labelairportArrival.backgroundColor = .orange
//        airportArrival.backgroundColor = .blue
//        labeltimeArrived.backgroundColor = .cyan
//        timeArrived.backgroundColor = .red
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
