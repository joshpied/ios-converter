//
//  CurrencyViewController.swift
//  Assignment 1 Converter
//
//  Created by student on 2019-09-19.
//  Copyright © 2019 Josh Piedimonte. All rights reserved.
//

import UIKit

class CurrencyViewController: UIViewController {

    @IBOutlet var amountTextField: UITextField!
    @IBOutlet var amountLabel: UILabel!
    // $1.00 CAD = $0.755615 USD.
    let usdRate = 0.755615
    
    let numberFormatter: NumberFormatter = {
        let nf = NumberFormatter()
        nf.numberStyle = .decimal
        nf.minimumFractionDigits = 0
        nf.maximumFractionDigits = 2
        return nf
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("currency loaded its view.")
    }

    @IBAction func convertCanadianToAmerican(_ sender: UIButton) {
        if let text = amountTextField.text, let value = Double(text) {
            let usdValue = value * usdRate
            amountLabel.text = "$\(text) CAD is $\(numberFormatter.string(from: NSNumber(value: usdValue))!) USD"
        } else {
            amountLabel.text = "Unable to convert \((amountTextField.text)!)"
        }
    }
    
    @IBAction func convertAmericanToCanadian(_ sender: UIButton) {
        if let text = amountTextField.text, let value = Double(text) {
            let cadValue = value * (1 + usdRate)
            amountLabel.text = "$\(text) USD is $\(numberFormatter.string(from: NSNumber(value: cadValue))!) CAD"
        } else {
            amountLabel.text = "Unable to convert \((amountTextField.text)!)"
        }
    }
}

