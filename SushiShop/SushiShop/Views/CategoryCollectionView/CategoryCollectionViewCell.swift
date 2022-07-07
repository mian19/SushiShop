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
    private var fullImageURLString: String = ""
    
    override func awakeFromNib() {
        super.awakeFromNib()
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = 10
        clipsToBounds = true
    }
    
    func updateUI(categoryItem: MenuList?) {
        categoryNameLabel.text = categoryItem?.name ?? "Loading..."
        categoryPositionsLabel.text = correctWord(categoryItem?.subMenuCount ?? 0)
        guard let imageURLString = categoryItem?.image else { return }
        fullImageURLString = "https://vkus-sovet.ru" + imageURLString
        guard let imageURL = URL(string: fullImageURLString) else {
            categoryImageView.image = UIImage(named: "noImageAvailable")
            return }
        
        categoryImageView.image = nil
        categoryImageView.contentMode = .scaleToFill
        
        setImageForCategorySushi(url: imageURL)
    }
    
    //MARK: - work with network
    private func setImageForCategorySushi(url: URL) {
        NetworkManager().getImageForCategorySushi(url: url) { [weak self] (result) in
            switch result {
            case .success(let image):
                self?.categoryImageView.image = image
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    
    func correctWord(_ numb: Int) -> String {
        var returnText = ""
        let testPostfix = numb % 10
        if [0,5,6,7,8,9].contains(testPostfix) || (11...20).contains(numb % 100)  {
            returnText = "\(numb) товаров"
        } else if testPostfix == 1  {
            returnText = "\(numb) товар"
        } else if [2,3,4].contains(testPostfix) {
            returnText = "\(numb) товара"
        }
        
        return returnText
    }
    
}
