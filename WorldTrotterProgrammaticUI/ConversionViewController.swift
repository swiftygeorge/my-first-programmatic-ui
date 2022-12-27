//
//  ConversionViewController.swift
//  WorldTrotterProgrammaticUI
//
//  Created by George Mapaya on 2022-12-27.
//

import UIKit

class ConversionViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: - Create subviews
        
        // Label for input temperature
        let fahrenheitLabel = UILabel()
        fahrenheitLabel.text = "212"
        fahrenheitLabel.textColor = .customLabelColor
        fahrenheitLabel.font = .systemFont(ofSize: 70)
        fahrenheitLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(fahrenheitLabel)
        // Label for input temperature measuring unit
        let degreesFahrenheitLabel = UILabel()
        degreesFahrenheitLabel.text = "degrees Fahrenheit"
        degreesFahrenheitLabel.textColor = .customLabelColor
        degreesFahrenheitLabel.font = .systemFont(ofSize: 36)
        degreesFahrenheitLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(degreesFahrenheitLabel)
        // Label for 'is really' text
        let isReallyLabel = UILabel()
        isReallyLabel.text = "is really"
        isReallyLabel.font = .systemFont(ofSize: 36)
        isReallyLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(isReallyLabel)
        // Label for output temperature
        let celsiusLabel = UILabel()
        celsiusLabel.text = "100"
        celsiusLabel.textColor = .customLabelColor
        celsiusLabel.font = .systemFont(ofSize: 70)
        celsiusLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(celsiusLabel)
        // Label for output temperature measuring unit
        let degreesCelsiusLabel = UILabel()
        degreesCelsiusLabel.text = "degrees Celsius"
        degreesCelsiusLabel.textColor = .customLabelColor
        degreesCelsiusLabel.font = .systemFont(ofSize: 36)
        degreesCelsiusLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(degreesCelsiusLabel)
        
        // MARK: - Add constraints to all subviews
        let margins = view.layoutMarginsGuide
        NSLayoutConstraint.activate([
            // fahrenheitLabel
            fahrenheitLabel.topAnchor.constraint(equalTo: margins.topAnchor, constant: 8),
            fahrenheitLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            // degreesFahrenheitLabel
            degreesFahrenheitLabel.topAnchor.constraint(equalTo: fahrenheitLabel.bottomAnchor, constant: 8),
            degreesFahrenheitLabel.centerXAnchor.constraint(equalTo: fahrenheitLabel.centerXAnchor),
            // isReallyLabel
            isReallyLabel.topAnchor.constraint(equalTo: degreesFahrenheitLabel.bottomAnchor, constant: 8),
            isReallyLabel.centerXAnchor.constraint(equalTo: fahrenheitLabel.centerXAnchor),
            // celsiusLabel
            celsiusLabel.topAnchor.constraint(equalTo: isReallyLabel.bottomAnchor, constant: 8),
            celsiusLabel.centerXAnchor.constraint(equalTo: fahrenheitLabel.centerXAnchor),
            // degreesCelsiusLabel
            degreesCelsiusLabel.topAnchor.constraint(equalTo: celsiusLabel.bottomAnchor, constant: 8),
            degreesCelsiusLabel.centerXAnchor.constraint(equalTo: fahrenheitLabel.centerXAnchor)
        ])
    }
    
    
}
