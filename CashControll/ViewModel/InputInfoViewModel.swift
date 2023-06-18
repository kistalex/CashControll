//
//  InputInfoViewModel.swift
//  CashControll
//
//  Created by Александр Кисть on 31.05.2023.
//

import Foundation

class InputInfoViewModel{
    
    var didTapped: (() -> Void)?
    
    var salary: Double = 0.0
    var monthlySpendings: Double = 0.0
    
    func continueButtonTapped(salary: Double, monthlySpendings: Double){
        self.salary = salary
        self.monthlySpendings = monthlySpendings
        didTapped?()
    }
}
