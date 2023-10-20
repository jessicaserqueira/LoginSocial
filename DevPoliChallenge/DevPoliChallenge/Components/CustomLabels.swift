//
//  CustomLabels.swift
//  DevPoliChallenge
//
//  Created by Jessica Serqueira on 20/10/23.
//  Copyright © 2023 DevPoli. All rights reserved.
//

import UIKit


class CustomLabels: UILabel {
    
    enum FieldType {
        case title
        case description
    }
    
    init(text: String, type: FieldType, accessibilityIdentifier: String) {
        super.init(frame: .zero)
        switch type {
        case .title:
            font = UIFont.roboto(ofSize: 20, weight: .bold)
            numberOfLines = 2
            translatesAutoresizingMaskIntoConstraints = false
        case .description:
            font = UIFont.roboto(ofSize: 16, weight: .regular)
            numberOfLines = 2
            translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
