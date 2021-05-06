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
    
    private enum Constant {
        static let padding: CGFloat = 20
        static let imageWidth: CGFloat = 40
    }
    
    let textfield = UITextField()

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
        
        
        // Create textfield
//        let textfield = UITextField()
        textfield.textAlignment = .center
        textfield.textColor = .black
        textfield.borderStyle = .roundedRect
        textfield.layer.borderWidth = 2
        textfield.font = .preferredFont(forTextStyle: .body)
        textfield.adjustsFontSizeToFitWidth = true
        textfield.translatesAutoresizingMaskIntoConstraints = false
        
        // CreateDatePicker
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        textfield.inputView = datePicker
        datePicker.addTarget(self, action: #selector(self.valuechanged), for: .valueChanged)
        
        let contentStackView = UIStackView(
            arrangedSubviews: [titleLabel, textfield],
            axis: .horizontal,
            spacing: 8,
            alignment: .fill,
            distribution: .fill)
        contentStackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(contentStackView)
        
        NSLayoutConstraint.activate([
//            leadingImageView.widthAnchor.constraint(equalToConstant: Constant.imageWidth),
//            leadingImageView.heightAnchor.constraint(equalTo: leadingImageView.widthAnchor),
            
            contentStackView.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1.0),
            contentStackView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1.0),
            bottomAnchor.constraint(equalToSystemSpacingBelow: contentStackView.bottomAnchor, multiplier: 1.0),
            trailingAnchor.constraint(equalToSystemSpacingAfter: contentStackView.trailingAnchor, multiplier: 1.0),
        ])
        
    }
    @objc func valuechanged(sender: UIDatePicker) {
        let dateFormat = DateFormatter()
        dateFormat.dateStyle = .long
        dateFormat.timeStyle = .none
        self.textfield.text = dateFormat.string(from: sender.date)
        
    }
}
