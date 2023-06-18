//
//  SalaryView.swift
//  CashControll
//
//  Created by Александр Кисть on 02.06.2023.
//

import UIKit

class SalaryView: UIView {

     let salaryLabel = CustomLabel()
     let salarySuggestionLabel = CustomLabel()
     let salaryTextField = RoundedCornerTextField(padding: UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0), cornerRadius: UIConstants.textFieldHeight / 2)
    
    
    override func layoutSubviews() {
        salaryLabel.configure(text: "Зарплата", textColor: .black, font: .monospacedSystemFont(ofSize: UIConstants.labelFontSize, weight: .heavy))
        salarySuggestionLabel.configure(text: "Введите Вашу зарплату", textColor: .black, font: .monospacedSystemFont(ofSize: UIConstants.labelFontSize, weight: .regular))
        salaryTextField.configure(placeholder: "000000", font: .monospacedSystemFont(ofSize: UIConstants.textFieldFontSize, weight: .regular), backgroundColor: .white, textColor: .black, keyboardType: .decimalPad, borderColor: UIColor.green.cgColor, borderWidth: 1.0)
    }
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupViews()
        setupConstraints()
        translatesAutoresizingMaskIntoConstraints = false

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews(){
        addSubview(salaryLabel)
        addSubview(salarySuggestionLabel)
        addSubview(salaryTextField)
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            salaryLabel.topAnchor.constraint(equalTo: topAnchor),
            salaryLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            salaryLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            salarySuggestionLabel.topAnchor.constraint(equalTo: salaryLabel.bottomAnchor, constant: UIConstants.labelSpacing),
            salarySuggestionLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            salarySuggestionLabel.trailingAnchor.constraint(equalTo: trailingAnchor),

            salaryTextField.topAnchor.constraint(equalTo: salarySuggestionLabel.bottomAnchor, constant: UIConstants.labelSpacing),
            salaryTextField.leadingAnchor.constraint(equalTo: leadingAnchor),
            salaryTextField.trailingAnchor.constraint(equalTo: trailingAnchor),
            salaryTextField.bottomAnchor.constraint(equalTo: bottomAnchor),
            salaryTextField.heightAnchor.constraint(equalToConstant: UIConstants.textFieldHeight)
        ])
    }
}
