//
//  AirportView.swift
//  ARFlight
//
//  Created by Wandianga hassane on 2021-04-27.
//

import UIKit

class AirportDetailView : UIView {
    
    var airportDetailInfo: (airportName: String?, time:String?, terminalNumber: String?) {
        didSet {
            airportNameLabel.text = airportDetailInfo.airportName
            timeLabel.text = airportDetailInfo.time
            terminalNumberLabel.text = airportDetailInfo.terminalNumber ?? "-"
        }
    }
    private let airportNameLabel = UILabel()
    private let timeLabel = UILabel()
    private let terminalNumberLabel = UILabel()
    
    init(flightLeg: String) {
        super.init(frame: .zero)
        setupViewWith(flightLeg: flightLeg)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViewWith(flightLeg: String) {
        let airportNameTitleLabel = UILabel(text: "Airport \(flightLeg)", font: .preferredFont(forTextStyle: .headline))
        airportNameTitleLabel.textColor = .label
        airportNameTitleLabel.numberOfLines = 0
        airportNameTitleLabel.textAlignment = .center
        airportNameTitleLabel.adjustsFontForContentSizeCategory = true
        airportNameLabel.configureFlightDetailsInformationLabel()
        
        let airportNameStackView = UIStackView(
            arrangedSubviews: [airportNameTitleLabel, airportNameLabel],
            axis: .vertical)
        
        let timeTitleLabel = UILabel(text: "Heure \(flightLeg)", font: .preferredFont(forTextStyle: .headline))
        timeTitleLabel.textColor = .label
        timeTitleLabel.numberOfLines = 0
        timeTitleLabel.textAlignment = .center
        timeTitleLabel.adjustsFontForContentSizeCategory = true
        
        timeLabel.numberOfLines = 0
        timeLabel.textColor = .label
        timeLabel.textAlignment = .center
        timeLabel.font = .preferredFont(forTextStyle: .subheadline)
        timeLabel.adjustsFontForContentSizeCategory = true
        
        let timeStackView = UIStackView(
            arrangedSubviews: [timeTitleLabel, timeLabel],
            axis: .vertical)
        
        let airportNameAndTimeStackView = UIStackView(arrangedSubviews:  [airportNameStackView, timeStackView],
            axis: .horizontal,
            spacing: 40,
            alignment: .center,
            distribution: .fillEqually)
        
        let terminalTitleLabel = UILabel(text: "Terminal \(flightLeg)", font: .preferredFont(forTextStyle: .headline))
        terminalTitleLabel.textColor = .label
        terminalTitleLabel.numberOfLines = 0
        terminalTitleLabel.textAlignment = .left
        terminalTitleLabel.adjustsFontForContentSizeCategory = true
        
        terminalNumberLabel.numberOfLines = 0
        terminalNumberLabel.textColor = .label
        terminalNumberLabel.textAlignment = .right
        terminalNumberLabel.font = .preferredFont(forTextStyle: .subheadline)
        terminalNumberLabel.adjustsFontForContentSizeCategory = true
        
        let terminalStackView = UIStackView(
            arrangedSubviews: [terminalTitleLabel, terminalNumberLabel],
            axis: .vertical,
            alignment: .center)
        
        let contentStackView = UIStackView(
            arrangedSubviews: [airportNameAndTimeStackView, UIView(), UIView(),terminalStackView],
            axis: .vertical,
            spacing: 8,
            alignment: .center,
            distribution: .equalSpacing)
        contentStackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(contentStackView)
        
        NSLayoutConstraint.activate([
            contentStackView.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1.0),
            contentStackView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1.0),
            trailingAnchor.constraint(equalToSystemSpacingAfter: contentStackView.trailingAnchor, multiplier: 1.0),
            bottomAnchor.constraint(equalToSystemSpacingBelow: contentStackView.bottomAnchor, multiplier: 1.0),
        ])
        airportNameTitleLabel.backgroundColor = .red
        airportNameLabel.backgroundColor = .yellow
        timeTitleLabel.backgroundColor = .orange
        timeLabel.backgroundColor = .green
        terminalTitleLabel.backgroundColor = .blue
        terminalNumberLabel.backgroundColor = .brown
    }
}
