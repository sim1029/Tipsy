//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Simon Schueller on 3/14/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    var calcResult: String?
    var numberOfPeople: String?
    var tipPercentage: String?
    
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = calcResult
        settingsLabel.text = "Split between \(numberOfPeople!) people, with \(tipPercentage!)% tip"
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
