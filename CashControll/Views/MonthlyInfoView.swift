//
//  MonthlyInfoView.swift
//  CashControll
//
//  Created by Александр Кисть on 07.06.2023.
//

import UIKit

class MonthlyInfoView: UIView {

    let monthlySpareCashLabel = CustomLabel()
    let monthlySpareCashValueLabel = CustomLabel()
    let monthlySpendingLabel = CustomLabel()
    let monthlySpendingValueLabel = CustomLabel()
    
    override func layoutSubviews() {
        monthlySpareCashLabel.configure(text: "Можно тратить", textColor: .black, font: UIFont.preferredFont(forTextStyle: .title1))
        monthlySpareCashValueLabel.configure(text: "", textColor: .black, font: .monospacedSystemFont(ofSize: UIConstants.valueFontSize, weight: .bold))
        monthlySpareCashValueLabel.backgroundColor = .red
        monthlySpendingLabel.configure(text: "Постоянные траты", textColor: .black, font: UIFont.preferredFont(forTextStyle: .title1))
        monthlySpendingValueLabel.configure(text: "", textColor: .black, font: .monospacedSystemFont(ofSize: UIConstants.valueFontSize, weight: .bold))
        monthlySpareCashValueLabel.backgroundColor = .red
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
        addSubview(monthlySpareCashLabel)
        addSubview(monthlySpareCashValueLabel)
        addSubview(monthlySpendingLabel)
        addSubview(monthlySpendingValueLabel)
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            monthlySpareCashLabel.topAnchor.constraint(equalTo: topAnchor),
            monthlySpareCashLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            monthlySpareCashLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            monthlySpareCashValueLabel.topAnchor.constraint(equalTo: monthlySpareCashLabel.bottomAnchor, constant: UIConstants.labelSpacing),
            monthlySpareCashValueLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            monthlySpareCashValueLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            monthlySpendingLabel.topAnchor.constraint(equalTo: monthlySpareCashValueLabel.bottomAnchor, constant: UIConstants.labelSpacing),
            monthlySpendingLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            monthlySpendingLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            monthlySpendingValueLabel.topAnchor.constraint(equalTo: monthlySpendingLabel.bottomAnchor, constant: UIConstants.labelSpacing),
            monthlySpendingValueLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            monthlySpendingValueLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            monthlySpendingValueLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
           
        ])
    }
}
