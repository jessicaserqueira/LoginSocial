//
//  LoginViewModelProtocol.swift
//  DevPoliChallenge
//
//  Created by Jessica Serqueira on 24/10/23.
//  Copyright © 2023 DevPoli. All rights reserved.
//

import Foundation

protocol LoginViewModelDelegate: AnyObject {
   func showAlert(for error: SignINError, message: String)
}
