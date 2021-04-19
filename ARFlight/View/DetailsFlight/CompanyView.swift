//
//  CompanyView.swift
//  ARFlight
//
//  Created by Wandianga hassane on 2021-04-09.
//

import UIKit


final class CompanyView: UIView  {


    var titleCompany: String? {
        didSet {
            resultTitleLabel.text = titleCompany
        }
    }
    
    var titleCodeFlight: String? {
        didSet {
            resultCodeFlight.text = titleCodeFlight
        }
    }
    
    var titleFlightType: String? {
        didSet {
            resultFlightType.text = titleFlightType
        }
    }
    

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
        
        let contentView = UIStackView(arrangedSubviews: [titleStackView, resultStackView])
        contentView.axis = .vertical
        contentView.alignment = .fill
        contentView.spacing = UIStackView.spacingUseSystem
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(contentView)
        
        // Debug colors label
        labelCompanyName.backgroundColor = .yellow
        labelFlightType.backgroundColor = .tertiaryLabel
        labelCodeFlight.backgroundColor = .brown
        
        // Debug colors Result
//        [resultTitleLabel, resultCodeFlight,resultFlightType])
        resultTitleLabel.backgroundColor = .tertiaryLabel
        resultCodeFlight.backgroundColor = .yellow
        resultFlightType.backgroundColor = .brown
            
        NSLayoutConstraint.activate([

            contentView.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1.0),
            
            bottomAnchor.constraint(equalToSystemSpacingBelow: contentView.bottomAnchor, multiplier: 1.0),
            contentView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1.0),
            trailingAnchor.constraint(equalToSystemSpacingAfter: contentView.trailingAnchor, multiplier: 1.0),
        ])
    }
}
