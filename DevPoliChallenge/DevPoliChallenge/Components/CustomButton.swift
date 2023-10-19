//
//  CustomButton.swift
//  DevPoliChallenge
//
//  Created by Jessica Serqueira on 18/10/23.
//  Copyright © 2023 DevPoli. All rights reserved.
//

import UIKit

class CustomButton: UIButton {
    
    init(termsText: String, primaryText: String, accessibilityIdentifier: String) {
        super.init(frame: .zero)
        
        translatesAutoresizingMaskIntoConstraints = false
        self.accessibilityIdentifier = accessibilityIdentifier
        
        let attributedString = NSMutableAttributedString(string: termsText)
        
        let blackAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.black,
            .font: UIFont.roboto(ofSize: 15, weight: .regular)
        ]
       
        attributedString.addAttributes(blackAttributes, range: NSRange(location: 0, length: attributedString.length))
        
        let blueAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: DesignSystem.Colors.primary,
            .font: UIFont.roboto(ofSize: 15, weight: .bold)
        ]
        
        let blueText = NSAttributedString(string: primaryText, attributes: blueAttributes)
        attributedString.append(blueText)
        setAttributedTitle(attributedString, for: .normal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
