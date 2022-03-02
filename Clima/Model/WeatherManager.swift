//
//  WeatherManager.swift
//  Clima
//
//  Created by Cory Carte on 2/13/22.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation

protocol WeatherManagerDelegate {
    func didUpdateWeather(_ weather: WeatherModel)
}

struct WeatherManager {
    let weatherUrl = "https://api.openweathermap.org/data/2.5/weather?appid=8ef40728c745edbf4d9d5afa4cccbf87&units=imperial"
    
    var delegate: WeatherManagerDelegate?
    
    func fetchWeather(cityName: String) {
        let urlString = "\(weatherUrl)&q=\(cityName)"
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String) {
        // 1. Create URL
        if let url = URL(string: urlString) {
            
            // 2. Create URLSession
            let session = URLSession(configuration: .default)
            
            // 3. Give the session a task
            // completion handler is triggered by the task, The task will add
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    print(error!)
                    return
                }
                
                if let safeData = data {
                    // Call self within closure no longer required apparently
                    
                    if let weather = parseJson(weatherData: safeData) {
                        delegate?.didUpdateWeather(weather)
                    }
                }
            }
            
            // 4. Start the task
            // Why resume? because a task can be suspended, and
            // Newly created tasks start in suspended state
            task.resume()
        }
        
        func parseJson(weatherData: Data) -> WeatherModel? {
            let decoder = JSONDecoder()
            do {
                let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
                
                let wid = decodedData.weather[0].id
                let temp = decodedData.main.temp
                let name = decodedData.name

                return WeatherModel(conditionId: wid, cityName: name, temperature: temp)
            } catch {
                print(error)
                return nil
            }
            
        }
    }
}
