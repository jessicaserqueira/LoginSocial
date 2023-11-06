//
//  EmailValidator.swift
//  DevPoliChallenge
//
//  Created by Jessica Serqueira on 24/10/23.
//  Copyright © 2023 DevPoli. All rights reserved.
//

import Foundation

protocol EmailValidator {
    func isValidEmail(_ email: String) -> Bool
}

extension EmailValidator {
    func isValidEmail(_ email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
}
