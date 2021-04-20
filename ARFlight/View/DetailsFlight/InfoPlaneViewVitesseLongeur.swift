////
////  InfoPlaneView2.swift
////  ARFlight
////
////  Created by Wandianga hassane on 2021-04-18.
////
//
//
//import UIKit
//
//
//final class InfoPlaneViewVitesseLongeur: UIView  {
//
////    var plane: Plane? {
////        didSet {
////
////        }
////    }
//
//    var titleVitesse: String? {
//        didSet {
//            resultvitesse.text = titleVitesse
//        }
//    }
//    
//    var titleLongeur: String? {
//        didSet {
//            resultLongeur.text = titleLongeur
//        }
//    }
//    
//    private let resultvitesse = UILabel()
//    private let resultLongeur = UILabel()
//    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        setupView()
//    }
//    
//    required init?(coder: NSCoder) {
//        super.init(coder: coder)
//        setupView()
//    }
//    
//    private func setupView(withTitle title: String? = nil) {
//  
//        let labelVitesseDeCroisiere = UILabel()
//        labelVitesseDeCroisiere.text = "Vitesse de Croisiere"
//        labelVitesseDeCroisiere.numberOfLines = 0
//        labelVitesseDeCroisiere.font = UIFont
//            .preferredFont(forTextStyle: .headline)
//        labelVitesseDeCroisiere.textAlignment = .center
//        labelVitesseDeCroisiere.textColor = .black
//        labelVitesseDeCroisiere.adjustsFontForContentSizeCategory = true
//        
//        let labelLongeurPlane = UILabel()
//        labelLongeurPlane.text = "Longeur Plane"
//        labelLongeurPlane.numberOfLines = 0
//        labelLongeurPlane.font = UIFont
//            .preferredFont(forTextStyle: .headline)
//        labelLongeurPlane.textAlignment = .center
//        labelLongeurPlane.textColor = .black
//        labelLongeurPlane.adjustsFontForContentSizeCategory = true
//
//        let vitesseLongeurStackView = UIStackView(arrangedSubviews: [labelVitesseDeCroisiere,labelLongeurPlane])
//        vitesseLongeurStackView.axis = .horizontal
//        vitesseLongeurStackView.alignment = .fill
//        vitesseLongeurStackView.spacing = UIStackView.spacingUseSystem
//        vitesseLongeurStackView.translatesAutoresizingMaskIntoConstraints = false
// 
//        resultvitesse.text = title
//        resultvitesse.numberOfLines = 0
//        resultvitesse.font = UIFont
//            .preferredFont(forTextStyle: .headline)
//        resultvitesse.textAlignment = .center
//        resultvitesse.textColor = .label
//        resultvitesse.adjustsFontForContentSizeCategory = true
//        resultvitesse.translatesAutoresizingMaskIntoConstraints = false
//        
//        resultLongeur.text = title
//        resultLongeur.numberOfLines = 0
//        resultLongeur.font = UIFont
//            .preferredFont(forTextStyle: .headline)
//        resultLongeur.textAlignment = .center
//        resultLongeur.textColor = .label
//        resultLongeur.adjustsFontForContentSizeCategory = true
//        resultLongeur.translatesAutoresizingMaskIntoConstraints = false
//        
//        let resultVitesseLongeurStackView = UIStackView(arrangedSubviews: [resultvitesse, resultLongeur])
//        resultVitesseLongeurStackView.axis = .horizontal
//        resultVitesseLongeurStackView.alignment = .fill
//        resultVitesseLongeurStackView.spacing = UIStackView.spacingUseSystem
//        resultVitesseLongeurStackView.translatesAutoresizingMaskIntoConstraints = false
//        
//        let contentView = UIStackView(arrangedSubviews: [vitesseLongeurStackView,resultVitesseLongeurStackView])
//        contentView.axis = .vertical
//        contentView.alignment = .fill
//        contentView.spacing = UIStackView.spacingUseSystem
//        contentView.translatesAutoresizingMaskIntoConstraints = false
//        
//        
//        addSubview(contentView)
//        
//        NSLayoutConstraint.activate([
//
//            contentView.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1.0),
//            
//            bottomAnchor.constraint(equalToSystemSpacingBelow: contentView.bottomAnchor, multiplier: 1.0),
//            contentView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1.0),
//            trailingAnchor.constraint(equalToSystemSpacingAfter: contentView.trailingAnchor, multiplier: 1.0),
//        ])
//    }
//}
//
//
//
//
//
