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
    private var fullImageURLString: String = ""
    
    override func awakeFromNib() {
        super.awakeFromNib()
        translatesAutoresizingMaskIntoConstraints = false
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
    }
    
    func updateUI(subCategoryItem: MenuList?) {
        nameLabel.text = subCategoryItem?.name ?? "Name"
        contentLabel.text = subCategoryItem?.content ?? "content"
        priceLabel.text = "\(subCategoryItem?.price?.dropLast(3) ?? "0") ₽"
        weightLabel.text = " / \(subCategoryItem?.weight ?? "0 г")."
        guard let imageURLString = subCategoryItem?.image else { return }
        fullImageURLString = "https://vkus-sovet.ru" + imageURLString
        guard let imageURL = URL(string: fullImageURLString) else {
            imageView.image = UIImage(named: "noImageAvailable")
            return }
        
        imageView.image = nil
        imageView.contentMode = .scaleToFill
        
        setImageForSubCategorySushi(url: imageURL)
    }
    
    //MARK: - work with network
    private func setImageForSubCategorySushi(url: URL) {
        NetworkManager().getImageForCategorySushi(url: url) { [weak self] (result) in
            switch result {
            case .success(let image):
                self?.imageView.image = image
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

}
