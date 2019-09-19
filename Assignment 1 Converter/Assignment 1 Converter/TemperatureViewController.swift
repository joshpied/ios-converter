//
//  TemperatureViewController.swift
//  Assignment 1 Converter
//
//  Created by student on 2019-09-19.
//  Copyright © 2019 Josh Piedimonte. All rights reserved.
// I, Student Name, Josh Piedimonte 000746786, certify that this material is my original work.
//No other person's work has been used without due acknowledgement and I have not made my work available to anyone else.
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
    var convertedValue: Measurement<UnitTemperature>?
    
//    @IBAction func convertToFahrenheit(textField: UITextField) {
//        tempLabel.text = textField.text
//    }
//
//    @IBAction func convertToCelsius(textField: UITextField) {
//        tempLabel.text = textField.text
//    }

    @IBAction func convertCelsiusToFahrenheit(_ sender: UIButton) {
//        if let text = tempTextField.text, !text.isEmpty {
//            tempLabel.text = text
//        } else {
//            tempLabel.text = "???"
//        }
        if let text = tempTextField.text, let value = Double(text) {
            convertedValue = Measurement(value: value, unit: .fahrenheit)
            tempLabel.text = "\(text)C° is __ F°"
        } else {
            convertedValue = nil
        }
    }
    
    @IBAction func convertFahrenheitToCelsius(_ sender: UIButton) {
        tempLabel.text = "10 F° is 12 C°"
    }
    
    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        tempTextField.resignFirstResponder()
    }
}

