//
//  SimpleCalculatorViewController.swift
//  SimpleCalculator
//
//  Created by Sam Dindyal on 2018-07-22.
//  Copyright © 2018 Sam Dindyal. All rights reserved.
//

import UIKit

class SimpleCalculatorViewController: UIViewController {
    
    @IBOutlet var xLabel: UILabel!
    @IBOutlet var yLabel: UILabel!
    @IBOutlet var zLabel: UILabel!
    
    @IBAction func changeOperation(_ sender: UISegmentedControl) {
        let operation = sender.titleForSegment(at: sender.selectedSegmentIndex)!
        let z = operations[operation]?(1, 2)
        print(z!)
    }
    
    let operations: [String:((Int, Int) -> Int)] = [
        "+": {
                (x, y) -> Int in
                    return x + y
            },
        "-": {
                (x, y) -> Int in
                    return x - y
            },
        "x": {
                (x, y) -> Int in
                    return x * y
        },
        "÷": {
                (x, y) -> Int in
                    return x / y
            }
    ]
}
