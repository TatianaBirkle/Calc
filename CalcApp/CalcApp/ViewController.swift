//
//  ViewController.swift
//  CalcApp
//
//  Created by Татьяна Биркле on 24.01.2024.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
    @IBOutlet weak var resultLabel: UILabel!
    
    var number1: Double = 0
    var number2: Double = 0
    var result: Double = 0
    var typing = false
    var selectedOperation: String?
    var currentNumber: Double {
        get {
            return Double(resultLabel.text!)!
        }
        set {
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
        
    func isPointIntoString () -> Bool {
        let point  = "."
        let text = resultLabel.text
        if text!.contains(point) {
            return true
        }else{
            return false
        }
    }
    
    @IBAction func pressPoint(sender: UIButton) {
        let tempNum: String = "."
        if isPointIntoString() == true {
            
        }else{
            let text: String = resultLabel.text!
            resultLabel.text = "\(text)\(tempNum)"
            typing = true
        }
    }
    
    @IBAction func pressNum(_ sender: UIButton) {
        let tempNum = sender.currentTitle!
        if typing {
            if resultLabel.text!.count <= 20 {
                resultLabel.text = resultLabel.text! + tempNum
            }
        }else{
            if tempNum == "0" {
                resultLabel.text = tempNum
                typing = false
            }else{
                resultLabel.text = tempNum
                typing = true
            }
        }
    }
        
    @IBAction func clearAll(_ sender: UIButton) {
            resultLabel.text = "0"
            number1 = 0
            number2 = 0
            result = 0
            typing = false
        }
        
    @IBAction func deleteLastNumber(_ sender: UIButton) {
            if resultLabel.text!.count >= 2 {
                resultLabel.text?.removeLast()
            }else{
                resultLabel.text = "0"
                typing = false
            }
        }
        
        func isMinusIntoString () -> Bool {
            let minus  = "-"
            let text = resultLabel.text
            if text!.contains(minus) {
                return true
            }else{
                return false
            }
        }
        
    @IBAction func positiveOrNegative(_ sender: UIButton) {
            if resultLabel.text != "0" {
                let tempNum: String = "-"
                if isMinusIntoString() == true {
                    resultLabel.text?.removeFirst()
                }else{
                    let text: String = resultLabel.text!
                    resultLabel.text = "\(tempNum)\(text)"
                }
            }else{
                resultLabel.text = "0"
            }
        }
     
    @IBAction func OperationButton(_ sender: UIButton) {
        selectedOperation = sender.currentTitle
        number1 = currentNumber
        typing = false
    }

    
    @IBAction func Equals(_ sender: UIButton) {
        if typing == false {
        }else{
            number2 = currentNumber
            print(number2)
            
            switch selectedOperation {
            case "+":
                result = number1 + number2

            case "-":
                result = number1 - number2
               
            case "*":
                result = number1 * number2
                
            case "/":
                // проверка деления на 0, но не работает)))
                if number2 != 0 {
                    result = number1 / number2
                
                }else if number2 == 0 {
                    resultLabel.text = "ERROR"
                }
            default:
                break
            }
            resultLabel.text = "\(result)"
            typing = false
        }
    }
    
    @IBAction func Percent(_ sender: UIButton) {
        if typing == false {
        }else{
            number2 = currentNumber
            
            switch selectedOperation {
            case "+":
                result = number1 + (number1 / 100 * number2)

            case "-":
                result = number1 - (number1 / 100 * number2)
               
            case "*":
                result = number1 * (number1 / 100 * number2)
                
            case "/":
                if number2 != 0 {
                    result = number1 / (number1 / 100 * number2)
                }else{
                    resultLabel.text = "ERROR"
                }
            default:
                break
            }
            resultLabel.text = "\(result)"
            typing = false
        }
    }
}
    

        
    
    
    
    




