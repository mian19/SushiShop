//
//  ViewController.swift
//  SushiShop
//
//  Created by Kyzu on 6.07.22.
//

import UIKit

class ViewController: UIViewController {

    private var logoImageView: UIImageView!
    private var phoneButton: UIButton!
    private var categoryCollectionView: CategoryCollectionView!
    private var sushiLabel: UILabel!
    private var subCategoryCollectionView: UICollectionView!
    private var menuSushiList = [MenuList]()
    
    override func loadView() {
        let customView = UIView(frame: UIScreen.main.bounds)
        customView.backgroundColor = UIColor.init(rgb: 0x1b1b1b)
        view = customView
        
        setLogoImageView()
        setPhoneButton()
        setCategoryCollection()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setElements()
        fetchMenuList()
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }
    
    private func setLogoImageView() {
        logoImageView = UIImageView()
        logoImageView.image = UIImage(named: "logo")
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(logoImageView)
    }
    
    private func setPhoneButton() {
        phoneButton = UIButton.systemButton(image: "phone")
        view.addSubview(phoneButton)
    }
    
    private func setCategoryCollection() {
        categoryCollectionView = CategoryCollectionView()
        view.addSubview(categoryCollectionView)
    }
    
   
    private func setElements() {
        NSLayoutConstraint.activate([
        
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            logoImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            logoImageView.widthAnchor.constraint(equalToConstant: 180),
            logoImageView.heightAnchor.constraint(equalToConstant: 40),
            phoneButton.widthAnchor.constraint(equalToConstant: 40),
            phoneButton.heightAnchor.constraint(equalToConstant: 40),
            phoneButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            view.trailingAnchor.constraint(equalTo: phoneButton.trailingAnchor, constant: 20),
            categoryCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            categoryCollectionView.heightAnchor.constraint(equalToConstant: 150),
            categoryCollectionView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 15),
            categoryCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
          
        ])
    }
    
    // MARK: - work with Network
    
    private func fetchMenuList() {
        NetworkManager().getCategoriesSushi { [weak self] (result) in
            switch result {
            case .success(let allMenu):
                self?.menuSushiList = allMenu.menuList
                print(self?.menuSushiList)
                self?.categoryCollectionView.setItems(cells: self?.menuSushiList ?? nil)
                self?.categoryCollectionView.reloadData()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    private func numberOfItemsInSection(section: Int) -> Int {
        menuSushiList.count != 0 ? menuSushiList.count : 0

    }
   

}

