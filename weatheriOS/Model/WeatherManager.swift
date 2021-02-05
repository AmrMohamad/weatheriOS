//
//  WeatherManager.swift
//  weatheriOS
//
//  Created by Amr Mohamad on 1/30/21.
//  Copyright © 2021 Amr Mohamad. All rights reserved.
//

import Foundation
import CoreLocation

protocol WeatherManagerDelegate {
    func updateWeather(_ weatherManager: WeatherManager, weather: WeatherModel)
    func didFailWithError (_ error: Error)
}

struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?units=metric"
    
    var delegate :WeatherManagerDelegate?
    
    func fetchWeather(byCityName: String)  {
        let cN = byCityName.replacingOccurrences(of: " ", with: "%20")
        let url = "\(weatherURL)&appid=\(Constants.apiKey)&q=\(cN)"
        performRequest(urlString: url)
        print(url)
    }
    
    func fetchWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees){
        let url = "\(weatherURL)&appid=\(Constants.apiKey)&lat=\(latitude)&lon=\(longitude)"
        performRequest(urlString: url)
        print(url)
        
    }
    
    func performRequest(urlString: String) {
        if let urlFetched = URL(string: urlString){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: urlFetched) { (data, response, error) in
                if error != nil {
                    self.delegate?.didFailWithError(error!)
                    return
                }
                
                if let safeData = data {
                    if let weather = self.parseJSON(weatherData: safeData){
                        self.delegate?.updateWeather(self, weather: weather)
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(weatherData: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        do{
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let id          = decodedData.weather[0].id
            let temp        = decodedData.main.temp
            let name        = decodedData.name
            let description = decodedData.weather[0].description
            
            let weather = WeatherModel(conditionId: id, cityName: name, temperatureDegree: temp, descriptionOfWeatherCondition: description)
            return weather
//            print(weather.temperatureString)
//            print(temp)
        }catch{
            delegate?.didFailWithError(error)
            return nil
        }
        
    }
}
