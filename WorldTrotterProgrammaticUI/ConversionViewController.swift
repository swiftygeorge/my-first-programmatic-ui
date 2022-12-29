//
//  ConversionViewController.swift
//  WorldTrotterProgrammaticUI
//
//  Created by George Mapaya on 2022-12-27.
//

import UIKit

class ConversionViewController: UIViewController, UITextFieldDelegate {
    
    let fahrenheitTextField = UITextField()
    let degreesFahrenheitLabel = UILabel()
    let isReallyLabel = UILabel()
    let celsiusLabel = UILabel()
    let degreesCelsiusLabel = UILabel()
    
    var delegate: UITextFieldDelegate?
    var fahrenheitValue: Measurement<UnitTemperature>? {
        didSet { updateCelsiusLabel() }
    }
    var celsiusValue: Measurement<UnitTemperature>? {
        if let fahrenheitValue = fahrenheitValue {
            return fahrenheitValue.converted(to: .celsius)
        } else {
            return nil
        }
    }
    let numberFormatter: NumberFormatter = {
        let nf = NumberFormatter()
        nf.numberStyle = .decimal
        nf.minimumFractionDigits = 0
        nf.maximumFractionDigits = 1
        return nf
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard(_:))))
        
        // MARK: - Configure subviews
        
        // TextField for input temperature
        fahrenheitTextField.placeholder = "value"
        fahrenheitTextField.textColor = .customLabelColor
        fahrenheitTextField.textAlignment = .center
        fahrenheitTextField.borderStyle = .none
        fahrenheitTextField.minimumFontSize = 17
        fahrenheitTextField.adjustsFontSizeToFitWidth = false
        fahrenheitTextField.keyboardType = .decimalPad
        fahrenheitTextField.autocorrectionType = .no
        fahrenheitTextField.spellCheckingType = .no
        fahrenheitTextField.font = .systemFont(ofSize: 70)
        fahrenheitTextField.addTarget(self, action: #selector(fahrenheitFieldEditingChanged(_:)), for: .editingChanged)
        fahrenheitTextField.delegate = self
        fahrenheitTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(fahrenheitTextField)
        // Label for input temperature measuring unit
        degreesFahrenheitLabel.text = "degrees Fahrenheit"
        degreesFahrenheitLabel.textColor = .customLabelColor
        degreesFahrenheitLabel.font = .systemFont(ofSize: 36)
        degreesFahrenheitLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(degreesFahrenheitLabel)
        // Label for 'is really' text
        isReallyLabel.text = "is really"
        isReallyLabel.font = .systemFont(ofSize: 36)
        isReallyLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(isReallyLabel)
        // Label for output temperature
        updateCelsiusLabel()
        celsiusLabel.textColor = .customLabelColor
        celsiusLabel.font = .systemFont(ofSize: 70)
        celsiusLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(celsiusLabel)
        // Label for output temperature measuring unit
        degreesCelsiusLabel.text = "degrees Celsius"
        degreesCelsiusLabel.textColor = .customLabelColor
        degreesCelsiusLabel.font = .systemFont(ofSize: 36)
        degreesCelsiusLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(degreesCelsiusLabel)
        
        // MARK: - Add constraints to all subviews
        let margins = view.layoutMarginsGuide
        NSLayoutConstraint.activate([
            // fahrenheitTextField
            fahrenheitTextField.topAnchor.constraint(equalTo: margins.topAnchor, constant: 8),
            fahrenheitTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            // degreesFahrenheitLabel
            degreesFahrenheitLabel.topAnchor.constraint(equalTo: fahrenheitTextField.bottomAnchor, constant: 8),
            degreesFahrenheitLabel.centerXAnchor.constraint(equalTo: fahrenheitTextField.centerXAnchor),
            // isReallyLabel
            isReallyLabel.topAnchor.constraint(equalTo: degreesFahrenheitLabel.bottomAnchor, constant: 8),
            isReallyLabel.centerXAnchor.constraint(equalTo: fahrenheitTextField.centerXAnchor),
            // celsiusLabel
            celsiusLabel.topAnchor.constraint(equalTo: isReallyLabel.bottomAnchor, constant: 8),
            celsiusLabel.centerXAnchor.constraint(equalTo: fahrenheitTextField.centerXAnchor),
            // degreesCelsiusLabel
            degreesCelsiusLabel.topAnchor.constraint(equalTo: celsiusLabel.bottomAnchor, constant: 8),
            degreesCelsiusLabel.centerXAnchor.constraint(equalTo: fahrenheitTextField.centerXAnchor)
        ])
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let existingTextHasDecimalSeperator = textField.text?.range(of: ".")
        let replacementTextHasDecimalSeperator = string.range(of: ".")
        if existingTextHasDecimalSeperator != nil, replacementTextHasDecimalSeperator != nil {
            return false
        } else {
            for character in string {
                if !character.isNumber, character != "." {
                    return false
                } else {
                    continue
                }
            }
        }
        return true
    }
    
    @objc func fahrenheitFieldEditingChanged(_ textField: UITextField) {
        if let text = fahrenheitTextField.text, let value = Double(text) {
            fahrenheitValue = Measurement(value: value, unit: .fahrenheit)
        } else {
            fahrenheitValue = nil
        }
    }
    
    @objc func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        fahrenheitTextField.resignFirstResponder()
    }
    
    func updateCelsiusLabel() {
        if let celsiusValue = celsiusValue {
            celsiusLabel.text = numberFormatter.string(from: NSNumber(value: celsiusValue.value))
        } else {
            celsiusLabel.text = "???"
        }
    }
    
    
}
