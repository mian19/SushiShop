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
    private var categoryCollectionViewController: UICollectionViewController!
    private var sushiLabel: UILabel!
    private var subCategoryCollectionView: UICollectionViewController!
    
    override func loadView() {
        let customView = UIView(frame: UIScreen.main.bounds)
        customView.backgroundColor = UIColor.init(rgb: 0x1b1b1b)
        view = customView
        
        setLogoImageView()
        setPhoneButton()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setElements()
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
          
        ])
    }
   

}

