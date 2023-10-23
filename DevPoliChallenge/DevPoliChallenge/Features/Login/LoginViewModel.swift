//
//  LoginViewModel.swift
//  DevPoliChallenge
//
//  Created by Jessica Serqueira on 20/10/23.
//  Copyright © 2023 DevPoli. All rights reserved.
//

import Foundation

class LoginViewModel {
    var coordinator: LoginCoordinating?

    init(coordinator: LoginCoordinating) {
        self.coordinator = coordinator
    }
    
    func didTapSignUpButton() {
        coordinator?.showSignUpView()
    }
}
