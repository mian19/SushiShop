//
//  CategoryCollectionView.swift
//  SushiShop
//
//  Created by Kyzu on 6.07.22.
//

import UIKit

class CategoryCollectionView: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    var cells: [MenuList]?
    
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        super.init(frame: .zero, collectionViewLayout: layout)
        translatesAutoresizingMaskIntoConstraints = false
        layout.minimumLineSpacing = 15
        showsHorizontalScrollIndicator = false
        backgroundColor = .clear
        register(UINib(nibName: String(describing: CategoryCollectionViewCell.self), bundle: .main), forCellWithReuseIdentifier: "sushiCell")
        delegate = self
        dataSource = self
    }
    
    func setItems(cells: [MenuList]?) {
        self.cells = cells
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        cells?.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: "sushiCell", for: indexPath) as! CategoryCollectionViewCell
        cell.updateUI(categoryItem: cells?[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize(width: 140, height: 160)

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


