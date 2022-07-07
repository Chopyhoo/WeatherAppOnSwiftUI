//
//  WeatherViewModel.swift
//  WeatherAppOnSwiftUI
//
//  Created by Алексей Соболевский on 7.07.22.
//

import Foundation

final class WeatherViewModel: ObservableObject {
    private let weatherService = OpenWeatherMapController()
    
    @Published var weatherInfo = ""
    
    func fetch(city: String) {
        weatherService.fetchWeatherData(for: city) { info, error in
            guard error == nil,
                  let weatherInfo = info else {
                DispatchQueue.main.async {
                    self.weatherInfo = "Could not retrive weather information for \(city)"
                }
                return
            }
            DispatchQueue.main.async {
                self.weatherInfo = weatherInfo
            }
        }
    }
}
