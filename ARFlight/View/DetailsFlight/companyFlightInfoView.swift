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
            resultCompanyLabel.text =  flight?.company?.name
            resultCodeFlight.text = flight?.identifiantPlane
            resultFlightType.text = flight?.flightType.rawValue
            resultStatus.text = flight?.flightStatus
            resultDuree.text = flight?.durationFlight
        }
    }
    
    private let resultStatus = UILabel()
    private let resultDuree = UILabel()
    private let resultCompanyLabel = UILabel()
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
        
        let labelCompanyName = UILabel(text: "Company Name")
        configureTitleLabel(labelCompanyName)
        labelCompanyName.numberOfLines = 1
        resultCompanyLabel.configureFlightDetailsInformationLabel()
        
        let companyStackView = UIStackView(arrangedSubviews: [labelCompanyName, resultCompanyLabel],
                                                axis: .vertical,
                                                spacing: UIStackView.spacingUseSystem,
                                                alignment: .center,
                                                distribution: .equalSpacing)
        
        let labelCodeFlight = UILabel(text: "Code Flight")
        configureTitleLabel(labelCodeFlight)
        resultCodeFlight.configureFlightDetailsInformationLabel()
        
        let codeFlightStackView = UIStackView(arrangedSubviews: [labelCodeFlight, resultCodeFlight],
                                                axis: .vertical,
                                                spacing: UIStackView.spacingUseSystem,
                                                alignment: .center,
                                                distribution: .equalSpacing)
        
        let labelFlightType = UILabel(text: "Flight Type")
        configureTitleLabel(labelFlightType)
        resultFlightType.configureFlightDetailsInformationLabel()
        
        let flightTypeStackView = UIStackView(arrangedSubviews: [labelFlightType, resultFlightType],
                                               axis: .vertical,
                                               spacing: UIStackView.spacingUseSystem,
                                               alignment: .center,
                                               distribution: .equalSpacing)
        
        let infoCompanyStackView = UIStackView(arrangedSubviews: [companyStackView, codeFlightStackView, flightTypeStackView],
                                               axis: .horizontal,
                                               spacing: UIStackView.spacingUseSystem,
                                               alignment: .firstBaseline,
                                               distribution: .fillEqually)
        addSubview(infoCompanyStackView)
        
        let labelStatusFlight = UILabel(text: "Status")
        configureTitleLabel(labelStatusFlight)
        resultStatus.configureFlightDetailsInformationLabel()
        
        let statusFlightStackView = UIStackView(arrangedSubviews: [labelStatusFlight, resultStatus],
                                                axis: .vertical,
                                                spacing: UIStackView.spacingUseSystem,
                                                alignment: .center,
                                                distribution: .fillProportionally)
        
        let labelDureeFlight = UILabel(text: "Duree")
        configureTitleLabel(labelDureeFlight)
        resultDuree.configureFlightDetailsInformationLabel()
        
        let dureeFlightStackView = UIStackView(arrangedSubviews: [labelDureeFlight, resultDuree],
                                               axis: .vertical,
                                               spacing: UIStackView.spacingUseSystem,
                                               alignment: .center,
                                               distribution: .equalSpacing)
        
        let dureeStatusStackView = UIStackView(arrangedSubviews: [statusFlightStackView, dureeFlightStackView],
                                               axis: .horizontal,
                                               spacing: 8,
                                               alignment: .center,
                                               distribution: .fillProportionally)
        addSubview(dureeStatusStackView)
        
        let contentStackView = UIStackView(arrangedSubviews: [infoCompanyStackView, dureeStatusStackView])
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
    
    // DebugColor
//    cityLabel.backgroundColor = .red
    
    
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


