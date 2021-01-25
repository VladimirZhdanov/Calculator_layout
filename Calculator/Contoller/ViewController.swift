//
//  ViewController.swift
//  Calculator
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    private var isFinishedTypingNumber = true
    
    private var displayValue: Double {
        get {
            return Double(displayLabel.text!)!
        }
        set {
            displayLabel.text = newValue == 0 ? "0" : String(newValue)
        }
    }
    
    private var calcultor = CalculatorLogic()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        isFinishedTypingNumber = true
        
        if let calcMethod = sender.currentTitle {
            
            calcultor.setNumber(n: displayValue)
            
            if let result = calcultor.calculate(symbol: calcMethod) {
                displayValue = result
            }
        }
        
        print(isFinishedTypingNumber)
    }
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        if let numValue = sender.currentTitle {
            
            if isFinishedTypingNumber {
                if numValue == "." {
                    displayLabel.text? = "0."
                    isFinishedTypingNumber = false
                } else {
                    displayLabel.text? = numValue
                    isFinishedTypingNumber = false
                }
            } else {
                
                if numValue == "." {
                    let isInt = floor(displayValue) == displayValue
                    
                    if !isInt {
                        return
                    }
                }
                displayLabel.text?.append(numValue)
            }
        }
    }
}

