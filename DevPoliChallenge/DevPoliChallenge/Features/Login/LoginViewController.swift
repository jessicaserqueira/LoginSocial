//
//  ViewController.swift
//  DevPoliChallenge
//
//  Created by DevPoli on 29/07/23.
//  Copyright © 2023 DevPoli. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    var custonView = SignUPView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = custonView
        view.backgroundColor = DesignSystem.Colors.background
    }
}
