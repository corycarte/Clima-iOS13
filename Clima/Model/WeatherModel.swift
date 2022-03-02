//
//  WeatherModel.swift
//  Clima
//
//  Created by Cory Carte on 2/26/22.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation

struct WeatherModel {
    let conditionId: Int
    let cityName: String
    let temperature: Double
    
    var temperatureString: String {
        return String(format: "%.1f", temperature)
    }
    
    // computed property
    // must be in form var propName: Type { computation }
    var conditionName: String {
        switch conditionId {
        case 200..<300:
            return "cloud.bolt"
        case 300..<400:
            return "cloud.drizzle"
        case 500..<600:
            return "cloud.rain"
        case 600..<700:
            return "cloud.snow"
        case 700..<800: // Case needs to be expanded to other weather
            return "smoke"
        case 800:
            return "sun.max"
        case 801..<900:
            return "cloud.sun"
        default:
            return "sparkles"
        }
    }
}
