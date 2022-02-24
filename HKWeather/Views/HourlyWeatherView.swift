//
//  HourlyWeatherView.swift
//  HKWeather
//
//  Created by Wilson Leung on 24/2/2022.
//

import SwiftUI

struct HourlyWeatherView: View {
    @StateObject var weatherViewModel: WeatherViewModel
    
    var body: some View {
        // Text("Hourly Forecast")
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 20) {
                ForEach(weatherViewModel.weather.hourly) { weather in
                    let icon = weatherViewModel.getWeatherIconFor(icon: (weather.weather.count > 0) ? weather.weather[0].icon : "sun.max.fill")
                    let hour = weatherViewModel.getTimeFor(timestamp: weather.dt)
                    let temp = weatherViewModel.getTempFor(temp: weather.temp)
                    
                    HourlyWeatherCell(hour: hour, image: icon, temp: temp)
                }
            }
        }
    }
    
    private func HourlyWeatherCell(hour: String, image: Image, temp: String) -> some View {
        VStack(spacing: 20) {
            Text(hour)
                .font(.title)
            
            image
                .foregroundStyle(.white)
            
            Text("\(temp)°C")
        }
        .foregroundStyle(.white)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(
                    LinearGradient(
                        gradient: Gradient(colors: [Color("LightPurple"), Color("MediumPurple")]),
                        startPoint: .topLeading, endPoint: .bottomTrailing
                    )
                )
        )
        .shadow(color: Color.white.opacity(0.1), radius: 2, x: -2, y: -2)
        .shadow(color: Color.black.opacity(0.2), radius: 2, x: 2, y: 2)
    }
}

struct HourlyWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        HourlyWeatherView(weatherViewModel: WeatherViewModel())
    }
}
