//
//  WeatherResponseModel.swift
//  HKWeather
//
//  Created by Wilson Leung on 23/2/2022.
//

import Foundation

struct WeatherResponse: Codable {
    var current: Weather
    var hourly: [Weather]
    var daily: [WeatherDaily]

    static func empty() -> WeatherResponse {
        WeatherResponse(
            current: Weather(),
            hourly: [Weather](repeating: Weather(), count: 24),
            daily: [WeatherDaily](repeating: WeatherDaily(), count: 8)
        )
    }
}
