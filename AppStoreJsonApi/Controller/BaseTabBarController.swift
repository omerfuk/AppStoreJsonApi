//
//  BaseTabBarController.swift
//  AppStoreJsonApi
//
//  Created by Ömer Faruk Kılıçaslan on 20.06.2022.
//

import UIKit

class BaseTabBarController: UITabBarController {
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewControllers = [
            createNavController(viewController: AppsSearchController(), title: "Search", imageName: "search"),
            createNavController(viewController: UIViewController(), title: "Today", imageName: "today_icon"),
            createNavController(viewController: UIViewController(), title: "Apps", imageName: "apps"),
             
        ]
        
        
        
    }
    
    
    fileprivate func createNavController(viewController: UIViewController, title: String, imageName: String) -> UIViewController {
        
        let navController = UINavigationController(rootViewController: viewController)
        
        view.backgroundColor = .systemBackground
        
        viewController.navigationItem.title = title
        
        navController.tabBarItem.title = title
        navController.tabBarItem.image = UIImage(named: imageName)
        navController.navigationBar.prefersLargeTitles = true
        
        return navController
    }
    
    
}
