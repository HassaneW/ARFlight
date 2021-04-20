//
//  CustomUILabel.swift
//  ARFlight
//
//  Created by Wandianga hassane on 2021-04-20.
//

import UIKit

// 1) Juste changer le texte ex: ville

class CustomUILabel: UILabel {
    
    
// 1) supprimer tous les title du label et le remplacer par un seul ?
//    var title: String? {
//        didSet {
//            titleLabel.text = title
//        }
//    }
//
//    private let titleLabel = UILabel()
    
    init(title: String?) {
        super.init(frame: .zero)
        sharedInit()

    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        sharedInit()
    }
    private func sharedInit() {
        textAlignment = .center
        numberOfLines = 1
        font = UIFont.preferredFont(forTextStyle: .largeTitle)
        textColor = .cyan
        adjustsFontForContentSizeCategory = true
//        translatesAutoresizingMaskIntoConstraints = false
   
    }
}



