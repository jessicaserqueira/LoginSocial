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
        view.backgroundColor = DesignSystem.Colors.background

        customView.didPressButton = { [weak self] in
            self?.viewModel.didTapSignUpButton()
        }
    }

    func showSignUPView() {
        if let coordinator = viewModel.coordinator {
            coordinator.showSignUpView()
        }
    }
}
