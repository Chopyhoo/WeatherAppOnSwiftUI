//
//  OpenWeatherMapData.swift
//  WeatherAppOnSwiftUI
//
//  Created by Алексей Соболевский on 7.07.22.
//

import Foundation

// JSON Data > Swift mappings
// The OpenWeatherMap API returns a more verbose JSON response
// The following Swift structures include a subset of the returned data, because we only need the weather description and the temperature - the other details are skipped.
// Check https://openweathermap.org/current for more information.

struct OpenWeatherMapData: Codable {
    var weather: [OpenWeatherMapWeather]
    var main: OpenWeatherMapMain
}

struct OpenWeatherMapWeather: Codable {
    var id: Int?
    var main: String?
    var description: String?
    var icon: String?
}

struct OpenWeatherMapMain: Codable {
    var temp: Float?
}
