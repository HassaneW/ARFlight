//
//  FlightResultTableViewCell.swift
//  ARFlight
//
//  Created by Wandianga hassane on 2021-04-06.
//

import UIKit

class FlightResultTableViewCell: UITableViewCell {

    var flight: Flight? {
        didSet {
            companyCode.text = flight?.company?.code
            // configure toi
        }
    }
    
    private let companyCode = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        companyCode.font = UIFont.preferredFont(forTextStyle: .body)
        companyCode.textColor = UIColor.label
        companyCode.adjustsFontForContentSizeCategory = true
        companyCode.translatesAutoresizingMaskIntoConstraints = false
        
        // Configure les autrs objets
        
        let contentStackView = UIStackView(arrangedSubviews: [companyCode])
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
