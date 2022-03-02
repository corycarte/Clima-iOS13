//
//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController, UITextFieldDelegate, WeatherManagerDelegate {

    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    
    var weatherManager: WeatherManager = WeatherManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        searchTextField.delegate = self
        weatherManager.delegate = self
    }

    @IBAction func searchPressed(_ sender: UIButton) {
        searchTextField.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.endEditing(true)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        } else {
            textField.placeholder = "Maybe Mordor?"
            return false
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if searchTextField.text! == "Mordor" {
            searchTextField.placeholder = "I was kidding..."
        }
        
        if let city = searchTextField.text {
            weatherManager.fetchWeather(cityName: city)
        }
        // Retrieve the weather from the city given in the textField
        searchTextField.text = ""
    }
    
    func didUpdateWeather(_ weather: WeatherModel) {
        print("In \(weather.cityName) it is \(weather.temperatureString) and \(weather.conditionName)")
    }
}

