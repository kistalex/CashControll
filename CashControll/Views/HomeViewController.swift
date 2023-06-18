////
////  HomeViewController.swift
////  CashControll
////
////  Created by Александр Кисть on 23.04.2023.
////

import UIKit

class HomeViewController: UIViewController{
    
    //MARK: - Private properties
    private let monthlyInfoView = MonthlyInfoView()
    private let dailyInfoView = DailyInfoView()

    private let salary: Double
    private let monthlySpendings: Double
    
    init(salary: Double, monthlySpendings: Double) {
        self.salary = salary
        self.monthlySpendings = monthlySpendings
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
        displayValues()
//        startUpdateIncome()
    }
    
    private func displayValues(){
        //MARK: - Можно тратить
        monthlyInfoView.monthlySpareCashValueLabel.text = "\(salary-monthlySpendings)"
        //MARK: - Постоянные траты
        monthlyInfoView.monthlySpendingValueLabel.text = "\(monthlySpendings)"
    }
    
    private func setupViews(){
        view.backgroundColor = .white
        
        view.addSubview(monthlyInfoView)
        view.addSubview(dailyInfoView)
        
    }

    private func setupConstraints(){

        NSLayoutConstraint.activate([

            //MARK: -  monthlyInfoView
            monthlyInfoView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            monthlyInfoView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            monthlyInfoView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            //MARK: - dailyInfoView
            dailyInfoView.topAnchor.constraint(equalTo: monthlyInfoView.bottomAnchor, constant: 20),
            dailyInfoView.leadingAnchor.constraint(equalTo: monthlyInfoView.leadingAnchor),
            dailyInfoView.trailingAnchor.constraint(equalTo: monthlyInfoView.trailingAnchor),
            
        ])
    }
    
    
}



