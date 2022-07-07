//
//  ViewController.swift
//  SushiShop
//
//  Created by Kyzu on 6.07.22.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate {
    
    private var logoImageView: UIImageView!
    private var phoneButton: UIButton!
    private var categoryCollectionView: CategoryCollectionView!
    private var subCategoryCollectionView: SubCategoryCollectionView!
    private var menuSushiList = [MenuList]()
    private var subMenuSushiList = [MenuList]()
    var sushiLabel: UILabel!
    
    override func loadView() {
        let customView = UIView(frame: UIScreen.main.bounds)
        customView.backgroundColor = UIColor.init(rgb: 0x1b1b1b)
        view = customView
        
        setLogoImageView()
        setPhoneButton()
        setCategoryCollection()
        setSushiLabel()
        setSubCategoryCollectionView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setElements()
        fetchMenuList()
        categoryCollectionView.myDeleg = self
        
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
    
    private func setSushiLabel() {
        sushiLabel = UILabel.infoLabel(text: categoryCollectionView?.selectedCategoryName ?? "")
        view.addSubview(sushiLabel)
    }
    
    private func setSubCategoryCollectionView() {
        subCategoryCollectionView = SubCategoryCollectionView()
        view.addSubview(subCategoryCollectionView)
    }
    
    private func setElements() {
        NSLayoutConstraint.activate([
            
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            logoImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            logoImageView.widthAnchor.constraint(equalToConstant: 160),
            logoImageView.heightAnchor.constraint(equalToConstant: 40),
            phoneButton.widthAnchor.constraint(equalToConstant: 40),
            phoneButton.heightAnchor.constraint(equalToConstant: 40),
            phoneButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            view.trailingAnchor.constraint(equalTo: phoneButton.trailingAnchor, constant: 20),
            categoryCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            categoryCollectionView.heightAnchor.constraint(equalToConstant: 160),
            categoryCollectionView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 20),
            view.trailingAnchor.constraint(equalTo: categoryCollectionView.trailingAnchor, constant: 10),
            sushiLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            sushiLabel.topAnchor.constraint(equalTo: categoryCollectionView.bottomAnchor, constant: 10),
            view.trailingAnchor.constraint(equalTo: sushiLabel.trailingAnchor, constant: 10),
            subCategoryCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            view.trailingAnchor.constraint(equalTo: subCategoryCollectionView.trailingAnchor, constant: 10),
            subCategoryCollectionView.topAnchor.constraint(equalTo: sushiLabel.bottomAnchor, constant: 10),
            subCategoryCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            
        ])
    }
    
    // MARK: - work with Network
    
    private func fetchMenuList() {
        NetworkManager().getCategoriesSushi { [weak self] (result) in
            switch result {
            case .success(let allMenu):
                self?.menuSushiList = allMenu.menuList
                self?.categoryCollectionView.setItems(cells: self?.menuSushiList ?? nil)
                self?.categoryCollectionView.reloadData()
                self?.sushiLabel.text = self?.menuSushiList[0].name
                self?.fetchSubMenu(menuID: (self?.menuSushiList[0].menuID)!)
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func fetchSubMenu(menuID: String) {
        NetworkManager().getSubCategorySushi(forBody: menuID) { [weak self] (result) in
            switch result {
            case .success(let subMenu):
                self?.subMenuSushiList = subMenu.menuList
                self?.subCategoryCollectionView.setItems(cells: self?.subMenuSushiList ?? nil)
                self?.subCategoryCollectionView.reloadData()
                self?.subCategoryCollectionView.setContentOffset(CGPoint(x:0 ,y:0), animated: false)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
}

