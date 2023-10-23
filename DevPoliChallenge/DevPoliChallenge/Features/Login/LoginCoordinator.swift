//
//  LoginViewCoordinator.swift
//  DevPoliChallenge
//
//  Created by Jessica Serqueira on 20/10/23.
//  Copyright © 2023 DevPoli. All rights reserved.
//

import UIKit

class LoginCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let loginViewModel = LoginViewModel(coordinator: self)
        let loginViewController = LoginViewController(viewModel: loginViewModel)
        navigationController.pushViewController(loginViewController, animated: true)
    }
}

extension LoginCoordinator: LoginCoordinating {
    func showSignUpView() {
        let signUpCoordinator = SignUPCoordinator(navigationController: navigationController)
        signUpCoordinator.start()
    }
}
