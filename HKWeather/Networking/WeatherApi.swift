//
//  WeatherApi.swift
//  HKWeather
//
//  Created by Wilson Leung on 24/2/2022.
//

import Foundation

struct WeatherApi {
    static let key = "API_KEY"
}

extension WeatherApi {
    static let baseURL = "https://api.openweathermap.org/data/2.5"

    static func getCurrentWeatherURL(lat: Double, lon: Double) -> String {
        return "\(baseURL)/weather?lat=\(lat)&lon=\(lon)&appid=\(key)&units=metric"
    }

    static func getForecastWeatherURL(lat: Double, lon: Double) -> String {
        let excludeFields = "minutely"
        return "\(baseURL)/onecall?lat=\(lat)&lon=\(lon)&appid=\(key)&exclude=\(excludeFields)&units=metric"
    }
}
