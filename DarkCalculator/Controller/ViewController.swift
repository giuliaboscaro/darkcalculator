//
//  ViewController.swift
//  DarkCalculator
//
//  Created by Giulia on 09/01/19.
//  Copyright © 2019 Giulia Boscaro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var finishedTypingNumber: Bool = true
    
    private var displayValue: Double {
        get {
            guard let number = Double(displayLabel.text!) else {
                if displayLabel.text! == "Error" {
                    return 0
                } else {
                    fatalError("Cannot convert display label text to a Double")
                }
            }
            return number
        }
        set {
            
            if newValue.isInfinite{
                displayLabel.text = "Error"
            } else {
                if floor(newValue) == newValue {
                    displayLabel.text = String(format: "%.0f", newValue)
                } else {
                    displayLabel.text = String(newValue)
                }
            }
            
        }
    }
    
    @IBOutlet weak var displayLabel: UILabel!
    
    private var calculator = CalculatorLogic()
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        finishedTypingNumber = true
        
        calculator.setNumber(displayValue)
        
        if let calcMethod = sender.currentTitle {
            
            if let result = calculator.calculate(symbol: calcMethod){
                displayValue = result
            }
        }
        
    }
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        if let numberValue = sender.currentTitle {
            if finishedTypingNumber {
                displayLabel.text = numberValue
                finishedTypingNumber = false
            } else {
                if numberValue == "." {
                    
                    let isInt = floor(displayValue) == displayValue
                    
                    if !isInt {
                        return
                    }
                }
                
                displayLabel.text = displayLabel.text! + numberValue
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


}

