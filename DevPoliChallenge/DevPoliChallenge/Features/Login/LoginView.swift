//
//  LoginView.swift
//  DevPoliChallenge
//
//  Created by Jessica Serqueira on 20/10/23.
//  Copyright © 2023 DevPoli. All rights reserved.
//

import UIKit

class LoginView: UIView {
    
    var didPressButton: (() -> Void)?
    
    private lazy var mainView: UIView = {
        let view = UIView()
        view.backgroundColor = DesignSystem.Colors.background
        view.translatesAutoresizingMaskIntoConstraints = false
        view.accessibilityIdentifier = "LoginView.mainView"
        return view
    }()
    
    private lazy var titleStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 10
        stack.distribution = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Olá! \nQuer melhorar sua vida financeira?"
        label.font = UIFont.roboto(ofSize: 20, weight: .bold)
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "LoginView.titleLabel"
        return label
    }()
    
    private lazy var informationLabel: UILabel = {
        let label = UILabel()
        label.text = "Quer melhorar sua vida financeira?"
        label.font = UIFont.roboto(ofSize: 16, weight: .regular)
        label.numberOfLines = 2
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "LoginView.informationLabel"
        return label
    }()
    
    private lazy var textFieldStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 10
        stack.distribution = .fillEqually
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.accessibilityIdentifier = "LoginView.textFieldStackView"
        return stack
    }()
    
    private lazy var emailTextField: CustomTextField = {
        return CustomTextField(
            placeholder: "Email",
            type: .email,
            accessibilityIdentifier: "LoginView.emailTextField"
        )
    }()
    
    private lazy var passwordTextField: CustomTextField = {
        return CustomTextField(
            placeholder: "Senha",
            type: .password,
            accessibilityIdentifier: "LoginView.passwordTextField"
        )
    }()
    
    private lazy var forgotPasswordButton: CustomButton = {
        return CustomButton(
            title: "Esqueci a senha",
            duoColorText: nil,
            textColor: DesignSystem.Colors.primary,
            backgroundColor: nil,
            cornerRadius: nil,
            attributedText: nil,
            font: UIFont.roboto(ofSize: 15, weight: .regular),
            accessibilityIdentifier: "LoginView.forgotPasswordButton"
        )
    }()
    
    private lazy var simpleButton: CustomButton = {
        return CustomButton(
            title: "ENTRAR",
            duoColorText: nil,
            textColor: DesignSystem.Colors.background,
            backgroundColor: DesignSystem.Colors.accent,
            cornerRadius: 8,
            attributedText: nil,
            font: UIFont.roboto(ofSize: 15, weight: .bold),
            accessibilityIdentifier: "LoginView.simpleButton"
        )
    }()
    
    private lazy var signUpButton: CustomButton = {
        let termsText = "Não tem conta? "
        let primaryText = "Criar conta"
        
        let button = CustomButton(
            title: "",
            duoColorText: primaryText,
            textColor: .clear,
            backgroundColor: nil,
            cornerRadius: nil,
            attributedText: nil,
            font: UIFont(),
            accessibilityIdentifier: "LoginView.signUpButton"
        )
        let attributedText = button.createDuoColorAttributedText(termsText: termsText, primaryText: primaryText)
        button.setAttributedTitle(attributedText, for: .normal)
        
        return button
    }()
    
    // MARK: - Initializer
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureSubviews()
        setupConstraints()
        setupActions()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Constraints
extension LoginView {
    private func configureSubviews() {
        addSubview(mainView)
        mainView.addSubview(titleStackView)
        titleStackView.addArrangedSubview(titleLabel)
        titleStackView.addArrangedSubview(informationLabel)
        
        textFieldStackView.addArrangedSubview(emailTextField)
        textFieldStackView.addArrangedSubview(passwordTextField)
        
        mainView.addSubview(textFieldStackView)
        mainView.addSubview(forgotPasswordButton)
        mainView.addSubview(simpleButton)
        mainView.addSubview(signUpButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            mainView.topAnchor.constraint(equalTo: topAnchor),
            mainView.leadingAnchor.constraint(equalTo: leadingAnchor),
            mainView.trailingAnchor.constraint(equalTo: trailingAnchor),
            mainView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            titleStackView.topAnchor.constraint(equalTo: mainView.safeAreaLayoutGuide.topAnchor, constant: 42),
            titleStackView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 22),
            titleStackView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -22),
            
            textFieldStackView.topAnchor.constraint(equalTo: titleStackView.bottomAnchor, constant: 102),
            textFieldStackView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 22),
            textFieldStackView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -22),
            textFieldStackView.heightAnchor.constraint(equalToConstant: 110),
            
            forgotPasswordButton.topAnchor.constraint(equalTo: textFieldStackView.bottomAnchor, constant: 10),
            forgotPasswordButton.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -22),
            
            simpleButton.topAnchor.constraint(equalTo: forgotPasswordButton.bottomAnchor, constant: 10),
            simpleButton.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 22),
            simpleButton.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -22),
            simpleButton.heightAnchor.constraint(equalToConstant: 55),
            
            signUpButton.centerXAnchor.constraint(equalTo: mainView.centerXAnchor),
            signUpButton.leadingAnchor.constraint(greaterThanOrEqualTo: mainView.leadingAnchor, constant: 100),
            signUpButton.trailingAnchor.constraint(lessThanOrEqualTo: mainView.trailingAnchor, constant: -100),
            signUpButton.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -52)
        ])
    }
}

// MARK: - Actions
extension LoginView {
    func setupActions() {
        signUpButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    @objc func buttonTapped() {
        didPressButton?()
    }
}
