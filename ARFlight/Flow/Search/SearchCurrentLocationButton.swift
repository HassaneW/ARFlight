//
//  SearchCurrentLocationButton.swift
//  ARFlight
//
//  Created by Wandianga hassane on 2021-05-05.
//

import UIKit

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
