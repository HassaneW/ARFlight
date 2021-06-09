//
//  planeInformationView.swift
//  ARFlight
//
//  Created by Wandianga hassane on 2021-04-26.
//

import Foundation
import UIKit


final class PlaneInformationView: UIView  {
    
    var plane: Plane? {
        didSet {
            guard let plane = plane else { return }
            configureViewWithPlane(plane)
        }
    }
    private let titlePlane = UILabel()
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
    
    private func setupView() {
        
        titlePlane.configureFlightDetailsInformationLabel()
        titlePlane.font = .preferredFont(forTextStyle: .largeTitle)
        
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        let titlePlaneStackView = UIStackView(arrangedSubviews: [titlePlane, imageView],
                                              axis: .vertical,
                                              spacing: UIStackView.spacingUseSystem,
                                              alignment: .center,
                                              distribution: .equalSpacing)
        
        let labelTypeDeMoteur = UILabel(text: "Type de Moteur")
        configureTitleLabel(labelTypeDeMoteur)
        resultTypeDeMoteur.configureFlightDetailsInformationLabel()
        
        let typeMoteurStackView = UIStackView(arrangedSubviews: [labelTypeDeMoteur, resultTypeDeMoteur],
                                              axis: .vertical,
                                              spacing: UIStackView.spacingUseSystem,
                                              alignment: .center,
                                              distribution: .equalSpacing)
        
        let labelNombreDeSiege = UILabel(text: "Nombre de sieges")
        configureTitleLabel(labelNombreDeSiege)
        resultNombreDeSiege.configureFlightDetailsInformationLabel()
        
        let nombreDeSiegeStackView = UIStackView(arrangedSubviews: [labelNombreDeSiege, resultNombreDeSiege],
                                                 axis: .vertical,
                                                 spacing: UIStackView.spacingUseSystem,
                                                 alignment: .center,
                                                 distribution: .equalSpacing)
        
        let moteurSiegeStackView = UIStackView(arrangedSubviews: [typeMoteurStackView, nombreDeSiegeStackView],
                                               axis: .horizontal,
                                               spacing: UIStackView.spacingUseSystem,
                                               alignment: .firstBaseline,
                                               distribution: .fillEqually)
        
        let labelVitesseDeCroisiere = UILabel(text: "Vitesse de Croisiere")
        configureTitleLabel(labelVitesseDeCroisiere)
        resultvitesse.configureFlightDetailsInformationLabel()
        
        let vitesseStackView = UIStackView(arrangedSubviews: [labelVitesseDeCroisiere, resultvitesse],
                                           axis: .vertical,
                                           spacing: UIStackView.spacingUseSystem,
                                           alignment: .center,
                                           distribution: .equalSpacing)
        
        let labelLongeurPlane = UILabel(text: "Longeur Plane")
        configureTitleLabel(labelLongeurPlane)
        resultLongeur.configureFlightDetailsInformationLabel()
        
        let longeurPlaneStackView = UIStackView(arrangedSubviews: [labelLongeurPlane, resultLongeur],
                                                axis: .vertical,
                                                spacing: UIStackView.spacingUseSystem,
                                                alignment: .center,
                                                distribution: .equalSpacing)
        
        let longeurVitesseeStackView = UIStackView(arrangedSubviews: [vitesseStackView, longeurPlaneStackView],
                                                   axis: .horizontal,
                                                   spacing: UIStackView.spacingUseSystem,
                                                   alignment: .firstBaseline,
                                                   distribution: .fillEqually)
        
        let contentStackView = UIStackView(arrangedSubviews: [titlePlaneStackView, moteurSiegeStackView, longeurVitesseeStackView])
        contentStackView.axis = .vertical
        contentStackView.alignment = .fill
        contentStackView.spacing = 20
        contentStackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(contentStackView)
        
        NSLayoutConstraint.activate([
            contentStackView.topAnchor.constraint(equalToSystemSpacingBelow: safeAreaLayoutGuide.topAnchor, multiplier: 1.0),
            contentStackView.leadingAnchor.constraint(equalToSystemSpacingAfter: safeAreaLayoutGuide.leadingAnchor, multiplier: 1.5),
            safeAreaLayoutGuide.trailingAnchor.constraint(equalToSystemSpacingAfter: contentStackView.trailingAnchor, multiplier: 1.5),
            safeAreaLayoutGuide.bottomAnchor.constraint(equalToSystemSpacingBelow: contentStackView.bottomAnchor, multiplier: 1.0)
        ])
    }
    private  func configureViewWithPlane(_ plane: Plane) {
        titlePlane.text = plane.id
        resultTypeDeMoteur.text = plane.motorType
        resultNombreDeSiege.text = plane.numberOfSeats
        resultvitesse.text = plane.cruisingSpeed
        resultLongeur.text = "\(plane.length)"
        imageView.image = UIImage(named: plane.image)
    }
    func configureTitleLabel(_ label: UILabel) {
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .label
        label.adjustsFontSizeToFitWidth = true
        label.adjustsFontForContentSizeCategory = true
        label.font = .preferredFont(forTextStyle: .headline)
    }
}
