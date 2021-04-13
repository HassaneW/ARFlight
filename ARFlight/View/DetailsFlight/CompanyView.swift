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
            titleLabel.text = titleCompany
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
    

    private let titleLabel = UILabel()
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
        labelCompanyName.numberOfLines = 0
        labelCompanyName.font = UIFont
            .preferredFont(forTextStyle: .headline)
        labelCompanyName.textAlignment = .center
        labelCompanyName.textColor = .black
        labelCompanyName.adjustsFontForContentSizeCategory = true
        
       
        let labelCodeFlight = UILabel()
        labelCodeFlight.text = "Code Flight"
        labelCodeFlight.numberOfLines = 0
        labelCodeFlight.font = UIFont
            .preferredFont(forTextStyle: .headline)
        labelCodeFlight.textAlignment = .center
        labelCodeFlight.textColor = .black
        labelCodeFlight.adjustsFontForContentSizeCategory = true
        
       
        let labelFlightType = UILabel()
        labelFlightType.text = "Flight Type"
        labelFlightType.numberOfLines = 0
        labelFlightType.font = UIFont
            .preferredFont(forTextStyle: .headline)
        labelFlightType.textAlignment = .center
        labelFlightType.textColor = .black
        labelFlightType.adjustsFontForContentSizeCategory = true

        let titleStackView = UIStackView(arrangedSubviews: [labelCompanyName, labelCodeFlight,labelFlightType])
        titleStackView.axis = .horizontal
        titleStackView.alignment = .fill
        titleStackView.spacing = UIStackView.spacingUseSystem
        titleStackView.translatesAutoresizingMaskIntoConstraints = false
       
        titleLabel.text = title
        titleLabel.numberOfLines = 0
        titleLabel.font = UIFont
            .preferredFont(forTextStyle: .headline)
        titleLabel.textAlignment = .center
        titleLabel.textColor = .label
        titleLabel.adjustsFontForContentSizeCategory = true
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        resultCodeFlight.text = title
        resultCodeFlight.numberOfLines = 0
        resultCodeFlight.font = UIFont
            .preferredFont(forTextStyle: .headline)
        resultCodeFlight.textAlignment = .center
        resultCodeFlight.textColor = .label
        resultCodeFlight.adjustsFontForContentSizeCategory = true
        resultCodeFlight.translatesAutoresizingMaskIntoConstraints = false
        
        resultFlightType.text = title
        resultFlightType.numberOfLines = 0
        resultFlightType.font = UIFont
            .preferredFont(forTextStyle: .headline)
        resultFlightType.textAlignment = .center
        resultFlightType.textColor = .label
        resultFlightType.adjustsFontForContentSizeCategory = true
        resultFlightType.translatesAutoresizingMaskIntoConstraints = false
        
        let resultStackView = UIStackView(arrangedSubviews: [titleLabel, resultCodeFlight,resultFlightType])
        resultStackView.axis = .horizontal
        resultStackView.alignment = .fill
        resultStackView.spacing = UIStackView.spacingUseSystem
        resultStackView.translatesAutoresizingMaskIntoConstraints = false
        
        let contentView = UIStackView(arrangedSubviews: [titleStackView, resultStackView])
        contentView.axis = .horizontal
        contentView.alignment = .fill
        contentView.spacing = UIStackView.spacingUseSystem
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        
        addSubview(contentView)
        
        // Debug colors
//        titleLabel.backgroundColor = .yellow
//        labelCodeFlight.backgroundColor = .tertiaryLabel
//        labelFlightType.backgroundColor = .brown
//        
        NSLayoutConstraint.activate([

            contentView.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1.0),
            
            bottomAnchor.constraint(equalToSystemSpacingBelow: contentView.bottomAnchor, multiplier: 1.0),
            contentView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1.0),
            trailingAnchor.constraint(equalToSystemSpacingAfter: contentView.trailingAnchor, multiplier: 1.0),
        ])
    }
}