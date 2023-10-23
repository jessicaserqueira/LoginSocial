//
//  MainCoordinator.swift
//  DevPoliChallenge
//
//  Created by Jessica Serqueira on 19/10/23.
//  Copyright © 2023 DevPoli. All rights reserved.
//

import UIKit

class MainCoordinator: Coordinator {
    let window: UIWindow
    var navigationController: UINavigationController
    var navigationBarController: UINavigationBar
    var childCoordinators: [Coordinator] = []
    
    init(window: UIWindow) {
        self.window = window
        self.navigationController = UINavigationController()
        self.navigationBarController = UINavigationBar()
    }
    
    func start() {
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        let loginCoordinator = LoginCoordinator(navigationController: navigationController)
        coordinate(to: loginCoordinator)
    }
}
