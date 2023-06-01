//
//  String.swift
//  CashControll
//
//  Created by Александр Кисть on 01.05.2023.
//

import Foundation

extension String{
    func toFormattedDoubleString() -> String? {
        if let doubleValue = Double(self) {
            return String(format: "%.2f", doubleValue)
        } else {
            return nil
        }
    }
}
