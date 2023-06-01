//
//  RoundedCornerTextField.swift
//  CashControll
//
//  Created by Александр Кисть on 23.04.2023.
//

import UIKit

class RoundedCornerTextField: UITextField {
    let padding: UIEdgeInsets
    let cornerRadius: CGFloat
    
    init(padding: UIEdgeInsets, cornerRadius: CGFloat) {
        self.padding = padding
        self.cornerRadius = cornerRadius
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        layer.cornerRadius = cornerRadius
        clipsToBounds = true
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
         return bounds.inset(by: padding)
     }
}

extension RoundedCornerTextField{
    static func makeRoundedCornerTextField(placeholder: String, font: UIFont, backgroundColor: UIColor, textColor: UIColor, keyboardType: UIKeyboardType, borderColor: CGColor, borderWidth: CGFloat, cornerRadius: CGFloat) -> RoundedCornerTextField {
            let tField =  RoundedCornerTextField(padding: UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0), cornerRadius: cornerRadius)
            tField.placeholder = placeholder
            tField.font = font
            tField.backgroundColor = backgroundColor
            tField.textColor = textColor
            tField.keyboardType = keyboardType
            tField.layer.borderColor = borderColor
            tField.layer.borderWidth = borderWidth
            tField.translatesAutoresizingMaskIntoConstraints = false
            tField.borderStyle = .roundedRect
            return tField
        }
}
