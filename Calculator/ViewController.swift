//
//  ViewController.swift
//  Calculator
//
//  Created by user187992 on 2/19/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var displayLabel: UILabel!
    
    var operation = ""
    var current = "0"
    var deleteDisplayText = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func calculate(x: Float, y: Float, operation: String) -> Float {
        switch operation {
        case "/":
            return x / y
        case "x":
            return x * y
        case "+":
            return x + y
        case "-":
            return x - y
        default:
            return y
        }
    }
    
    @IBAction func processNumber(_ sender: UIButton) {
        if let numberText = sender.titleLabel?.text {
            if !deleteDisplayText {
                if (displayLabel.text == "0") {
                    displayLabel.text = numberText
                } else {
                    displayLabel.text = displayLabel.text! + numberText
                }
            } else {
                displayLabel.text = numberText
                deleteDisplayText = false
            }
            
        }
    }

    @IBAction func processOperation(_ sender: UIButton) {
        if let numberText = sender.titleLabel?.text {
            if operation.isEmpty {
                operation = numberText
                current = displayLabel.text ?? "0"
                deleteDisplayText = true
            } else {
                let x = Float(current)
                let y = Float(displayLabel.text!)
                let result = calculate(x: x!, y: y!, operation: operation)
                current = String(result)
                displayLabel.text = String(result)
                operation = numberText
                deleteDisplayText = true
            }
        }
        
    }

    @IBAction func processEquals(_ sender: UIButton) {
        let x = Float(current)
        let y = Float(displayLabel.text!)
        let result = calculate(x: x!, y: y!, operation: operation)
        displayLabel.text = String(result)
        current = "0"
        operation = ""
        deleteDisplayText = true
    }
    @IBAction func processClear(_ sender: UIButton) {
        displayLabel.text = "0"
        current = "0"
        deleteDisplayText  = true
        operation = ""
    }
}

