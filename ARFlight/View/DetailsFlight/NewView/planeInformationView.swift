//
//  planeInformationView.swift
//  ARFlight
//
//  Created by Wandianga hassane on 2021-04-26.
//

import Foundation
import UIKit

//planeInformationView =  PlaneView + InfoPlaneView



final class PlaneInformationView: UIView  {
    
    var plane: Plane? {
        didSet {
            guard let plane = plane else { return }
            configureViewWithPlane(plane)
        }
    }
    
    private let titleLabel = UILabel()
    private let imageView = UIImageView()
    
    private let resultvitesse = UILabel()
    private let resultLongeur = UILabel()
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
        
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.numberOfLines = 0
        titleLabel.font = UIFont
            .preferredFont(forTextStyle: .largeTitle)
        titleLabel.textAlignment = .center
        titleLabel.textColor = .label
        titleLabel.adjustsFontForContentSizeCategory = true
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // View InfoplaneView1
        
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
        
        let titleContentView = UIStackView(arrangedSubviews: [titleStackView, resultStackView], axis: .vertical)
        
        // View InfoplaneView2
        
        let labelVitesseDeCroisiere = UILabel()
        labelVitesseDeCroisiere.text = "Vitesse de Croisiere"
        labelVitesseDeCroisiere.numberOfLines = 0
        labelVitesseDeCroisiere.font = UIFont
            .preferredFont(forTextStyle: .headline)
        labelVitesseDeCroisiere.textAlignment = .center
        labelVitesseDeCroisiere.textColor = .black
        labelVitesseDeCroisiere.adjustsFontForContentSizeCategory = true
        
        let labelLongeurPlane = UILabel()
        labelLongeurPlane.text = "Longeur Plane"
        labelLongeurPlane.numberOfLines = 0
        labelLongeurPlane.font = UIFont
            .preferredFont(forTextStyle: .headline)
        labelLongeurPlane.textAlignment = .center
        labelLongeurPlane.textColor = .black
        labelLongeurPlane.adjustsFontForContentSizeCategory = true
        
        let vitesseLongeurStackView = UIStackView(
            arrangedSubviews: [labelVitesseDeCroisiere,labelLongeurPlane],
            axis: .horizontal,
            spacing: UIStackView.spacingUseSystem,
            alignment: .fill,
            distribution: .fill)
        
        resultvitesse.text = title
        resultvitesse.numberOfLines = 0
        resultvitesse.font = UIFont
            .preferredFont(forTextStyle: .headline)
        resultvitesse.textAlignment = .center
        resultvitesse.textColor = .label
        resultvitesse.adjustsFontForContentSizeCategory = true
        resultvitesse.translatesAutoresizingMaskIntoConstraints = false
        
        resultLongeur.numberOfLines = 0
        resultLongeur.font = UIFont
            .preferredFont(forTextStyle: .headline)
        resultLongeur.textAlignment = .center
        resultLongeur.textColor = .label
        resultLongeur.adjustsFontForContentSizeCategory = true
        resultLongeur.translatesAutoresizingMaskIntoConstraints = false
        
        let resultVitesseLongeurStackView = UIStackView()
        resultVitesseLongeurStackView.addArrangedSubviews(resultvitesse, resultLongeur)
        resultVitesseLongeurStackView.axis = .horizontal
        resultVitesseLongeurStackView.alignment = .fill
        resultVitesseLongeurStackView.spacing = UIStackView.spacingUseSystem
        resultVitesseLongeurStackView.translatesAutoresizingMaskIntoConstraints = false
        
        let contentViewVL = UIStackView(arrangedSubviews: [vitesseLongeurStackView,resultVitesseLongeurStackView])
        contentViewVL.axis = .vertical
        contentViewVL.alignment = .fill
        contentViewVL.spacing = UIStackView.spacingUseSystem
        contentViewVL.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        // MARK: - contentStackView
        //        let contentStackView = UIStackView(arrangedSubviews: [titleStackView, titleContentView, vitesseLongeurStackView, contentViewVL])
        //        contentStackView.axis = .vertical
        //        contentStackView.alignment = .fill
        //        contentStackView.spacing = 20
        //        contentStackView.translatesAutoresizingMaskIntoConstraints = false
        //
        //        let scrollView = UIScrollView()
        //        scrollView.addSubview(contentStackView)
        //        scrollView.translatesAutoresizingMaskIntoConstraints = false
        //        contentStackView.addSubview(scrollView)
        //
        //        NSLayoutConstraint.activate([
        //            scrollView.leadingAnchor.constraint(equalTo: contentStackView.safeAreaLayoutGuide.leadingAnchor),
        //            scrollView.trailingAnchor.constraint(equalTo: contentStackView.safeAreaLayoutGuide.trailingAnchor),
        //            scrollView.topAnchor.constraint(equalTo: contentStackView.safeAreaLayoutGuide.topAnchor),
        //            scrollView.bottomAnchor.constraint(equalTo: contentStackView.safeAreaLayoutGuide.bottomAnchor),
        //            scrollView.trailingAnchor.constraint(equalToSystemSpacingAfter: contentStackView.trailingAnchor, multiplier: 1.5),
        //            scrollView.bottomAnchor.constraint(equalToSystemSpacingBelow: contentStackView.bottomAnchor, multiplier: 1.0),
        //
        //            contentStackView.centerXAnchor.constraint(equalTo: contentStackView.safeAreaLayoutGuide.centerXAnchor),
        //            contentStackView.topAnchor.constraint(equalToSystemSpacingBelow: scrollView.topAnchor, multiplier: 2),
        //            contentStackView.leadingAnchor.constraint(equalToSystemSpacingAfter: scrollView.leadingAnchor, multiplier: 1.5)
        //        ])
        
        let contentStackView = UIStackView(arrangedSubviews: [titleStackView, titleContentView, vitesseLongeurStackView, contentViewVL, imageView])
        contentStackView.axis = .vertical
        contentStackView.alignment = .fill
        contentStackView.spacing = 20
        contentStackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(contentStackView)
        
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: 150),
            imageView.heightAnchor.constraint(equalToConstant: 150),
            
            contentStackView.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1.0),
            
            bottomAnchor.constraint(equalToSystemSpacingBelow: contentStackView.bottomAnchor, multiplier: 1.0),
            contentStackView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1.0),
            trailingAnchor.constraint(equalToSystemSpacingAfter: contentStackView.trailingAnchor, multiplier: 1.0),
        ])
        
    }
    
    private  func configureViewWithPlane(_ plane: Plane) {
        titleLabel.text = plane.id
        resultTypeDeMoteur.text = plane.motorType
        resultNombreDeSiege.text = plane.numberOfSeats
        resultvitesse.text = plane.cruisingSpeed
        resultLongeur.text = "\(plane.length)"
        imageView.image = UIImage(named: plane.image)
    }
}


