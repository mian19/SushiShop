//
//  UILabel+CustomLabel.swift
//  SushiShop
//
//  Created by Kyzu on 7.07.22.
//

import UIKit

extension UILabel {
    
    static func infoLabel(text: String) -> UILabel {
        let label = UILabel()
        label.font = UIFont(name: "HelveticaNeue-Medium", size: CGFloat(35))
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontSizeToFitWidth = true
        label.textColor = UIColor.init(rgb: 0xFFFFFF)
        label.textAlignment = .left
        label.text = text
        return label
    }
    
    func setCharacterSpacing(_ spacing: CGFloat){
        let attributedStr = NSMutableAttributedString(string: self.text ?? "")
        attributedStr.addAttribute(NSAttributedString.Key.kern, value: spacing, range: NSMakeRange(0, attributedStr.length))
        self.attributedText = attributedStr
     }
    
}
