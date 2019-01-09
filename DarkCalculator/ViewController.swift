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
        
        
    }
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        if let numberValue = sender.currentTitle {
            if finishedTypingNumber {
                displayLabel.text = numberValue
                finishedTypingNumber = false
            } else {
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

