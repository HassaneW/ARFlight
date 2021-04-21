////
////  CustomLabelTitle.swift
////  ARFlight
////
////  Created by Wandianga hassane on 2021-04-20.
////
//
//import UIKit
//
//
//// 1) supprimer tous les title du label et le remplacer par un seul ?
//
//class CustomLabelTitle: UILabel {
//    
//    var title: String? {
//        didSet {
//            titleLabel.text = title
//        }
//    }
//    
//    private let titleLabel = UILabel()
//    
//    
//    init(title: String?) {
//        super.init(frame: .zero)
//        sharedInit()
//    }
//    
//    required init?(coder: NSCoder) {
//        super.init(coder: coder)
//        sharedInit()
//    }
//    private func sharedInit() {
//        titleLabel.text = title
//        titleLabel.numberOfLines = 2
//        titleLabel.font = UIFont
//            .preferredFont(forTextStyle: .largeTitle)
//   
//        //titleLabel.adjustsFontSizeToFitWidth = true
//        titleLabel.textAlignment = .center
//        titleLabel.textColor = .label
//        titleLabel.adjustsFontForContentSizeCategory = true
//    }
//}
//
//extension UILabel {
//    
//    convenience init(text: String?) {
//        self.init()
//        self.text = text
//    }
//    
//    convenience init(text: String? = nil, font: UIFont) {
//        self.init()
//        self.font = font
//        self.text = text
//        self.adjustsFontForContentSizeCategory = true
//    }
//}
