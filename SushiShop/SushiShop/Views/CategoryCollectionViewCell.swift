//
//  CategoryCollectionViewCell.swift
//  SushiShop
//
//  Created by Kyzu on 6.07.22.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var categoryImageView: UIImageView!    
    @IBOutlet weak var categoryNameLabel: UILabel!
    @IBOutlet weak var categoryPositionsLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = 10
        clipsToBounds = true
    }

}
