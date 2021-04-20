//
//  UIImage.swift
//  ARFlight
//
//  Created by Wandianga hassane on 2021-04-20.
//

import UIKit
import Foundation

class CustomUIImage: UIView {

    var image: UIImage? {
        didSet {
            imageView.image = image
        }
    }
    private let imageView = UIImageView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    private func setupView() {
        
        if let imageName = image {
            let myImage = UIImageView(image: imageName)
            myImage.clipsToBounds = true
            myImage.contentMode = UIView.ContentMode.scaleAspectFit
        }
    }
}

