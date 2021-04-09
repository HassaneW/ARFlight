//
//  PlaneView.swift
//  ARFlight
//
//  Created by Wandianga hassane on 2021-04-09.
//

import UIKit

final class PlaneView: UIView  {
    

    
    var titleFlight: String? {
        didSet {
            titleLabel.text = titleFlight
        }
    }
    
    var plane: Plane? {
        didSet {
            
            imageTitleLabel.text = plane?.image
        }
    }
    
    
    
//    let textField = UITextField()

    private let titleLabel = UILabel()
    private let imageTitleLabel = UILabel()
    
    

    init(title: String?) {
        super.init(frame: .zero)
        setupView(withTitle: title)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    func setupView(withTitle title: String? = nil) {
        
//        let planes = Bundle.main.decode([Plane].self, from: "aircraft-details.json")
//
//        let test = planes.first?.image
//        let imageAir = "\(imageTitleLabel.text)"
//        let imagePlane = UIImage(named: imageAir)
//        let myImagePlane = UIImageView(image: imagePlane)
//        myImagePlane.contentMode = UIView.ContentMode.scaleAspectFit
//
        imageTitleLabel.adjustsFontForContentSizeCategory = true
        imageTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        imageTitleLabel.contentMode = UIView.ContentMode.scaleAspectFill
        
        titleLabel.text = title
        titleLabel.numberOfLines = 0
        titleLabel.font = UIFont
            .preferredFont(forTextStyle: .largeTitle)
        titleLabel.textAlignment = .center
        titleLabel.textColor = .label
        titleLabel.adjustsFontForContentSizeCategory = true
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
    
       

    let contentView = UIStackView(arrangedSubviews: [imageTitleLabel, titleLabel])
    
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
