//
//  CalculatorLogic.swift
//  DarkCalculator
//
//  Created by Giulia on 10/01/19.
//  Copyright © 2019 Giulia Boscaro. All rights reserved.
//

import Foundation

struct CalculatorLogic {
    
    private var number: Double?
    
    private var intermediateCalculation: (firstNumber: Double, calcMethod: String)?
    
    mutating func setNumber(_ number: Double) {
        self.number = number
    }
    
    mutating func calculate(symbol: String) -> Double? {
        
        if let num = number {
            switch symbol {
            case "+/-":
                return num * -1
            case "AC":
                return 0
            case "%":
                return num * 0.01
            case "=":
                return performeTwoNumbersCalculation(secondNumber: num)
            default:
                intermediateCalculation = (firstNumber: num, calcMethod: symbol)
            }
        }
        return nil
        
    }
    
    private func performeTwoNumbersCalculation(secondNumber: Double) -> Double? {
        
        if let firstNumber = intermediateCalculation?.firstNumber,
            let calcMethod = intermediateCalculation?.calcMethod {
            
            switch calcMethod {
            case "+":
                return firstNumber + secondNumber
            case "-":
                return firstNumber - secondNumber
            case "X":
                return firstNumber * secondNumber
            case "÷":
                return firstNumber / secondNumber
            default:
                fatalError("The operation passed in does not match any case")
            }
        }
        return nil
    }
    
}
