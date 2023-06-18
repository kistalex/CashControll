//
//  RoundedCornerTextField.swift
//  CashControll
//
//  Created by Александр Кисть on 23.04.2023.
//

import UIKit

class RoundedCornerTextField: UITextField {
    
    //MARK: - Private 
    private let padding: UIEdgeInsets
    private let cornerRadius: CGFloat
    
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
    
    func configure(placeholder: String, font: UIFont, backgroundColor: UIColor, textColor: UIColor, keyboardType: UIKeyboardType, borderColor: CGColor, borderWidth: CGFloat) {
        self.placeholder = placeholder
        self.font = font
        self.backgroundColor = backgroundColor
        self.textColor = textColor
        self.keyboardType = keyboardType
        layer.borderColor = borderColor
        layer.borderWidth = borderWidth
        translatesAutoresizingMaskIntoConstraints = false
        borderStyle = .roundedRect
    }
}
