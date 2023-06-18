//
//  SpendingsView.swift
//  CashControll
//
//  Created by Александр Кисть on 02.06.2023.
//

import UIKit

class SpendingsView: UIView {
    
    var spendingsLabel = CustomLabel()
    var spendingsSuggestionLabel = CustomLabel()
    var spendingsTextField = RoundedCornerTextField(padding: UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0), cornerRadius: UIConstants.textFieldHeight / 2)
    
    
    override func layoutSubviews() {
        spendingsLabel.configure(text: "Расходы", textColor: .black, font: .monospacedSystemFont(ofSize: UIConstants.labelFontSize, weight: .heavy))
        spendingsSuggestionLabel.configure(text: "Укажите сумму на ежемесячные расходы", textColor: .black, font: .monospacedSystemFont(ofSize: UIConstants.labelFontSize, weight: .regular))
        spendingsTextField.configure(placeholder: "000000", font: .monospacedSystemFont(ofSize: UIConstants.textFieldFontSize, weight: .regular), backgroundColor: .white, textColor: .black, keyboardType: .decimalPad, borderColor: UIColor.green.cgColor, borderWidth: 1.0)
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
        addSubview(spendingsLabel)
        addSubview(spendingsSuggestionLabel)
        addSubview(spendingsTextField)
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            spendingsLabel.topAnchor.constraint(equalTo: topAnchor),
            spendingsLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            spendingsLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            spendingsSuggestionLabel.topAnchor.constraint(equalTo: spendingsLabel.bottomAnchor, constant: UIConstants.labelSpacing),
            spendingsSuggestionLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            spendingsSuggestionLabel.trailingAnchor.constraint(equalTo: trailingAnchor),


            spendingsTextField.topAnchor.constraint(equalTo: spendingsSuggestionLabel.bottomAnchor, constant: UIConstants.labelSpacing),
            spendingsTextField.leadingAnchor.constraint(equalTo: leadingAnchor),
            spendingsTextField.trailingAnchor.constraint(equalTo: trailingAnchor),
            spendingsTextField.bottomAnchor.constraint(equalTo: bottomAnchor),
            spendingsTextField.heightAnchor.constraint(equalToConstant: UIConstants.textFieldHeight)
        ])
    }
}
