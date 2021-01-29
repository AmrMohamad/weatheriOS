//
//  WeatherManager.swift
//  weatheriOS
//
//  Created by Amr Mohamad on 1/30/21.
//  Copyright © 2021 Amr Mohamad. All rights reserved.
//

import Foundation

struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?units=metric"
    
    func fetchWeather(cityName: String)  {
        let url = "\(weatherURL)appid=\(Constants.apiKey)&q=\(cityName)"
        print(url)
    }
}
