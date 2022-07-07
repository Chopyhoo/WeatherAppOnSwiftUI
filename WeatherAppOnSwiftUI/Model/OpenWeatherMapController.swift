//
//  OpenWeatherMapController.swift
//  WeatherAppOnSwiftUI
//
//  Created by Алексей Соболевский on 7.07.22.
//

import Foundation

private enum API {
    static let key = ""
}

final class OpenWeatherMapController: WebServiceController {
    func fetchWeatherData(for city: String, completionHandler: @escaping (String?, WebServiceControllerError?) -> Void) {
        let endpoint = "https://api.openweathermap.org/data/2.5/weather?q=\(city)}&appid=\(API.key)"
        
        guard let safeURLString = endpoint.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
              let endpointURL = URL(string: safeURLString) else {
                  completionHandler(nil, .invalidURL(urlString: endpoint))
                  return
              }
        
        let dataTask = URLSession.shared.dataTask(with: endpointURL) { data, response, error in
            if let error = error {
                completionHandler(nil, .forwarded(error))
                return
            }
            guard let responseData = data else {
                completionHandler(nil, .invalidPayload(fetchURL: endpointURL))
                return
            }
            
            // decode json
            let decoder = JSONDecoder()
            do {
                let weatherList = try decoder.decode(OpenWeatherMapContainer.self, from: responseData)
                guard let weatherInfo = weatherList.list?.first,
                      let weather = weatherInfo.weather.first?.main,
                      let temperature = weatherInfo.main.temp else {
                          completionHandler(nil, .invalidPayload(fetchURL: endpointURL))
                          return
                      }
                
                // compose weather information
                let weatherDescription = "\(weather) \(temperature) °F"
                completionHandler(weatherDescription, nil)
            } catch let error {
                completionHandler(nil, .forwarded(error))
            }
            
        }
    
        dataTask.resume()
    }
}
