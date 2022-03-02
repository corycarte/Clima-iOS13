//
//  WeatherData.swift
//  Clima
//
// Data contract with OpenWeatherAPI
//
//  Created by Cory Carte on 2/25/22.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation

struct WeatherData : Decodable {
    let name: String
    let main: Main
    let weather: Array<Weather>
}

struct Main: Decodable {
    let temp: Double
}

struct Weather: Decodable {
    let id: Int
    let description: String
}
