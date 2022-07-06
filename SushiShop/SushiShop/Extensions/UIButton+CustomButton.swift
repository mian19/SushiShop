//
//  UIButton+CustomButton.swift
//  SushiShop
//
//  Created by Kyzu on 6.07.22.
//

import Foundation
import UIKit
extension UIButton {
    
    static func systemButton(image: String) -> UIButton {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        let backImage = UIImage(systemName: image)
        button.setBackgroundImage(backImage, for: .normal)
        button.tintColor = .white
        return button
    }
    
}
