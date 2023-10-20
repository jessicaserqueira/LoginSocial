//
//  CustomButton.swift
//  DevPoliChallenge
//
//  Created by Jessica Serqueira on 18/10/23.
//  Copyright © 2023 DevPoli. All rights reserved.
//

import UIKit

class CustomButton: UIButton {
    
    init(
        title: String,
        duoColorText: String?,
        textColor: UIColor,
        backgroundColor: UIColor?,
        cornerRadius: CGFloat?,
        attributedText: NSAttributedString?,
        font: UIFont,
        accessibilityIdentifier: String
    ) {
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.accessibilityIdentifier = accessibilityIdentifier
        
        setTitle(title, for: .normal)
        setTitleColor(textColor, for: .normal)
        
        if let backgroundColor = backgroundColor {
            self.backgroundColor = backgroundColor
        }
        
        if let cornerRadius = cornerRadius {
            layer.cornerRadius = cornerRadius
        }
        
        if let attributedText = attributedText {
            setAttributedTitle(attributedText, for: .normal)
        }
        
        if let duoColorText = duoColorText {
            setAttributedTitle(createDuoColorAttributedText(termsText: "", primaryText: duoColorText), for: .normal)
        }
    }
    
    func createDuoColorAttributedText(termsText: String, primaryText: String) -> NSAttributedString {
        let attributedString = NSMutableAttributedString(string: termsText)
        
        let blackAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.black,
            .font: UIFont.roboto(ofSize: 14, weight: .regular)
        ]
        
        attributedString.addAttributes(blackAttributes, range: NSRange(location: 0, length: attributedString.length))
        
        let blueAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: DesignSystem.Colors.primary,
            .font: UIFont.roboto(ofSize: 14, weight: .bold)
        ]
        
        let blueText = NSAttributedString(string: primaryText, attributes: blueAttributes)
        attributedString.append(blueText)
        
        return attributedString
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
