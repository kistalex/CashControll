//
//  HomeViewController.swift
//  CashControll
//
//  Created by Александр Кисть on 23.04.2023.
//

import UIKit

class HomeViewController: UIViewController{
    
    private var defaults = UserDefaults.standard
    
    var timer: Timer?
    
    var isSpendingsEditing: Bool = false
    
    var salary: String? {
        didSet {
            updateSpareCash()
        }
    }
    
    var moneyEarnedPerSecond: Double = 0.0
    
    func startUpdateIncome() {
        var totalEarningsSinceStartOfMonth: Double = 0.0
        if let salary = Double(self.salary ?? "0.00"), salary > 0 {
            let currentDate = Date()
            let calendar = Calendar.current
            let startOfMonth = calendar.date(from: calendar.dateComponents([.year, .month], from: currentDate))!
            let secondsSinceStartOfMonth = currentDate.timeIntervalSince(startOfMonth)
            totalEarningsSinceStartOfMonth = salary * (secondsSinceStartOfMonth / (30.0 * 24.0 * 60.0 * 60.0))
        }
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
            
            if let salary = Double(self?.salary ?? "0.00"), salary > 0 {
                let earningsForInterval = salary / (30.0 * 24.0 * 60.0 * 60.0)
                totalEarningsSinceStartOfMonth += earningsForInterval
            }
            
            DispatchQueue.main.async {
                let totalEarningsSinceStartOfMonthString = String(format: "%.3f", totalEarningsSinceStartOfMonth)
                self?.dailyIncomeValue.text = "\(totalEarningsSinceStartOfMonthString)"
            }
        }
    }
    
    var monthlySpending: String? {
        didSet {
            if let monthlySpending = monthlySpending {
                monthlySpendingValue.text = monthlySpending.toFormattedDoubleString()
                updateSpareCash()
            }
        }
    }
    
    var freeMoney = UserDefaults.standard.object(forKey: "salaryValue")
    
    var spareCash: String = "0.00" {
        didSet{
            monthlySpareCashValue.text = spareCash
        }
    }
    
    var dailySpendings: String = "0.00"{
        didSet{
            dailySpendingsValue.text = dailySpendings

        }
    }
    
    func updateSpareCash() {
        if let salary = salary, let monthlySpending = monthlySpending,
           let salaryValue = Double(salary), let spendingValue = Double(monthlySpending)
        {
            let savingsValue = salaryValue - spendingValue
            spareCash = String(format: "%.2f", savingsValue)
        } else {
            spareCash = "0.00"
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
        startUpdateIncome()
    }

    
    let monthlySalaryLabel: UILabel = {
        let label =  UILabel()
        label.textColor = .black
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        label.text = "Можно тратить"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let monthlySpareCashValue: UILabel = {
        let label =  UILabel()
        label.textColor = .black
        label.font = . monospacedSystemFont(ofSize: UIConstants.valueFontSize, weight: .bold)
        label.text = "0.00"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let dailyIncomeLabel: UILabel = {
        let label =  UILabel()
        label.textColor = .black
        label.font = . monospacedSystemFont(ofSize: UIConstants.labelFontSize, weight: .regular)
        label.text = "Заработали на сегодня"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let dailyIncomeValue: UILabel = {
        let label =  UILabel()
        label.textColor = .black
        label.text = "0.00"
        label.font = . monospacedSystemFont(ofSize: UIConstants.valueFontSize, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let dailySpendingsLabel: UILabel = {
        let label =  UILabel()
        label.textColor = .black
        label.font = . monospacedSystemFont(ofSize: UIConstants.labelFontSize, weight: .regular)
        label.text = "Потратили сегодня"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let dailySpendingsValue: UILabel = {
        let label =  UILabel()
        label.textColor = .black
        label.font = . monospacedSystemFont(ofSize: UIConstants.valueFontSize, weight: .bold)
        label.text = "0.00"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let monthlySpendingLabel: UILabel = {
        let label =  UILabel()
        label.textColor = .black
        label.font = . monospacedSystemFont(ofSize: UIConstants.labelFontSize, weight: .regular)
        label.text = "Постоянные траты"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let monthlySpendingValue: UILabel = {
        let label =  UILabel()
        label.textColor = .black
        label.font = . monospacedSystemFont(ofSize: UIConstants.valueFontSize, weight: .bold)
        label.text = "0.00"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let lastSpendingsTextField: RoundedCornerTextField = {
        let tField =  RoundedCornerTextField(padding: UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0), cornerRadius: UIConstants.textFieldHeight / 2)
        tField.placeholder = "000000"
        tField.font = .monospacedSystemFont(ofSize: UIConstants.labelFontSize, weight: .regular)
        tField.backgroundColor = .white
        tField.tintColor = UIColor.green
        tField.textColor = .black
        tField.keyboardType = .decimalPad
        tField.layer.borderColor = UIColor.green.cgColor
        tField.layer.borderWidth = 1.0
        tField.translatesAutoresizingMaskIntoConstraints = false
        tField.borderStyle = .roundedRect
        tField.isHidden = true
        tField.alpha = 0.0
        return tField
    }()
    
    lazy var inputSpendingsButton: UIButton = {
        let button = UIButton()
        button.setTitle("Внести траты", for: .normal)
        button.backgroundColor = .systemGreen
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = UIConstants.buttonHeight / 2
        button.addTarget(self, action: #selector(showLastSpendingsTextField), for: .touchUpInside)
        return button
    }()
    
    
   
    
    @objc func showLastSpendingsTextField() {
        let isHidden = !lastSpendingsTextField.isHidden
        let duration = 0.3

        UIView.transition(with: inputSpendingsButton, duration: duration, options: .transitionCrossDissolve, animations: {
            let buttonTitle = isHidden ? "Внести траты" : "Готово"
            self.inputSpendingsButton.setTitle(buttonTitle, for: .normal)
        })

        UIView.animate(withDuration: duration) {
            self.lastSpendingsTextField.alpha = isHidden ? 0.0 : 1.0
        } completion: { _ in
            self.lastSpendingsTextField.isHidden = isHidden
        }
        
        calculateDailySpendings()
        
       
    }
    
    func calculateDailySpendings(){
        if let spendingsText = self.lastSpendingsTextField.text, let spendingsValue = Double(spendingsText) {
            let currentDailySpendings = Double(self.dailySpendings) ?? 0.0
            let newDailySpendings = currentDailySpendings + spendingsValue
            self.dailySpendings = String(format: "%.2f", newDailySpendings)
            self.lastSpendingsTextField.text = ""
        }
    }
    
    private func setupViews(){
        view.backgroundColor = .white
        
        view.addSubview(monthlySalaryLabel)
        view.addSubview(monthlySpareCashValue)
        view.addSubview(dailyIncomeLabel)
        view.addSubview(dailyIncomeValue)
        view.addSubview(dailySpendingsLabel)
        view.addSubview(dailySpendingsValue)
        view.addSubview(monthlySpendingLabel)
        view.addSubview(monthlySpendingValue)
        view.addSubview(lastSpendingsTextField)
        view.addSubview(inputSpendingsButton)
    }

    private func setupConstraints(){
        
        NSLayoutConstraint.activate([
            
            monthlySalaryLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: UIConstants.labelSpacing),
            monthlySalaryLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: UIConstants.sideMargin),
            
            monthlySpareCashValue.topAnchor.constraint(equalTo: monthlySalaryLabel.bottomAnchor, constant: UIConstants.labelSpacing),
            monthlySpareCashValue.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: UIConstants.sideMargin),
            
            //MARK: -
            dailyIncomeLabel.topAnchor.constraint(equalTo: monthlySpareCashValue.bottomAnchor, constant: UIConstants.labelSpacing),
            dailyIncomeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: UIConstants.sideMargin),
            
            dailyIncomeValue.topAnchor.constraint(equalTo: dailyIncomeLabel.bottomAnchor, constant: UIConstants.labelSpacing),
            dailyIncomeValue.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: UIConstants.sideMargin),
            
            dailySpendingsLabel.topAnchor.constraint(equalTo: dailyIncomeValue.bottomAnchor, constant: UIConstants.labelSpacing),
            dailySpendingsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: UIConstants.sideMargin),
            
            dailySpendingsValue.topAnchor.constraint(equalTo: dailySpendingsLabel.bottomAnchor, constant: UIConstants.labelSpacing),
            dailySpendingsValue.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: UIConstants.sideMargin),
            //MARK: -
            
            monthlySpendingLabel.topAnchor.constraint(equalTo: dailySpendingsValue.bottomAnchor, constant: UIConstants.labelSpacing),
            monthlySpendingLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: UIConstants.sideMargin),
            
            monthlySpendingValue.topAnchor.constraint(equalTo: monthlySpendingLabel.bottomAnchor, constant: UIConstants.labelSpacing),
            monthlySpendingValue.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: UIConstants.sideMargin),
            
            lastSpendingsTextField.topAnchor.constraint(equalTo: monthlySpendingValue.bottomAnchor, constant: UIConstants.labelSpacing),
            lastSpendingsTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: UIConstants.sideMargin),
            lastSpendingsTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -UIConstants.sideMargin),
            lastSpendingsTextField.heightAnchor.constraint(equalToConstant: UIConstants.textFieldHeight),
            
            inputSpendingsButton.topAnchor.constraint(equalTo: lastSpendingsTextField.bottomAnchor, constant: UIConstants.labelSpacing),
            inputSpendingsButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: UIConstants.sideMargin),
            inputSpendingsButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -UIConstants.sideMargin),
            inputSpendingsButton.heightAnchor.constraint(equalToConstant: UIConstants.buttonHeight),
        ])
    }
}



