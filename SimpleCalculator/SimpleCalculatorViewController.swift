//
//  SimpleCalculatorViewController.swift
//  SimpleCalculator
//
//  Created by Sam Dindyal on 2018-07-22.
//  Copyright © 2018 Sam Dindyal. All rights reserved.
//

import UIKit

class SimpleCalculatorViewController: UIViewController {
    
    @IBOutlet var xField: UITextField!
    @IBOutlet var yField: UITextField!
    @IBOutlet var zLabel: UILabel!
    
    @IBAction func changeOperation(_ sender: UISegmentedControl) {
        
        // Get the new operation key
        self.operationKey = sender.titleForSegment(at: sender.selectedSegmentIndex)!
        
        // Calculate the new result and set the result field
        if calculate().isNaN {
         zLabel.text = "= ???"
        } else {
            zLabel.text = "= \(self.zValue)"
        }
    }
    
    @IBAction func fieldChanged(_ textField: UITextField) {
        // Calculate the new result and set the result field
        if calculate().isNaN {
            zLabel.text = "= ???"
        } else {
            zLabel.text = "= \(self.zValue)"
        }
    }
    
    var xValue:Float = 0.0
    var yValue:Float = 0.0
    var zValue:Float = 0.0
    var operationKey:String = "+"
    
    let operations: [String:(Float, Float) -> Float] = [
        "+": {
                (x, y) -> Float in
                    return x + y
            },
        "-": {
                (x, y) -> Float in
                    return x - y
            },
        "x": {
                (x, y) -> Float in
                    return x * y
        },
        "÷": {
                (x, y) -> Float in
                    return x / y
            }
    ]
    
    func fetchValues() -> Bool {
        if let x = Float(xField.text!),
            let y = Float(yField.text!) {
            self.xValue = x
            self.yValue = y
            return true
        } else {
            return false
        }
    }
    
    @discardableResult func calculate() -> Float {
        if fetchValues() {
            let operation = operations[self.operationKey]!
            self.zValue = operation(xValue, yValue)
            return self.zValue
        } else {
            return Float.nan
        }
        
    }
}
