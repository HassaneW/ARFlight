//
//  companyFlightInfoView.swift
//  ARFlight
//
//  Created by Wandianga hassane on 2021-04-27.
//

import Foundation
import UIKit




class CompanyFlightInfoView: UIView {
    
    
    var flight: Flight? {
        didSet {
            resultTitleLabel.text =  flight?.company?.name
            resultCodeFlight.text = flight?.identifiantPlane
            resultFlightType.text = flight?.flightType.rawValue
            resultStatus.text = flight?.flightStatus
            resultDuree.text = flight?.durationFlight
        }
    }

    private let resultStatus = UILabel()
    private let resultDuree = UILabel()
    private let resultTitleLabel = UILabel()
    private let resultCodeFlight = UILabel()
    private let resultFlightType = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView() {
        
        // 1
        let labelCompanyName = UILabel(text: "Company Name")

        // 2
        configureTitleLabel(labelCompanyName)

        let labelCodeFlight = UILabel(text: "Code Flight")
        configureTitleLabel(labelCodeFlight)
        
        let labelFlightType = UILabel(text: "Flight Type")
        configureTitleLabel(labelFlightType)
        
        let titleStackView = UIStackView(arrangedSubviews: [labelCompanyName, labelCodeFlight,labelFlightType])
        titleStackView.axis = .horizontal
        titleStackView.alignment = .leading
        titleStackView.distribution = .equalSpacing
        titleStackView.spacing = UIStackView.spacingUseSystem
        titleStackView.translatesAutoresizingMaskIntoConstraints = false

        resultTitleLabel.configureFlightDetailsInformationLabel()
        resultCodeFlight.configureFlightDetailsInformationLabel()
        resultFlightType.configureFlightDetailsInformationLabel()
        
        let resultStackView = UIStackView(arrangedSubviews: [resultTitleLabel, resultCodeFlight,resultFlightType])
        resultStackView.axis = .horizontal
        resultStackView.alignment = .fill
        resultStackView.spacing = UIStackView.spacingUseSystem
        resultStackView.translatesAutoresizingMaskIntoConstraints = false
        
        let contentViewCompanyView = UIStackView(arrangedSubviews: [titleStackView, resultStackView])
        contentViewCompanyView.axis = .vertical
        contentViewCompanyView.alignment = .fill
        contentViewCompanyView.spacing = UIStackView.spacingUseSystem
        contentViewCompanyView.translatesAutoresizingMaskIntoConstraints = false
        
        let labelStatusFlight = UILabel()
        labelStatusFlight.text = "Status"
        labelStatusFlight.numberOfLines = 0
        labelStatusFlight.font = UIFont
            .preferredFont(forTextStyle: .headline)
        labelStatusFlight.textAlignment = .center
        labelStatusFlight.textColor = .black
        labelStatusFlight.adjustsFontForContentSizeCategory = true
        
        let labelDureeFlight = UILabel()
        labelDureeFlight.text = "Duree"
        labelDureeFlight.numberOfLines = 0
        labelDureeFlight.font = UIFont
            .preferredFont(forTextStyle: .headline)
        labelDureeFlight.textAlignment = .center
        labelDureeFlight.textColor = .black
        labelDureeFlight.adjustsFontForContentSizeCategory = true
        
        let statusStackView = UIStackView(arrangedSubviews: [labelStatusFlight, labelDureeFlight])
        statusStackView.axis = .horizontal
        statusStackView.alignment = .leading
        statusStackView.distribution = .equalSpacing
        statusStackView.spacing = UIStackView.spacingUseSystem
        
        resultStatus.numberOfLines = 0
        resultStatus.font = UIFont
            .preferredFont(forTextStyle: .headline)
        resultStatus.textAlignment = .center
        resultStatus.textColor = .label
        resultStatus.adjustsFontForContentSizeCategory = true
        resultStatus.translatesAutoresizingMaskIntoConstraints = false
        
        resultDuree.numberOfLines = 0
        resultDuree.font = UIFont.preferredFont(forTextStyle: .headline)
        resultDuree.textAlignment = .center
        resultDuree.textColor = .label
        resultDuree.adjustsFontForContentSizeCategory = true
        resultDuree.translatesAutoresizingMaskIntoConstraints = false
        
        let resultStackViewFlight = UIStackView(arrangedSubviews: [resultStatus,resultDuree])
        resultStackViewFlight.axis = .horizontal
        resultStackViewFlight.alignment = .fill
        resultStackViewFlight.spacing = UIStackView.spacingUseSystem
        resultStackViewFlight.translatesAutoresizingMaskIntoConstraints = false
        
        let contentViewFlightInfo = UIStackView(arrangedSubviews: [statusStackView, resultStackView])
        contentViewFlightInfo.axis = .vertical
        contentViewFlightInfo.alignment = .fill
        contentViewFlightInfo.spacing = UIStackView.spacingUseSystem
        contentViewFlightInfo.translatesAutoresizingMaskIntoConstraints = false
        
        
        let contentStackView = UIStackView(arrangedSubviews: [contentViewCompanyView, contentViewFlightInfo])
        contentStackView.axis = .vertical
        contentStackView.alignment = .fill
        contentStackView.spacing = 20
        contentStackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(contentStackView)
                
        NSLayoutConstraint.activate([
            contentStackView.topAnchor.constraint(equalToSystemSpacingBelow: safeAreaLayoutGuide.topAnchor, multiplier: 1.0),
            contentStackView.leadingAnchor.constraint(equalToSystemSpacingAfter: safeAreaLayoutGuide.leadingAnchor, multiplier: 1.5),
            safeAreaLayoutGuide.trailingAnchor.constraint(equalToSystemSpacingAfter: contentStackView.trailingAnchor, multiplier: 1.5),
            safeAreaLayoutGuide.bottomAnchor.constraint(equalToSystemSpacingBelow: contentStackView.bottomAnchor, multiplier: 1.0)
        ])
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
    
    func configureInformationLabel(_ label: UILabel) {
        label.numberOfLines = 0
        label.font = .preferredFont(forTextStyle: .body)
        label.textAlignment = .center
        label.textColor = .label
        label.adjustsFontSizeToFitWidth = true
        label.adjustsFontForContentSizeCategory = true
        label.translatesAutoresizingMaskIntoConstraints = false
    }
}


