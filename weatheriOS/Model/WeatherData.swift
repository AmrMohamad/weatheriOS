//
//  WeatherData.swift
//  weatheriOS
//
//  Created by Amr Mohamad on 1/30/21.
//  Copyright © 2021 Amr Mohamad. All rights reserved.
//

import Foundation

struct WeatherData: Decodable {
    let name    : String
    let main    : Main
    let weather : [Weather]
}

struct Main: Decodable {
    let temp : Double
}

struct Weather: Decodable {
    let id          : Int
    let description : String
}
