//
//  HomeViewModel.swift
//  CashControll
//
//  Created by Александр Кисть on 31.05.2023.
//

import Foundation

class HomeViewModel{
    
    private  var timer: Timer?
    
    private var salary: Double = 0.0
    private var monthlySpendings: Double = 0.0
    private var lastExpenses: [Double] = []
    
   
    var spareCash: Double {
        return salary - monthlySpendings
    }
    
    var dailyIncome: String?
    
    var updateUI: (() -> Void)?
    
    func updateSalary(with salary: Double){
        self.salary = salary
        updateUI?()
    }
    
    func updateMonthlySpending(with monthlySpending: Double){
        self.monthlySpendings = monthlySpending
        updateUI?()
    }
    
    func addExpense(_ expense: Double) {
        lastExpenses.append(expense)
        updateUI?()
    }
        
    func startUpdateIncome() {
        var totalEarningsSinceStartOfMonth: Double = 0.0
        
        if salary > 0 {
            let currentDate = Date()
            let calendar = Calendar.current
            let startOfMonth = calendar.date(from: calendar.dateComponents([.year, .month], from: currentDate))!
            let secondsSinceStartOfMonth = currentDate.timeIntervalSince(startOfMonth)
            totalEarningsSinceStartOfMonth = salary * (secondsSinceStartOfMonth / (30.0 * 24.0 * 60.0 * 60.0))
        }
        
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
            guard let self = self else {
                return
            }
            
            let earningsForInterval = self.salary / (30.0 * 24.0 * 60.0 * 60.0)
            totalEarningsSinceStartOfMonth += earningsForInterval
            
            DispatchQueue.main.async {
                self.dailyIncome = String(format: "%.3f", totalEarningsSinceStartOfMonth)
            }
        }
    }
    
    func getTotalExpenses() -> Double {
        return lastExpenses.reduce(0, +)
    }
}

//    func calculateDailySpendings(){
//        if let spendingsText = self.lastSpendingsTextField.text, let spendingsValue = Double(spendingsText) {
//            let currentDailySpendings = Double(self.dailySpendings) ?? 0.0
//            let newDailySpendings = currentDailySpendings + spendingsValue
//            self.dailySpendings = String(format: "%.2f", newDailySpendings)
//            self.lastSpendingsTextField.text = ""
//        }
//    }
