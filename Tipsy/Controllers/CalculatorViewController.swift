//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

var stepperVal = "2"
var tipPercent = 0.1
var splitTipStr = "0.0"

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!

    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        sender.isSelected = true
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        stepperVal = String(format: "%.0f", sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        if zeroPctButton.isSelected{
            tipPercent = 0.0
        }
        else if tenPctButton.isSelected{
            tipPercent = 0.1
        }
        else{
            tipPercent = 0.2
        }
        var bill = billTextField.text!
        var splitTip = Float(bill)! * Float((1 + tipPercent)) / Float(stepperVal)!
        splitTipStr = String(format: "%0.2f", splitTip)
        performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult"{
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.calcResult = splitTipStr
            destinationVC.numberOfPeople = stepperVal
            destinationVC.tipPercentage = String(format: "%.0f", tipPercent * 100)
        }
    }
    
}

