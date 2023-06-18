//
//  CustomLabel.swift
//  CashControll
//
//  Created by Александр Кисть on 02.06.2023.
//

import UIKit

class CustomLabel: UILabel {
    
    init(){
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configure(text: String, textColor: UIColor, font: UIFont){
        self.text = text
        self.textColor = textColor
        self.font = font
    }
    
//    func configure(placeholder: String, font: UIFont, backgroundColor: UIColor, textColor: UIColor, keyboardType: UIKeyboardType, borderColor: CGColor, borderWidth: CGFloat) {
//        self.placeholder = placeholder
//        self.font = font
//        self.backgroundColor = backgroundColor
//        self.textColor = textColor
//        self.keyboardType = keyboardType
//        layer.borderColor = borderColor
//        layer.borderWidth = borderWidth
//        translatesAutoresizingMaskIntoConstraints = false
//        borderStyle = .roundedRect
//    }
    
    
}



