//
//  SignUPCoordinator.swift
//  DevPoliChallenge
//
//  Created by Jessica Serqueira on 20/10/23.
//  Copyright © 2023 DevPoli. All rights reserved.
//

import UIKit

class SignUPCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let signUpViewModel = SignUPViewModel(coordinator: self)
        let signUpViewController = SignUPViewController(viewModel: signUpViewModel)
        navigationController.pushViewController(signUpViewController, animated: true)
    }
}

extension SignUPCoordinator: SignUPCoordinating {
    func showMainView() {
        
    }
}
