//
//  InfoPlaneView.swift
//  ARFlight
//
//  Created by Wandianga hassane on 2021-04-10.
//

import UIKit


final class InfoPlaneView: UIView  {
    

    var plane: Plane? {
        didSet {
//            resultTypeDeMoteur.text = plane?.motorType
//            resultNombreDeSiege.text = plane?.numberOfSeats
        }
    }
    
    var titleTypeMoteur: String? {
        didSet {
            resultTypeDeMoteur.text = titleTypeMoteur
        }
    }
    
    var titleNombreDeSiege: String? {
        didSet {
            resultNombreDeSiege.text = titleNombreDeSiege
        }
    }
 
    
    private let resultTypeDeMoteur = UILabel()
    private let resultNombreDeSiege = UILabel()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView(withTitle title: String? = nil) {
        
        // 1
        
        let labelTypeDeMoteur = UILabel()
        labelTypeDeMoteur.text = "Type de Moteur"
        labelTypeDeMoteur.numberOfLines = 0
        labelTypeDeMoteur.font = UIFont
            .preferredFont(forTextStyle: .headline)
        labelTypeDeMoteur.textAlignment = .center
        labelTypeDeMoteur.textColor = .black
        labelTypeDeMoteur.adjustsFontForContentSizeCategory = true
        
       
        let labelNombreDeSiege = UILabel()
        labelNombreDeSiege.text = "Nombre de sieges"
        labelNombreDeSiege.numberOfLines = 0
        labelNombreDeSiege.font = UIFont
            .preferredFont(forTextStyle: .headline)
        labelNombreDeSiege.textAlignment = .center
        labelNombreDeSiege.textColor = .black
        labelNombreDeSiege.adjustsFontForContentSizeCategory = true

        let titleStackView = UIStackView(arrangedSubviews: [labelTypeDeMoteur,labelNombreDeSiege])
        titleStackView.axis = .horizontal
        titleStackView.alignment = .fill
        titleStackView.spacing = UIStackView.spacingUseSystem
        titleStackView.translatesAutoresizingMaskIntoConstraints = false
 
        resultTypeDeMoteur.text = title
        resultTypeDeMoteur.numberOfLines = 0
        resultTypeDeMoteur.font = UIFont
            .preferredFont(forTextStyle: .headline)
        resultTypeDeMoteur.textAlignment = .center
        resultTypeDeMoteur.textColor = .label
        resultTypeDeMoteur.adjustsFontForContentSizeCategory = true
        resultTypeDeMoteur.translatesAutoresizingMaskIntoConstraints = false
        
        resultNombreDeSiege.text = title
        resultNombreDeSiege.numberOfLines = 0
        resultNombreDeSiege.font = UIFont
            .preferredFont(forTextStyle: .headline)
        resultNombreDeSiege.textAlignment = .center
        resultNombreDeSiege.textColor = .label
        resultNombreDeSiege.adjustsFontForContentSizeCategory = true
        resultNombreDeSiege.translatesAutoresizingMaskIntoConstraints = false
        
        let resultStackView = UIStackView(arrangedSubviews: [resultTypeDeMoteur, resultNombreDeSiege])
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




