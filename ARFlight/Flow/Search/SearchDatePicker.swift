//
//  SearchDatePicker.swift
//  ARFlight
//
//  Created by Wandianga hassane on 2021-05-06.
//

import UIKit

/*
SearchDatePicker (Inspiration de L'app calendar quand ont selectionne une date)
UIlabel(Depart/ Arrive) <-> UILabel (jour)
UIDatePicker (isHidden true vers false)
 
 */

class SearchDatePicker: UIView {

    var selectedDate: Date {
        datePicker.date
    }

    private lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .none
        return formatter
    }()

    private enum Constant {
        static let padding: CGFloat = 20
        static let imageWidth: CGFloat = 40
    }

    private let datePicker = UIDatePicker()
    
    init(title: String) {
        super.init(frame: .zero)
        setupViewWith(title: title)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViewWith(title: String) {
        
        let titleLabel = UILabel(text: title, font: .preferredFont(forTextStyle: .body))
        titleLabel.textColor = .label
        titleLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        titleLabel.adjustsFontSizeToFitWidth = true
        titleLabel.adjustsFontForContentSizeCategory = true
        
        datePicker.datePickerMode = .date
        datePicker.minimumDate = Date()

        let contentStackView = UIStackView(
            arrangedSubviews: [titleLabel,UIView(), datePicker],
            axis: .horizontal,
            spacing: UIStackView.spacingUseSystem,
            alignment: .fill,
            distribution: .equalCentering)
        contentStackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(contentStackView)
        
        NSLayoutConstraint.activate([
            contentStackView.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1.0),
            contentStackView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1.0),
            bottomAnchor.constraint(equalToSystemSpacingBelow: contentStackView.bottomAnchor, multiplier: 1.0),
            trailingAnchor.constraint(equalToSystemSpacingAfter: contentStackView.trailingAnchor, multiplier: 1.0),
        ])
        
    }
}
