//
//  SearchCurrentLocationButton.swift
//  ARFlight
//
//  Created by Wandianga hassane on 2021-05-05.
//

import UIKit

/*
 SearchCurrentLocationButton (heirter de UIButton)
 UIButton (utiliser UIButton image property sinon UIImageView
 */

class SearchCurrentLocationButton: UIButton {
    
    private enum Constant {
        static let padding: CGFloat = 10
        static let imageWidth: CGFloat = 40
    }
    
    init() {
        super.init(frame: .zero)
        setupViewWith()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViewWith() {
        
        let button = UIButton()
        button.backgroundColor = UIColor.lightGray
        button.setTitle("Current Location", for: UIControl.State.normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        
        let image = UIImage(systemName: "magnifyingglass.circle.fill")
        button.setImage(image, for: .normal)
        button.contentHorizontalAlignment = .center
        button.contentVerticalAlignment = .center

        let spacing: CGFloat = 20
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: spacing, bottom: 0, right: 0)
        
        button.tintColor = .systemBackground
        button.addTarget(self, action: #selector(self.buttonAction), for: .touchUpInside)
        
        let buttonStackView = UIStackView(
            arrangedSubviews: [button],
            axis: .horizontal,
            spacing: UIStackView.spacingUseSystem,
            alignment: .fill,
            distribution: .fillProportionally)
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(buttonStackView)
        
        NSLayoutConstraint.activate([
            //            leadingImageView.widthAnchor.constraint(equalToConstant: Constant.imageWidth),
            //            leadingImageView.heightAnchor.constraint(equalTo: leadingImageView.widthAnchor),
            
            buttonStackView.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1.0),
            buttonStackView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1.0),
            bottomAnchor.constraint(equalToSystemSpacingBelow: buttonStackView.bottomAnchor, multiplier: 1.0),
            trailingAnchor.constraint(equalToSystemSpacingAfter: buttonStackView.trailingAnchor, multiplier: 1.0),
        ])
    }
    
    @objc func buttonAction(_ sender:UIButton!)
    {
        print("Button tapped")
    }
    
}
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        sharedInit()
//    }
//
//    required init?(coder: NSCoder) {
//        super.init(coder: coder)
//        sharedInit()
//    }
//
//    private func sharedInit() {
//
//        enum Constant {
//            static let xPostion:CGFloat = 50
//            static let yPostion:CGFloat = 100
//            static let buttonWidth:CGFloat = 150
//            static let buttonHeight:CGFloat = 45
//        }
//
//        frame = CGRect(x:Constant.xPostion, y:Constant.yPostion, width:Constant.buttonWidth, height:Constant.buttonHeight)
//        backgroundColor = UIColor.lightGray
//        setTitle("Current Location", for: UIControl.State.normal)
//        clipsToBounds = true
//        layer.cornerRadius = 12
//        layer.borderWidth = 1.0
//        tintColor = UIColor.black
//        addTarget(self, action: #selector(self.buttonAction), for: .touchUpInside)
//
//
////        let imageSearch = UIImage(systemName: "magnifyingglass.circle.fill")
////        let myImageSearch:UIImageView = UIImageView()
////        myImageSearch.contentMode = UIView.ContentMode.center
////        myImageSearch.clipsToBounds = true
////        myImageSearch.contentMode = UIView.ContentMode.scaleAspectFit
////        myImageSearch.image = imageSearch
//
//    }
//
//    func imageButton() -> UIImageView {
//
////        imageView?.image = UIImage(systemName: "magnifyingglass.circle.fill")
////        imageView?.contentMode = UIView.ContentMode.center
////        imageView?.clipsToBounds = true
////        imageView?.contentMode = UIView.ContentMode.scaleAspectFit
//
//                let imageSearch = UIImage(systemName: "magnifyingglass.circle.fill")
//                let myImageSearch:UIImageView = UIImageView()
//                myImageSearch.contentMode = UIView.ContentMode.center
//                myImageSearch.clipsToBounds = true
//                myImageSearch.contentMode = UIView.ContentMode.scaleAspectFit
//                myImageSearch.image = imageSearch
//
//        return myImageSearch
//    }
//
//    @objc func buttonAction(_ sender:UIButton!)
//    {
//        print("Button tapped")
//    }
//
//    //        clipsToBounds = true
//    //        layer.cornerRadius = 12
//    //        layer.borderWidth = 1.0
//    //        layer.borderColor = UIColor.red.cgColor
//    //        backgroundColor = UIColor.purple
//
//}


/*
 
 class ActionButton: UIButton {
 
 var title: String? {
 didSet {
 setTitle(title, for: .normal)
 }
 }
 override init(frame: CGRect) {
 super.init(frame: frame)
 sharedInit()
 }
 
 required init?(coder: NSCoder) {
 super.init(coder: coder)
 sharedInit()
 }
 
 private func sharedInit() {
 clipsToBounds = true
 layer.cornerRadius = 12
 layer.borderWidth = 1.0
 layer.borderColor = UIColor.red.cgColor
 backgroundColor = UIColor.purple
 }
 }
 
 */
