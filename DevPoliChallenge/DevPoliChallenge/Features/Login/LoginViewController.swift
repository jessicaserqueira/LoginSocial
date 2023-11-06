//
//  ViewController.swift
//  DevPoliChallenge
//
//  Created by DevPoli on 29/07/23.
//  Copyright © 2023 DevPoli. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    var customView = LoginView()
    var viewModel: LoginViewModel
    
    init(viewModel: LoginViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = customView
        customView.delegate = self
        viewModel.delegate = self
        view.backgroundColor = DesignSystem.Colors.background
    }
    
    func showSignUpView() {
        if let coordinator = viewModel.coordinator {
            coordinator.showSignUpView()
        }
    }
}

extension LoginViewController: LoginViewDelegate {
    func didPressSignInButton(email: String, password: String) {
        viewModel.signIn(email: email, password: password)
    }
    
    func didPressSignUpButton() {
        viewModel.didTapSignUpButton()
    }
}

extension LoginViewController: LoginViewModelDelegate {
    func showAlert(for error: SignINError, message: String) {
        let alert = UIAlertController(title: "Erro", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak self] _ in
            self?.customView.emailTextField.becomeFirstResponder()
        }))
        present(alert, animated: true, completion: nil)
    }
}
