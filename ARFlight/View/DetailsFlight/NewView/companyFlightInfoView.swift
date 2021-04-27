//
//  companyFlightInfoView.swift
//  ARFlight
//
//  Created by Wandianga hassane on 2021-04-27.
//

import Foundation
import UIKit




class companyFlightInfoView: UIView {
    
    
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
        
        private func setupView(withTitle title: String? = nil) {
            
            let labelCompanyName = UILabel()
            labelCompanyName.text = "Company Name"
            labelCompanyName.numberOfLines = 2
            labelCompanyName.font = UIFont
                .preferredFont(forTextStyle: .headline)
            labelCompanyName.adjustsFontSizeToFitWidth = true
            labelCompanyName.textAlignment = .center
            labelCompanyName.textColor = .black
            labelCompanyName.adjustsFontForContentSizeCategory = true
            
           
            let labelCodeFlight = UILabel()
            labelCodeFlight.text = "Code Flight"
            labelCodeFlight.numberOfLines = 0
            labelCodeFlight.font = UIFont
                .preferredFont(forTextStyle: .headline)
            labelCodeFlight.textAlignment = .center
            labelCodeFlight.adjustsFontSizeToFitWidth = true
            labelCodeFlight.textColor = .black
            labelCodeFlight.adjustsFontForContentSizeCategory = true
            
           
            let labelFlightType = UILabel()
            labelFlightType.text = "Flight Type"
            labelFlightType.numberOfLines = 0
            labelFlightType.font = UIFont
                .preferredFont(forTextStyle: .headline)
            labelFlightType.textAlignment = .center
            labelFlightType.adjustsFontSizeToFitWidth = true
            labelFlightType.textColor = .black
            labelFlightType.adjustsFontForContentSizeCategory = true

            let titleStackView = UIStackView(arrangedSubviews: [labelCompanyName, labelCodeFlight,labelFlightType])
            titleStackView.axis = .horizontal
            titleStackView.alignment = .leading
            titleStackView.distribution = .equalSpacing
            titleStackView.spacing = UIStackView.spacingUseSystem
            titleStackView.translatesAutoresizingMaskIntoConstraints = false
            
            resultTitleLabel.text = title
            resultTitleLabel.numberOfLines = 0
            resultTitleLabel.font = UIFont
                .preferredFont(forTextStyle: .headline)
            resultTitleLabel.textAlignment = .center
            resultTitleLabel.textColor = .label
            resultTitleLabel.adjustsFontSizeToFitWidth = true
            resultTitleLabel.adjustsFontForContentSizeCategory = true
            resultTitleLabel.translatesAutoresizingMaskIntoConstraints = false
            
            resultCodeFlight.text = title
            resultCodeFlight.numberOfLines = 0
            resultCodeFlight.font = UIFont
                .preferredFont(forTextStyle: .headline)
            resultCodeFlight.textAlignment = .center
            resultCodeFlight.textColor = .label
            resultCodeFlight.adjustsFontSizeToFitWidth = true
            resultCodeFlight.adjustsFontForContentSizeCategory = true
            resultCodeFlight.translatesAutoresizingMaskIntoConstraints = false
            
            resultFlightType.text = title
            resultFlightType.numberOfLines = 0
            resultFlightType.font = UIFont
                .preferredFont(forTextStyle: .headline)
            resultFlightType.textAlignment = .center
            resultFlightType.textColor = .label
            resultFlightType.adjustsFontSizeToFitWidth = true
            resultFlightType.adjustsFontForContentSizeCategory = true
            resultFlightType.translatesAutoresizingMaskIntoConstraints = false
            
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
      
            resultStatus.text = title
            resultStatus.numberOfLines = 0
            resultStatus.font = UIFont
                .preferredFont(forTextStyle: .headline)
            resultStatus.textAlignment = .center
            resultStatus.textColor = .label
            resultStatus.adjustsFontForContentSizeCategory = true
            resultStatus.translatesAutoresizingMaskIntoConstraints = false
            
            resultDuree.text = title
            resultDuree.numberOfLines = 0
            resultDuree.font = UIFont
                .preferredFont(forTextStyle: .headline)
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
    

