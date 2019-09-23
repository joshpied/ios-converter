//
//  TemperatureViewController.swift
//  Assignment 1 Converter
//
//  Created by student on 2019-09-19.
//  Copyright © 2019 Josh Piedimonte. All rights reserved.

// I, Student Name, Josh Piedimonte 000746786, certify that this material is my original work.
// No other person's work has been used without due acknowledgement and I have not made my work available to anyone else.
//

import UIKit

class TemperatureViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        print("Temp loaded its view.")
    }
    
    @IBOutlet var tempLabel: UILabel!
    @IBOutlet var tempTextField: UITextField!
    
//    var convertedValue: Measurement<UnitTemperature>?
    
    let numberFormatter: NumberFormatter = {
        let nf = NumberFormatter()
        nf.numberStyle = .decimal
        nf.minimumFractionDigits = 0
        nf.maximumFractionDigits = 1
        return nf
    }()
    

    @IBAction func convertCelsiusToFahrenheit(_ sender: UIButton) {
        if let text = tempTextField.text, let value = Double(text) {
            let celsiusValue = Measurement<UnitTemperature>(value: value, unit: .celsius)
            let farValue = celsiusValue.converted(to: .fahrenheit)
            tempLabel.text = "\(text) C° is \(numberFormatter.string(from: NSNumber(value: farValue.value))!) F°"
        } else {
            tempLabel.text = "Unable to convert \((tempTextField.text)!)"
        }
    }
    
    @IBAction func convertFahrenheitToCelsius(_ sender: UIButton) {
        if let text = tempTextField.text, let value = Double(text) {
            let farValue = Measurement<UnitTemperature>(value: value, unit: .fahrenheit)
            let celsiusValue = farValue.converted(to: .celsius)
            tempLabel.text = "\(text) F° is \(numberFormatter.string(from: NSNumber(value: celsiusValue.value))!) C°"
        } else {
            tempLabel.text = "Unable to convert \((tempTextField.text)!)"
        }
    }
    
    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        tempTextField.resignFirstResponder()
    }
}

