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
        static let spacing: CGFloat = 20
        static let cornerRadius: CGFloat = 10
    }
    
    init() {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        layer.cornerRadius = Constant.cornerRadius
        
        tintColor = .label
        setTitle("Current Location", for: .normal)
        setTitleColor(UIColor.label, for: .normal)
        setTitleColor(UIColor.systemGray3, for: .highlighted)
        titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        titleLabel?.adjustsFontForContentSizeCategory = true
        
        setImage(UIImage(systemName: "magnifyingglass.circle.fill"), for: .normal)
        contentHorizontalAlignment = .center
        contentVerticalAlignment = .center

        titleEdgeInsets = UIEdgeInsets(top: 10, left: Constant.spacing, bottom: 10, right: 0)
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
