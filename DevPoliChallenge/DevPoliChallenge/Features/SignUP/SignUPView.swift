//
//  SignUPView.swift
//  DevPoliChallenge
//
//  Created by Jessica Serqueira on 20/10/23.
//  Copyright © 2023 DevPoli. All rights reserved.
//

import UIKit

class SignUPView: UIView {
    private lazy var mainView: UIView = {
        let view = UIView()
        view.backgroundColor = DesignSystem.Colors.background
        view.translatesAutoresizingMaskIntoConstraints = false
        view.accessibilityIdentifier = "SignUPView.mainView"
        return view
    }()
    
    var titleNavigation: UILabel = {
        let label = UILabel()
        label.text = "Criar conta"
        label.textColor = .black
        label.font = UIFont.roboto(ofSize: 18, weight: .bold)
        label.accessibilityIdentifier = "SignUPView.titleNavigation"
        return label
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Cria sua conta e comece a gerenciar sua vida financeira"
        label.font = .roboto(ofSize: 18, weight: .regular)
        label.textColor = .gray
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "SignUPView.titleLabel"
        return label
    }()
    
    private lazy var textFieldStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 8
        stack.distribution = .fillEqually
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.accessibilityIdentifier = "SignUPView.textFieldStackView"
        return stack
    }()
    
    private lazy var nameTextField: CustomTextField = {
        return CustomTextField(
            placeholder: "Primeiro nome",
            type: .name,
            accessibilityIdentifier: "SignUPView.textFieldStackView"
        )
    }()
    
    private lazy var lastNameTextField: CustomTextField = {
        return CustomTextField(
            placeholder: "Último nome",
            type: .name,
            accessibilityIdentifier: "SignUPView.textFieldStackView"
        )
    }()
    
    private lazy var emailTextField: CustomTextField = {
        return CustomTextField(
            placeholder: "Email",
            type: .email,
            accessibilityIdentifier: "SignUPView.textFieldStackView"
        )
    }()
    
    private lazy var passwordTextField: CustomTextField = {
        return CustomTextField(
            placeholder: "Senha",
            type: .password,
            accessibilityIdentifier: "SignUPView.textFieldStackView"
        )
    }()
    
    private lazy var confirmPasswordTextField: CustomTextField = {
        return CustomTextField(
            placeholder: "Confirme senha",
            type: .password,
            accessibilityIdentifier: "SignUPView.textFieldStackView"
        )
    }()
    
    private lazy var termsButton: CustomButton = {
        let termsText = "Ao criar a conta, você concorda com nossos "
        let primaryText = "termos e condições de uso"
        
        let button = CustomButton(
            title: "",
            duoColorText: primaryText,
            textColor: .clear,
            backgroundColor: nil,
            cornerRadius: nil,
            attributedText: nil,
            font: UIFont(),
            accessibilityIdentifier: "SignUPView.termsButton"
        )
        let attributedText = button.createDuoColorAttributedText(termsText: termsText, primaryText: primaryText)
        button.setAttributedTitle(attributedText, for: .normal)
        
        return button
    }()
    
    private lazy var simpleButton: CustomButton = {
        let button = CustomButton(
            title: "CRIAR CONTA",
            duoColorText: nil,
            textColor: DesignSystem.Colors.background,
            backgroundColor: DesignSystem.Colors.accent,
            cornerRadius: 8,
            attributedText: nil,
            font: UIFont.roboto(ofSize: 15, weight: .bold),
            accessibilityIdentifier: "LoginView.simpleButton"
        )
        button.isEnabled = false
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
extension SignUPView {
    func configureSubviews() {
        addSubview(mainView)
        mainView.addSubview(titleLabel)
        mainView.addSubview(textFieldStackView)
        textFieldStackView.addArrangedSubview(nameTextField)
        textFieldStackView.addArrangedSubview(lastNameTextField)
        textFieldStackView.addArrangedSubview(emailTextField)
        textFieldStackView.addArrangedSubview(passwordTextField)
        textFieldStackView.addArrangedSubview(confirmPasswordTextField)
        mainView.addSubview(termsButton)
        mainView.addSubview(simpleButton)
        
        termsButton.titleLabel?.numberOfLines = 0
        termsButton.titleLabel?.lineBreakMode = .byWordWrapping
    }
    func setupConstraints() {
        NSLayoutConstraint.activate([
            mainView.topAnchor.constraint(equalTo: topAnchor),
            mainView.leadingAnchor.constraint(equalTo: leadingAnchor),
            mainView.trailingAnchor.constraint(equalTo: trailingAnchor),
            mainView.bottomAnchor.constraint(equalTo: bottomAnchor),

            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: mainView.safeAreaLayoutGuide.topAnchor, constant: 62),
            titleLabel.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 22),
            titleLabel.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -22),

            textFieldStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            textFieldStackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            textFieldStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 22),
            textFieldStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -22),
            textFieldStackView.heightAnchor.constraint(equalToConstant: 307),
    
            termsButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            termsButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 74),
            termsButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -74),
            termsButton.bottomAnchor.constraint(equalTo: simpleButton.topAnchor, constant: -12),
   
            simpleButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            simpleButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 48),
            simpleButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -48),
            simpleButton.heightAnchor.constraint(equalToConstant: 50),
            simpleButton.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -52)
        ])
    }
}

// MARK: - Actions
extension SignUPView {
    func setupActions() {}
}
