//
//  MainCoordinator.swift
//  DevPoliChallenge
//
//  Created by Jessica Serqueira on 19/10/23.
//  Copyright © 2023 DevPoli. All rights reserved.
//

import UIKit

class MainCoordinator: Coordinator {
  var navigationController: UINavigationController

  init(navigationController: UINavigationController) {
    self.navigationController = navigationController
  }

  func start() {
    let viewController = LoginViewController()
    navigationController.pushViewController(viewController, animated: false)
  }
}
