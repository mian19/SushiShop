//
//  MenuTabBarController.swift
//  SushiShop
//
//  Created by Kyzu on 6.07.22.
//

import UIKit

class MenuTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nav = generateNavController(vc: ViewController(), imageName: "list.dash")
        let nav1 = generateNavController(vc: UIViewController(), imageName: "bag")
        let nav2 = generateNavController(vc: UIViewController(), imageName: "info")
        
        UITabBar.appearance().tintColor = UIColor.init(rgb: 0xFFFFFF)
        viewControllers = [nav, nav1, nav2]
        
    }
    
    private func generateNavController(vc: UIViewController, imageName: String) -> UINavigationController {
        let navController = UINavigationController(rootViewController: vc)
        navController.tabBarItem.image = UIImage(systemName: imageName)
        navController.isNavigationBarHidden = true
        return navController
    }
}
