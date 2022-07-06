//
//  WebServiceController.swift
//  WeatherAppOnSwiftUI
//
//  Created by Алексей Соболевский on 7.07.22.
//

import Foundation

public enum WebServiceControllerError: Error {
    case invalidURL(urlString: String)
    case invalidPayload(fetchURL: URL)
    case forwarded(Error)
}

public protocol WebServiceController {
    func fetchWeatherData(for city: String,
                          completionHandler: (String?, WebServiceControllerError?) -> Void)
}
