//
//  WeatherDetailModel.swift
//  HKWeather
//
//  Created by Wilson Leung on 23/2/2022.
//

import Foundation

struct WeatherDetail: Codable, Identifiable {
    var main: String
    var description: String
    var icon: String
}

extension WeatherDetail {
    var id: Int {
        0
    }
}


