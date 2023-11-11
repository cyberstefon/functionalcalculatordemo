//
//  ViewController.swift
//  Calculator
//
//  Created by Stefon Gholston on 6/22/23.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var calculatorResults: UILabel!
    
    @IBOutlet weak var calculatorWorkings: UILabel!
    
    var workings: String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        clearAll()
    }
    
    
    func clearAll()
    {
        workings = ""
        calculatorWorkings.text = ""
        calculatorResults.text = ""
    }
    
    
    
    
    
    
    
    
    @IBAction func allClearTap(_ sender: Any) {
        clearAll()
    }
    
    func addToWorkings(value: String)
    {
        workings = workings + value
        calculatorWorkings.text = workings
    }
    
    
    
    
    
    @IBAction func backTap(_ sender: Any) {
        if(!workings.isEmpty)
        {
            workings.removeLast()
            calculatorWorkings.text = workings
        }
    }
    
    @IBAction func percentage(_ sender: Any) {
        addToWorkings(value: "%")
    }
    
    
    @IBAction func divide(_ sender: Any) {
        addToWorkings(value: "/")
    }
    
    @IBAction func number7(_ sender: Any) {
        addToWorkings(value: "7")
    }
    
    @IBAction func number8(_ sender: Any) {
        addToWorkings(value: "8")
    }
    
    
    @IBAction func number9(_ sender: Any) {
        addToWorkings(value: "9")
    }
    
    @IBAction func multiply(_ sender: Any) {
        addToWorkings(value: "*")
    }
    
    
    @IBAction func number4(_ sender: Any) {
        addToWorkings(value: "4")
    }
    
    @IBAction func number5(_ sender: Any) {
        addToWorkings(value: "5")
    }
    
    @IBAction func number6(_ sender: Any) {
        addToWorkings(value: "6")
    }
    
    
    
    @IBAction func subtract(_ sender: Any) {
        addToWorkings(value: "-")
    }
    
    
    @IBAction func number1(_ sender: Any) {
        addToWorkings(value: "1")
    }
    
    
    @IBAction func number2(_ sender: Any) {
        addToWorkings(value: "2")
    }
    
    
    @IBAction func number3(_ sender: Any) {
        addToWorkings(value: "3")
    }
    
    
    
    @IBAction func plusbutton(_ sender: Any) {
        addToWorkings(value: "+")
    }
    
    
    @IBAction func number0(_ sender: Any) {
        addToWorkings(value: "0")
    }
    
    
    @IBAction func decimalButton(_ sender: Any) {
        addToWorkings(value: ".")
    }
    
    
    @IBAction func equalsButton(_ sender: Any) {
        
        if validInput() {
            
            
            let checkWorkingForPercentages = workings.replacingOccurrences(of: "%", with: "*0.01")
            let expression = NSExpression(format: checkWorkingForPercentages)
            let result = expression.expressionValue(with: nil, context: nil) as! Double
            let resultString = formatResult(result: result)
            calculatorResults.text = resultString
        }
        else {
            let alert = UIAlertController(title: "Invalid", message: "Calculator unable to do math due to invalid input.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Okay", style: .default))
            self.present(alert, animated: true, completion: nil)
        }
    }
   
    func formatResult(result: Double) -> String
    {
        if (result.truncatingRemainder(dividingBy: 1) == 0) {
            return String(format: "%.0f", result)
            
        } else {
            
            return String(format: "%.2f", result)
        }
        
    }
        
        func validInput() -> Bool
        {
            var count = 0
            var funcCharIndexes = [Int]()
            for char in workings
            {
                if (specialCharachter(char: char)) {
                    funcCharIndexes.append(count)
                }
                count += 1
            }
            
            var previous: Int = -1
            for index in funcCharIndexes {
                if(index == 0) {
                    return false
                }
                if(index == workings.count - 1) {
                    return false
                }
                if(previous != -1)
                {
                    if(index - previous == 1) {
                        return false
                    }
                    
                    previous = index
                }
                
                
            }
            
            
            return true
        }
    func specialCharachter (char: Character) -> Bool {
        if(char == "+") {
            return true
            
        }
        if(char == "*") {
            return true
            
        }
        if(char == "-") {
            return true
            
        }
        if(char == "X") {
            return true
            
        }
        if(char == "÷") {
            return true
            
        }
        return false
    }
    

    
    
}

    

