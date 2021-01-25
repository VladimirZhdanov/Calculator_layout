//
//  CalculatorLogic.swift
//  Calculator
//

import Foundation

struct CalculatorLogic {
    
    private var number: Double?
    
    private var temp: (n1: Double, calcMethod: String)?
    
    mutating func setNumber(n: Double) {
        number = n
    }
    
    mutating func calculate(symbol: String) -> Double? {
        
        if let n = number {
            
            if symbol == "+/-" {
                return n * -1
            } else if symbol == "AC" {
                return 0
            } else if symbol == "%" {
                return n / 100
            } else if symbol == "=" {
                return performCalculation(n2: n)
            } else {
                temp = (n1: n, symbol)
            }
        }
        return nil
    }
    
    private func performCalculation(n2: Double) -> Double? {
        if let n1 = temp?.n1, let operation = temp?.calcMethod {
            
            if operation == "+" {
                return n1 + n2
            } else if operation == "×" {
                return n1 * n2
            } else if operation == "÷" {
                return n1 / n2
            } else if operation == "-" {
                return n1 - n2
            }
        }
        
        return nil
    }
}
