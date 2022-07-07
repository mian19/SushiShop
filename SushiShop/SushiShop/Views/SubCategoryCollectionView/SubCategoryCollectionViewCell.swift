//
//  SubCategoryCollectionViewCell.swift
//  SushiShop
//
//  Created by Kyzu on 7.07.22.
//

import UIKit

class SubCategoryCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var textView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var spicyImageView: UIImageView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var toBoxButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 10
        clipsToBounds = false
        toBoxButton.layer.cornerRadius = 10
        toBoxButton.clipsToBounds = true
        textView.layer.cornerRadius = 10
        textView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        imageView.layer.cornerRadius = 10
        imageView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        priceLabel.trailingAnchor.constraint(equalTo: textView.centerXAnchor).isActive = true
        weightLabel.leadingAnchor.constraint(equalTo: textView.centerXAnchor).isActive = true
        //resultView.centerXAnchor.constraint(equalTo: viewForBackground.centerXAnchor).isActive = true

    }

}
