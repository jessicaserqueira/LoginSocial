//
//  SignINError.swift
//  DevPoliChallenge
//
//  Created by Jessica Serqueira on 23/10/23.
//  Copyright © 2023 DevPoli. All rights reserved.
//

import Foundation

enum SignINError: Error {
    case invalidEmail
    case emptyEmail
    case invalidPassword
    case incorrectCredentials
}
