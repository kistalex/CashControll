//
//  InputInfoViewController.swift
//  CashControll
//
//  Created by Александр Кисть on 23.04.2023.
//

import UIKit

class InputInfoViewController: UIViewController{
    
    private let salaryView = SalaryView()
    private let spendingsView = SpendingsView()
    
    private var viewModel: InputInfoViewModel!
    
    private var continueButton =  UIButton()
    
    @objc private func continueButtonTapped() {
        guard let salaryText = salaryView.salaryTextField.text,
              let monthlySpendingsText = spendingsView.spendingsTextField.text,
              let salary = Double(salaryText),
              let monthlySpendings = Double(monthlySpendingsText)
        else {
            return
        }
        viewModel.continueButtonTapped(salary: salary, monthlySpendings: monthlySpendings)
    }
    
    private func setupViewModel(){
        viewModel = InputInfoViewModel()
        viewModel.didTapped = { [weak self] in
            guard let self = self else { return }
            let homeVC = HomeViewController(salary: self.viewModel.salary, monthlySpendings: self.viewModel.monthlySpendings)
            self.navigationController?.pushViewController(homeVC, animated: true)
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = ""
        setupViews()
        setupConstraints()
        setupViewModel()
    }
    
    
    
    private func setupViews() {
        
        view.backgroundColor = .white
        
        view.addSubview(salaryView)
        view.addSubview(spendingsView)
        view.addSubview(continueButton)
        
        setupContinueButton()
    }
    
    private func setupContinueButton(){
        continueButton.setTitle("Продолжить", for: .normal)
        continueButton.backgroundColor = .systemGreen
        continueButton.layer.cornerRadius = UIConstants.buttonHeight / 2
        continueButton.translatesAutoresizingMaskIntoConstraints = false
        continueButton.addTarget(self, action: #selector(continueButtonTapped), for: .touchUpInside)
    }
    
    private func setupConstraints(){
        
        NSLayoutConstraint.activate([
            salaryView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            salaryView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            salaryView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            spendingsView.topAnchor.constraint(equalTo: salaryView.bottomAnchor, constant: 20),
            spendingsView.leadingAnchor.constraint(equalTo: salaryView.leadingAnchor),
            spendingsView.trailingAnchor.constraint(equalTo: salaryView.trailingAnchor),

            continueButton.topAnchor.constraint(equalTo: spendingsView.bottomAnchor, constant: 16),
            continueButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            continueButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            continueButton.heightAnchor.constraint(equalToConstant: UIConstants.buttonHeight)
        ])
    }
}




