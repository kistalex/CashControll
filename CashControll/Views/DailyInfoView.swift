//
//  DailyInfoView.swift
//  CashControll
//
//  Created by Александр Кисть on 07.06.2023.
//

import UIKit

class DailyInfoView: UIView {

     var dailyIncomeLabel = CustomLabel()
     var dailyIncomeValueLabel = CustomLabel()
     var dailySpendingsLabel = CustomLabel()
     var dailySpendingsValueLabel = CustomLabel()
     var lastSpendingsTextField = RoundedCornerTextField(padding: UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0), cornerRadius: UIConstants.textFieldHeight/2)

    override func layoutSubviews() {
        dailyIncomeLabel.configure(text: "Заработали на сегодня", textColor: .black, font: UIFont.preferredFont(forTextStyle: .title1))
        dailyIncomeValueLabel.configure(text: "", textColor: .black, font: .monospacedSystemFont(ofSize: UIConstants.valueFontSize, weight: .bold))
        dailySpendingsLabel.configure(text: "Потратили на сегодня", textColor: .black, font: UIFont.preferredFont(forTextStyle: .title1))
        dailySpendingsValueLabel.configure(text: "", textColor: .black, font: .monospacedSystemFont(ofSize: UIConstants.valueFontSize, weight: .bold))
        lastSpendingsTextField.configure(placeholder: "000000", font: .monospacedSystemFont(ofSize: UIConstants.labelFontSize, weight: .regular), backgroundColor: .white, textColor: .black, keyboardType: .decimalPad, borderColor: UIColor.green.cgColor, borderWidth: 1.0)
    }
    
    lazy var inputSpendingsButton: UIButton = {
        let button = UIButton()
        button.setTitle("Внести траты", for: .normal)
        button.backgroundColor = .systemGreen
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = UIConstants.buttonHeight / 2
//        button.addTarget(self, action: #selector(showLastSpendingsTextField), for: .touchUpInside)
        return button
    }()
    
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
        addSubview(dailyIncomeLabel)
        addSubview(dailyIncomeValueLabel)
        addSubview(dailySpendingsLabel)
        addSubview(dailySpendingsValueLabel)
        addSubview(lastSpendingsTextField)
        addSubview(inputSpendingsButton)
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            dailyIncomeLabel.topAnchor.constraint(equalTo: topAnchor),
            dailyIncomeLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            dailyIncomeLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
                        
            dailyIncomeValueLabel.topAnchor.constraint(equalTo: dailyIncomeLabel.bottomAnchor, constant: UIConstants.labelSpacing),
            dailyIncomeValueLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            dailyIncomeValueLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
                        
            dailySpendingsLabel.topAnchor.constraint(equalTo: dailyIncomeValueLabel.bottomAnchor, constant: UIConstants.labelSpacing),
            dailySpendingsLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            dailySpendingsLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
                        
            dailySpendingsValueLabel.topAnchor.constraint(equalTo: dailySpendingsLabel.bottomAnchor, constant: UIConstants.labelSpacing),
            dailySpendingsValueLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            dailySpendingsValueLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            lastSpendingsTextField.topAnchor.constraint(equalTo: dailySpendingsValueLabel.bottomAnchor, constant: UIConstants.labelSpacing),
            lastSpendingsTextField.leadingAnchor.constraint(equalTo: leadingAnchor),
            lastSpendingsTextField.trailingAnchor.constraint(equalTo: trailingAnchor),
            lastSpendingsTextField.heightAnchor.constraint(equalToConstant: UIConstants.textFieldHeight),
            
            inputSpendingsButton.topAnchor.constraint(equalTo: lastSpendingsTextField.bottomAnchor, constant: UIConstants.buttonSpacing),
            inputSpendingsButton.leadingAnchor.constraint(equalTo: leadingAnchor),
            inputSpendingsButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            inputSpendingsButton.bottomAnchor.constraint(equalTo: bottomAnchor),
            inputSpendingsButton.heightAnchor.constraint(equalToConstant: UIConstants.buttonHeight)
        ])
    }
}


