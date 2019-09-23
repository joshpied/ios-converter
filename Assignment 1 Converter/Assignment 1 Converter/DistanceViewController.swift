//
//  DistanceViewController.swift
//  Assignment 1 Converter
//
//  Created by student on 2019-09-19.
//  Copyright © 2019 Josh Piedimonte. All rights reserved.
//

import UIKit

class DistanceViewController: UIViewController {
    
    @IBOutlet var distanceTextField: UITextField!
    @IBOutlet var distanceLabel: UILabel!
    
    let numberFormatter: NumberFormatter = {
        let nf = NumberFormatter()
        nf.numberStyle = .decimal
        nf.minimumFractionDigits = 0
        nf.maximumFractionDigits = 1
        return nf
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("distance loaded its view.")
    }
    
    @IBAction func convertKmToMiles(_ sender: UIButton) {
        if let text = distanceTextField.text, let value = Double(text) {
            let kmValue = Measurement<UnitLength>(value: value, unit: .kilometers)
            let mileValue = kmValue.converted(to: .miles)
            distanceLabel.text = "\(text) KM is \(numberFormatter.string(from: NSNumber(value: mileValue.value))!) miles"
        } else {
            distanceLabel.text = "Unable to convert \((distanceTextField.text)!)"
        }
    }
    
    @IBAction func convertMilesToKm(_ sender: UIButton) {
        if let text = distanceTextField.text, let value = Double(text) {
            let mileValue = Measurement<UnitLength>(value: value, unit: .miles)
            let kmValue = mileValue.converted(to: .kilometers)
            distanceLabel.text = "\(text) miles is \(numberFormatter.string(from: NSNumber(value: kmValue.value))!) km"
        } else {
            distanceLabel.text = "Unable to convert \((distanceTextField.text)!)"
        }
    }
    
    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        distanceTextField.resignFirstResponder()
    }
}
