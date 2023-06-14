//
//  ViewController.swift
//  weatheriOS
//
//  Created by AmrMohamad on 1/24/21.
//  Copyright © 2021 Amr Mohamad. All rights reserved.
//

import UIKit
import CoreLocation

class WeatherViewController: UIViewController {
    
    var background                  = WeatherUI().bGImage
    var searchTextField             = WeatherUI().searchTextField
    var weatherConditionImage       = WeatherUI().conditionImage
    var temperatureDegreeLabel      = WeatherUI().dgreeValueLabel
    var cityNameLabel               = WeatherUI().cityLabel
    var temperatureDegreeSignLabel  = WeatherUI().dgreeSignLabel
    var locationButton              = WeatherUI().locationButton
    var searchButton                = WeatherUI().searchButton

    var weatherManager  = WeatherManager()
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configUI()
        setUI()
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()

        weatherManager.delegate  = self
        searchTextField.delegate = self
    }

    @objc func locationButtonPressed(_ sender: UIButton) {
        locationManager.requestLocation()
    }
    @objc func searchButtonPressed(_ sender: UIButton) {
        searchTextField.endEditing(true)
        print(searchTextField.text!)
    }

}


extension WeatherViewController: WeatherManagerDelegate {
    func updateWeather(_ weatherManager: WeatherManager, weather: WeatherModel) {
        
        DispatchQueue.main.async {
            self.temperatureDegreeLabel.text      = "\(weather.temperatureString)°C"
            self.weatherConditionImage.image      = UIImage(systemName: weather.conditionName)
            self.cityNameLabel.text               = weather.cityName
//            self.weatherConditionDescription.text = weather.descriptionOfWeatherCondition
            
        }
        print(weather.temperatureDegree)
    }
    
    func didFailWithError(_ error: Error) {
        print(error)
    }
}



extension WeatherViewController: UITextFieldDelegate {
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
            print(city)
        }
        searchTextField.text = ""
    }
}


extension WeatherViewController: CLLocationManagerDelegate {
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


extension WeatherViewController {
    func configUI(){
        locationButton.addTarget(self,
                                 action: #selector(locationButtonPressed),
                                 for: .touchUpInside)
        searchButton.addTarget(self,
                               action: #selector(searchButtonPressed),
                               for: .touchUpInside)
    }
    
    func setUI(){
        view.addSubview(background)
        
        let searchStack = UIStackView(
            arrangedSubviews: [
                locationButton,
                searchTextField,
                searchButton
            ]
        )
        searchStack.translatesAutoresizingMaskIntoConstraints = false
        searchStack.axis         = .horizontal
        searchStack.alignment    = .fill
        searchStack.distribution = .fill
        searchStack.spacing      = 10
        view.addSubview(searchStack)
        
        let currentWeatherStack = UIStackView(
            arrangedSubviews: [
                weatherConditionImage,
                temperatureDegreeLabel,
                cityNameLabel
            ]
        )
        currentWeatherStack.translatesAutoresizingMaskIntoConstraints = false
        currentWeatherStack.axis         = .vertical
        currentWeatherStack.alignment    = .center
        currentWeatherStack.distribution = .fill
        currentWeatherStack.spacing      = 5
        
        let weatherDegreeBlurView = UIVisualEffectView(effect: UIBlurEffect(style: .regular))
        weatherDegreeBlurView.contentView.addSubview(currentWeatherStack)
        weatherDegreeBlurView.translatesAutoresizingMaskIntoConstraints = false
        weatherDegreeBlurView.layer.cornerRadius = 25
        weatherDegreeBlurView.clipsToBounds = true
        view.addSubview(weatherDegreeBlurView)
        
        let searchStackConstraints = [
            searchStack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 10),
            searchStack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            searchStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5),
            searchStack.heightAnchor.constraint(equalToConstant: 40)
        ]
        
        let locationButtonConstraints = [
            locationButton.heightAnchor.constraint(equalToConstant: 40),
            locationButton.widthAnchor.constraint(equalToConstant: 40)
        ]
        
        let searchButtonConstraints = [
           searchButton.heightAnchor.constraint(equalToConstant: 40),
           searchButton.widthAnchor.constraint(equalToConstant: 40)
        ]
        let w = view.layer.frame.width/2
        let h = view.layer.frame.height/4
        let weatherDegreeBlurViewConstraints = [
            weatherDegreeBlurView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            weatherDegreeBlurView.topAnchor.constraint(equalTo: searchStack.bottomAnchor, constant: 15),
            weatherDegreeBlurView.heightAnchor.constraint(equalToConstant: h),
            weatherDegreeBlurView.widthAnchor.constraint(equalToConstant: w),
            weatherConditionImage.heightAnchor.constraint(equalToConstant:  h/3),
            weatherConditionImage.widthAnchor.constraint(equalToConstant: w/2),
            currentWeatherStack.leadingAnchor.constraint(equalTo: weatherDegreeBlurView.contentView.leadingAnchor,
                                                         constant: 1),
            currentWeatherStack.trailingAnchor.constraint(equalTo: weatherDegreeBlurView.contentView.trailingAnchor,
                                                          constant: -1),
            currentWeatherStack.bottomAnchor.constraint(equalTo: weatherDegreeBlurView.contentView.bottomAnchor,
                                                        constant: -1),
            currentWeatherStack.topAnchor.constraint(equalTo: weatherDegreeBlurView.contentView.topAnchor,
                                                         constant: 1)
        ]
        
        let bGImageConstrains = [
           background.leadingAnchor.constraint(equalTo: view.leadingAnchor),
           background.topAnchor.constraint(equalTo: view.topAnchor),
           background.trailingAnchor.constraint(equalTo: view.trailingAnchor),
           background.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ]
        
        NSLayoutConstraint.activate(bGImageConstrains)
        NSLayoutConstraint.activate(searchStackConstraints)
        NSLayoutConstraint.activate(locationButtonConstraints)
        NSLayoutConstraint.activate(searchButtonConstraints)
        NSLayoutConstraint.activate(weatherDegreeBlurViewConstraints)

    }
}
