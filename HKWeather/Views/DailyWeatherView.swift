//
//  DailyWeatherView.swift
//  HKWeather
//
//  Created by Wilson Leung on 24/2/2022.
//

import SwiftUI

struct DailyWeatherView: View {
    @StateObject var weatherViewModel: WeatherViewModel

    var body: some View {
        ForEach(weatherViewModel.weather.daily) { weather in
            LazyVStack {
                DailyWeatherCell(weather: weather)
            }
        }
    }

    private func DailyWeatherCell(weather: WeatherDaily) -> some View {
        HStack {
            VStack {
                Text(weatherViewModel.getDayFor(timestamp: weather.dt).uppercased())
                    .frame(width: 50)
                Spacer()
                Text(weatherViewModel.getDayNumber(timestamp: weather.dt))
                    .font(.title)
            }

            Spacer()

            VStack {
                Image(systemName: "arrow.down.circle.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20)
                Text("\(weatherViewModel.getTempFor(temp: weather.temp.min))°C")
            }
            
            Spacer()
            
            VStack {
                Image(systemName: "arrow.up.circle.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20)
                Text("\(weatherViewModel.getTempFor(temp: weather.temp.max))°C")
            }

            Spacer()

            weatherViewModel.getWeatherIconFor(icon: weather.weather[0].icon)
        }
            .foregroundStyle(.white)
            .padding(.horizontal, 40)
            .padding(.vertical, 15)
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

struct DailyWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        DailyWeatherView(weatherViewModel: WeatherViewModel())
    }
}
