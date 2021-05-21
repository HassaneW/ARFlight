//
//  SearchSectionHeader.swift
//  ARFlight
//
//  Created by Wandianga hassane on 2021-05-04.
//

import UIKit

final class SearchSectionHeader: UIView {
    
    

    private enum Constant {
        static let padding: CGFloat = 20
        static let imageWidth: CGFloat = 40
    }

    init(leadingImage: UIImage?, title: String) {
        super.init(frame: .zero)
        setupViewWith(leadingImage: leadingImage, title: title)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViewWith(leadingImage: UIImage?, title: String) {
        let leadingImageView = UIImageView(image: leadingImage)
        leadingImageView.contentMode = .scaleAspectFit
        
        let titleLabel = UILabel(text: title, font: .preferredFont(forTextStyle: .largeTitle))
        titleLabel.textColor = .label
        titleLabel.adjustsFontSizeToFitWidth = true
        titleLabel.adjustsFontForContentSizeCategory = true
        
        let contentStackView = UIStackView(
            arrangedSubviews: [UIView(), leadingImageView, titleLabel, UIView()],
            axis: .horizontal,
            spacing: Constant.padding,
            alignment: .center,
            distribution: .equalCentering)
        contentStackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(contentStackView)
        
        NSLayoutConstraint.activate([
            leadingImageView.widthAnchor.constraint(equalToConstant: Constant.imageWidth),
            leadingImageView.heightAnchor.constraint(equalTo: leadingImageView.widthAnchor),
            
            contentStackView.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1.0),
            contentStackView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1.0),
            bottomAnchor.constraint(equalToSystemSpacingBelow: contentStackView.bottomAnchor, multiplier: 1.0),
            trailingAnchor.constraint(equalToSystemSpacingAfter: contentStackView.trailingAnchor, multiplier: 1.0),
        ])
    }
}
