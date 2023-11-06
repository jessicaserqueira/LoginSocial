//
//  LoginViewModel.swift
//  DevPoliChallenge
//
//  Created by Jessica Serqueira on 20/10/23.
//  Copyright © 2023 DevPoli. All rights reserved.
//

import Foundation

class LoginViewModel: EmailValidator {
    weak var delegate: LoginViewModelDelegate?
    var coordinator: LoginCoordinating?
    
    init(coordinator: LoginCoordinating) {
        self.coordinator = coordinator
    }
    
    func didTapSignUpButton() {
        coordinator?.showSignUpView()
    }
    
    func signIn(email: String, password: String) {
        var error: SignINError?
        var message: String = ""
        
        if email.isEmpty {
            error = .emptyEmail
        } else if !isValidEmail(email) {
            error = .invalidEmail
        } else if password != "Teste@123" {
            error = .incorrectCredentials
        }
        
        if let error = error {
            switch error {
            case .emptyEmail:
                message = "Informe o e-mail para continuar"
            case .invalidEmail:
                message = "E-mail inválido"
            case .incorrectCredentials:
                message = "Credenciais incorretas"
            case .invalidPassword:
                message = "Senha incorretas"
            }
            
            delegate?.showAlert(for: error, message: message)
            return
        }
    }
}
