//
//  FlightInfoView.swift
//  ARFlight
//
//  Created by Wandianga hassane on 2021-04-09.
//

import UIKit

final class FlightInfoView: UIView  {


//    var titleCompany: String? {
//        didSet {
//            titleLabel.text = titleCompany
//        }
//    }
    
    var titleStatus: String? {
        didSet {
            resultStatus.text = titleStatus
        }
    }
    
    var titleDuree: String? {
        didSet {
            resultDuree.text = titleDuree
        }
    }
    

//    private let titleLabel = UILabel()
    private let resultStatus = UILabel()
    private let resultDuree = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView(withTitle title: String? = nil) {
        
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
//        titleStackView.translatesAutoresizingMaskIntoConstraints = false
        
  
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
        
        let resultStackView = UIStackView(arrangedSubviews: [resultStatus,resultDuree])
        resultStackView.axis = .horizontal
        resultStackView.alignment = .fill
        resultStackView.spacing = UIStackView.spacingUseSystem
        resultStackView.translatesAutoresizingMaskIntoConstraints = false
        
        let contentView = UIStackView(arrangedSubviews: [statusStackView, resultStackView])
        contentView.axis = .horizontal
        contentView.alignment = .fill
        contentView.spacing = UIStackView.spacingUseSystem
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        
        addSubview(contentView)
        
        // Debug colors label status
        labelStatusFlight.backgroundColor = .yellow
        labelDureeFlight.backgroundColor = .tertiaryLabel
        
        // Debug colors result
        labelDureeFlight.backgroundColor = .blue
        resultDuree.backgroundColor = .green
        
        NSLayoutConstraint.activate([

            contentView.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1.0),
            
            bottomAnchor.constraint(equalToSystemSpacingBelow: contentView.bottomAnchor, multiplier: 1.0),
            contentView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1.0),
            trailingAnchor.constraint(equalToSystemSpacingAfter: contentView.trailingAnchor, multiplier: 1.0),
        ])
    }
}

