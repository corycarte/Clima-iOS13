//
//  WeatherManager.swift
//  Clima
//
//  Created by Cory Carte on 2/13/22.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation

struct WeatherManager {
    let weatherUrl = "https://api.openweathermap.org/data/2.5/weather?appid=8ef40728c745edbf4d9d5afa4cccbf87&units=imperial"
    
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
            let task = session.dataTask(with: url, completionHandler: handle(data: response: error: ))
            
            // 4. Start the task
            // Why resume? because a task can be suspended, and
            // Newly created tasks start in suspended state
            task.resume()
        }
    }
    
    // handler for dataTask
    func handle(data: Data?, response: URLResponse?, error: Error?) {
        // If error occurred, print and return
        if error != nil {
            print(error!)
            return
        }
        
        if let safeData = data {
            let dataString = String(data: safeData, encoding: .utf8)
            print(dataString!)
        }
    }
}
