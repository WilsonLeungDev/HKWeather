//
//  WeatherForecastView.swift
//  HKWeather
//
//  Created by Wilson Leung on 24/2/2022.
//

import SwiftUI

struct WeatherForecastView: View {
    @StateObject var weatherViewModel: WeatherViewModel
    
    var body: some View {
        VStack {
            CityOverviewView(city: weatherViewModel.city, date: weatherViewModel.date)
            
            TodayWeatherView(weatherViewModel: weatherViewModel)
                .padding()
            
            LabelledDivider(label: "Hourly")
            
            HourlyWeatherView(weatherViewModel: weatherViewModel)
                .padding(.horizontal)
            
            LabelledDivider(label: "Daily")
            
            DailyWeatherView(weatherViewModel: weatherViewModel)
                .padding(.horizontal)
                .padding(.vertical, 15)
        }
    }
}

struct WeatherForecastView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherForecastView(weatherViewModel: WeatherViewModel())
    }
}
