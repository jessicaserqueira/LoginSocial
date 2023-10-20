//
//  Coordinator.swift
//  DevPoliChallenge
//
//  Created by Jessica Serqueira on 19/10/23.
//  Copyright © 2023 DevPoli. All rights reserved.
//

import UIKit

protocol Coordinator {
  var navigationController: UINavigationController { get set }
  
  func start()

}
