//
//  InputInfoViewController.swift
//  CashControll
//
//  Created by Александр Кисть on 23.04.2023.
//

import UIKit

class InputInfoViewController: UIViewController{
    
    private let defaults = UserDefaults.standard
    
    
    let globeIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "globe")
        imageView.tintColor = .black
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let salaryLabel: UILabel = {
        let label =  UILabel()
        label.textColor = .black
        label.font = .monospacedSystemFont(ofSize: UIConstants.labelFontSize, weight: .heavy)
        label.text = "Salary"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let monthlySpendingLabel: UILabel = {
        let label =  UILabel()
        label.textColor = .black
        label.font = .monospacedDigitSystemFont(ofSize: UIConstants.labelFontSize, weight: .heavy)
        label.text = "Monthly Spending"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let monthlySpendingSuggestionLabel: UILabel = {
        let label =  UILabel()
        label.textColor = .black
        label.font = .monospacedDigitSystemFont(ofSize: UIConstants.textFieldFontSize, weight: .regular)
        label.text = "Input your monthly spendings"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let monthlySalarySuggestionLabel: UILabel = {
        let label =  UILabel()
        label.textColor = .black
        label.font = .monospacedDigitSystemFont(ofSize: UIConstants.textFieldFontSize, weight: .regular)
        label.text = "Input your monthly salary"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let salaryTextField: RoundedCornerTextField = {
        let tField =  RoundedCornerTextField(padding: UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0), cornerRadius: UIConstants.textFieldHeight / 2)
        tField.placeholder = "000000"
        tField.font = .monospacedSystemFont(ofSize: UIConstants.labelFontSize, weight: .regular)
        tField.backgroundColor = .white
        tField.textColor = .black
        tField.keyboardType = .decimalPad
        tField.layer.borderColor = UIColor.green.cgColor
        tField.layer.borderWidth = 1.0
        tField.translatesAutoresizingMaskIntoConstraints = false
        tField.borderStyle = .roundedRect
        return tField
    }()
    
    
    let monthlySpendingTextField: RoundedCornerTextField = {
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
        return tField
    }()
    
    lazy var continueButton: UIButton = {
        let button = UIButton()
        button.setTitle("Continue", for: .normal)
        button.backgroundColor = .systemGreen
        button.layer.cornerRadius = UIConstants.buttonHeight / 2
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(continueButtonTapped), for: .touchUpInside)
        return button
    }()
    
    @objc func continueButtonTapped() {
        let homeVC = HomeViewController()
        
        guard let salaryText = salaryTextField.text, !salaryText.isEmpty else  {return }
        guard let monthlySpendingText = monthlySpendingTextField.text, !monthlySpendingText.isEmpty else { return }
        
        if !salaryText.isEmpty && !monthlySpendingText.isEmpty{
            defaults.set(true, forKey: "fieldsFilled")
            defaults.set(salaryText, forKey: "salaryValue")
            defaults.set(monthlySpendingText, forKey: "monthlySpendingTextValue")
        }
        
        homeVC.salary = defaults.string(forKey: "salaryValue")
        homeVC.monthlySpending = defaults.string(forKey: "monthlySpendingTextValue")

        navigationController?.pushViewController(homeVC, animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = ""
        setupViews()
        setupConstraints()
    }
    
    private func setupViews() {
        
        view.backgroundColor = .white
        
        view.addSubview(globeIconImageView)
        view.addSubview(salaryLabel)
        view.addSubview(monthlySalarySuggestionLabel)
        view.addSubview(salaryTextField)
        view.addSubview(monthlySpendingLabel)
        view.addSubview(monthlySpendingSuggestionLabel)
        view.addSubview(monthlySpendingTextField)
        view.addSubview(continueButton)
    }
    
    private func setupConstraints(){
        
        NSLayoutConstraint.activate([
            globeIconImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            globeIconImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            globeIconImageView.heightAnchor.constraint(equalToConstant: UIConstants.iconSize),
            globeIconImageView.widthAnchor.constraint(equalToConstant: UIConstants.iconSize),
            
            salaryLabel.topAnchor.constraint(equalTo: globeIconImageView.bottomAnchor, constant: 16),
            salaryLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            monthlySalarySuggestionLabel.topAnchor.constraint(equalTo: salaryLabel.bottomAnchor, constant: 8),
            monthlySalarySuggestionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            salaryTextField.topAnchor.constraint(equalTo: monthlySalarySuggestionLabel.bottomAnchor, constant: 8),
            salaryTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            salaryTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            salaryTextField.heightAnchor.constraint(equalToConstant: UIConstants.textFieldHeight),
            
            monthlySpendingLabel.topAnchor.constraint(equalTo: salaryTextField.bottomAnchor, constant: 16),
            monthlySpendingLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            monthlySpendingSuggestionLabel.topAnchor.constraint(equalTo: monthlySpendingLabel.bottomAnchor, constant: 8),
            monthlySpendingSuggestionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            monthlySpendingTextField.topAnchor.constraint(equalTo: monthlySpendingSuggestionLabel.bottomAnchor, constant: 8),
            monthlySpendingTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            monthlySpendingTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            monthlySpendingTextField.heightAnchor.constraint(equalToConstant: UIConstants.textFieldHeight),

            continueButton.topAnchor.constraint(equalTo: monthlySpendingTextField.bottomAnchor, constant: 16),
            continueButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            continueButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            continueButton.heightAnchor.constraint(equalToConstant: UIConstants.buttonHeight)
        ])
    }
}




