//
//  ArrivalTerminalView.swift
//  ARFlight
//
//  Created by Wandianga hassane on 2021-04-09.
//

import UIKit


final class ArrivalTerminalView: UIView  {

    let textField = UITextField()

    private let titleLabelArrival = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView(withTitle title: String? = nil) {
        
        let LabelTerminalArrival = UILabel()
        LabelTerminalArrival.text = "Terminal Arrival"
        LabelTerminalArrival.numberOfLines = 0
        LabelTerminalArrival.font = UIFont.preferredFont(forTextStyle: .headline)
        LabelTerminalArrival.textColor = .cyan
        LabelTerminalArrival.adjustsFontForContentSizeCategory = true
        LabelTerminalArrival.translatesAutoresizingMaskIntoConstraints = false
        
        let textFieldTerminalArrival = UITextField()
        textFieldTerminalArrival.placeholder = "Terminal d'Arrival'"
 
//        // hugging ressitance priperoty
//        //titleLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
//        //titleLabel.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)

    let contentView = UIStackView(arrangedSubviews: [LabelTerminalArrival,textFieldTerminalArrival])
    
    contentView.axis = .vertical
    contentView.alignment = .fill
    contentView.spacing = UIStackView.spacingUseSystem
    contentView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(contentView)
        
        // Debug colors
        
        
        NSLayoutConstraint.activate([

            contentView.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1.0),
            
            bottomAnchor.constraint(equalToSystemSpacingBelow: contentView.bottomAnchor, multiplier: 1.0),
            contentView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1.0),
            trailingAnchor.constraint(equalToSystemSpacingAfter: contentView.trailingAnchor, multiplier: 1.0),
        ])
    }
}
