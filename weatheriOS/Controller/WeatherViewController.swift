//
//  ViewController.swift
//  weatheriOS
//
//  Created by AmrMohamad on 1/24/21.
//  Copyright © 2021 Amr Mohamad. All rights reserved.
//

import UIKit
import CoreLocation

class WeatherViewController: UIViewController, UITextFieldDelegate, WeatherManagerDelegate,CLLocationManagerDelegate {
    
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var weatherConditionImage: UIImageView!
    @IBOutlet weak var temperatureDegreeLabel: UILabel!
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var weatherConditionDescription: UILabel!
    
    var weatherManager  = WeatherManager()
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
        
        weatherManager.delegate  = self
        searchTextField.delegate = self
        
        
        
    }

    @IBAction func setLocationButton(_ sender: UIButton) {
        locationManager.requestLocation()
    }
    @IBAction func searchAction(_ sender: UIButton) {
        searchTextField.endEditing(true)
        print(searchTextField.text!)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.endEditing(true)
        print(searchTextField.text!)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        }else{
            textField.placeholder = "Type a city name here...."
            return false
        }
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let city = searchTextField.text {
            weatherManager.fetchWeather(byCityName: city)
        }
        searchTextField.text = ""
    }
    
    func updateWeather(_ weatherManager: WeatherManager, weather: WeatherModel) {
        
        DispatchQueue.main.async {
            self.temperatureDegreeLabel.text      = weather.temperatureString
            self.weatherConditionImage.image      = UIImage(systemName: weather.conditionName)
            self.cityNameLabel.text               = weather.cityName
            self.weatherConditionDescription.text = weather.descriptionOfWeatherCondition
            
        }
        print(weather.temperatureDegree)
    }
    
    func didFailWithError(_ error: Error) {
        print(error)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            locationManager.stopUpdatingLocation()
            let lat = location.coordinate.latitude
            let lon = location.coordinate.longitude
            weatherManager.fetchWeather(latitude: lat, longitude: lon)
        }
        
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}

