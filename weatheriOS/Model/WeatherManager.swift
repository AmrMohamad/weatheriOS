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
        let url = "\(weatherURL)&appid=\(Constants.apiKey)&q=\(cityName)"
        performRequest(urlString: url)
        print(url)
    }
    
    func performRequest(urlString: String) {
        if let urlFetched = URL(string: urlString){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: urlFetched) { (data, response, error) in
                if error != nil {
                    print(error!)
                    return
                }
                
                if let safeData = data {
                    self.parseJSON(weatherData: safeData)
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(weatherData: Data) {
        let decoder = JSONDecoder()
        do{
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let id          = decodedData.weather[0].id
            let temp        = decodedData.main.temp
            let name        = decodedData.name
            
            let weather = WeatherModel(conditionId: id, cityName: name, temperatureDegree: temp)
            
            print(weather.temperatureString)
            print(temp)
        }catch{
            print(error)
        }
        
    }
}
