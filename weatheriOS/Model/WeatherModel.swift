//
//  WeatherModel.swift
//  weatheriOS
//
//  Created by Amr Mohamad on 1/30/21.
//  Copyright © 2021 Amr Mohamad. All rights reserved.
//

import Foundation

struct WeatherModel {
    let conditionId       : Int
    let cityName          : String
    let temperatureDegree : Double
    
    var temperatureString : String{
        return String(format: "%.1f",temperatureDegree)
    }
    var conditionName     : String {
        switch conditionId {
        case 200...232:
            return "cloud.bolt.fill"
        case 300...321:
            return "cloud.drizzle.fill"
        case 500...531:
            return "cloud.rain.fill"
        case 600...622:
            return "cloud.snow.fill"
        case 700...771:
            return "cloud.fog.fill"
        case 781:
            return "tornado"
        case 800:
            return "sun.max"
        case 801...802:
            return "cloud.fill"
        case 803...804:
            return "smoke.fill"
        default:
            return "cloud.sun.fill"
        }
    }
}
