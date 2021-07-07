//
//  MainViewController.swift
//  PodcastsCourseLBTA
//
//  Created by Ferry Adi Wijayanto on 17/08/19.
//  Copyright © 2019 Ferry Adi Wijayanto. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        initialize()
    }
}

private extension MainViewController {
    
    func initialize() {
        viewControllers = [
            createViewController(with: SearchController(), title: "Search", image: #imageLiteral(resourceName: "search")),
            createViewController(with: FavoriteController(), title: "Favorites", image: #imageLiteral(resourceName: "favorites")),
            createViewController(with: DownloadController(), title: "Downloads", image: #imageLiteral(resourceName: "downloads"))
        ]
    }
    
    func createViewController(with rootController: UIViewController, title: String, image: UIImage) -> UIViewController {
        rootController.navigationItem.title = title
        let navController = UINavigationController(rootViewController: rootController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        
        return navController
    }
}
