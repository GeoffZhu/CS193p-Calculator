//
//  ViewController.swift
//  Calculator
//
//  Created by GeoffZhu on 2018/4/6.
//  Copyright © 2018年 GeoffZhu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
    @IBOutlet weak var labelText: UILabel!

    var userIsInTheMiddleOfTyping = false
    
//    计算属性
    var displayValue: Double {
        set {
            labelText.text = String(newValue)
        }
        get {
            return Double(labelText.text!)!
        }
    }
    
    @IBAction func dalegateClick(_ sender: UIButton) {
        let digit = sender.currentTitle!
        if (userIsInTheMiddleOfTyping) {
            let currentIndisplay = labelText.text!
            labelText.text = currentIndisplay + digit
        } else {
            userIsInTheMiddleOfTyping = true
            labelText.text = digit
        }
    }
    
    var brain = CalclatorBrain()
    @IBAction func performOperation(_ sender: UIButton) {
        if userIsInTheMiddleOfTyping {
            brain.setOperand(displayValue)
            userIsInTheMiddleOfTyping = false
        }
        
        if let methematicalSymbol = sender.currentTitle {
            brain.performOperation(methematicalSymbol)
        }
        
        if let result = brain.result {
            displayValue = result
        }
    }
    
}

