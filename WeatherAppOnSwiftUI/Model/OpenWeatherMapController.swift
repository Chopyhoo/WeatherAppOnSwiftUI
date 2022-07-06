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
    }
    
    
}
