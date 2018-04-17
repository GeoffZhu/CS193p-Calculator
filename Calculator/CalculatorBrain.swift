//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by GeoffZhu on 2018/4/17.
//  Copyright © 2018年 GeoffZhu. All rights reserved.
//

import Foundation

struct CalclatorBrain {
    private var accumulator: Double?
    
    mutating func performOperation (_ symbol: String) {
        switch symbol {
        case "π":
            accumulator = Double.pi
        case "√":
            if let operand = accumulator {
                accumulator = sqrt(operand)
            }
        default:
            break
        }
    }
    
    mutating func setOperand(_ operand: Double) {
        accumulator = operand
    }
    
    var result: Double? {
        get {
            return accumulator
        }
    }
}
