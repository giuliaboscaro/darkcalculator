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
    
    @IBOutlet weak var displayLabel: UILabel!
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        finishedTypingNumber = true
        
        guard let number = Double(displayLabel.text!) else {
            fatalError("Cannot convert display label text to a Double")
        }
        
        if let calcMethod = sender.currentTitle {
            if calcMethod == "+/-" {
                displayLabel.text = String(number * -1)
            } else if calcMethod == "AC" {
                displayLabel.text = "0"
            } else if calcMethod == "%" {
                displayLabel.text = String(number * 0.01)
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
                    
                    guard let currentDisplayValue = Double(displayLabel.text!) else {
                        fatalError("Cannot convert display label text to a Double")
                    }
                    
                    let isInt = floor(currentDisplayValue) == currentDisplayValue
                    
                    if !isInt {
                        return
                    }
                }
                
                displayLabel.text = displayLabel.text! + numberValue
            }
        }
    }
    
    func resetLabel() {
        displayLabel.text = "0"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetLabel()
    }


}

