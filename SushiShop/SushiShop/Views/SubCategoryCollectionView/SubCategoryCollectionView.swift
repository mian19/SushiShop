//
//  SubCategoryCollectionView.swift
//  SushiShop
//
//  Created by Kyzu on 7.07.22.
//

import UIKit

class SubCategoryCollectionView: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    var cells: [MenuList]?
    
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        super.init(frame: .zero, collectionViewLayout: layout)
        translatesAutoresizingMaskIntoConstraints = false
        showsVerticalScrollIndicator = false
        layout.minimumLineSpacing = 50
        backgroundColor = .clear
        register(UINib(nibName: String(describing: SubCategoryCollectionViewCell.self), bundle: .main), forCellWithReuseIdentifier: "subCell")
        delegate = self
        dataSource = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: "subCell", for: indexPath) as! SubCategoryCollectionViewCell
  
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let widthCell = self.bounds.width / 2 - 15
        return CGSize(width: widthCell, height: widthCell * 1.33)
    }
    
    
    
}
