//
//  TodayWeatherView.swift
//  HKWeather
//
//  Created by Wilson Leung on 24/2/2022.
//

import SwiftUI

struct TodayWeatherView: View {
    @StateObject var weatherViewModel: WeatherViewModel
    
    var body: some View {
        VStack(spacing: 10) {
            Text("Today")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            HStack(spacing: 20) {
                LottieView(name: weatherViewModel.getLottieAnimationFor(icon: weatherViewModel.weatherIcon))
                    .frame(width: 100, height: 100)
                
                VStack(alignment: .leading) {
                    Text("\(weatherViewModel.temperature)°C")
                        .font(.system(size: 42))
                    Text(weatherViewModel.conditions)
                }
            }
            
            HStack {
                Spacer()
                WidgetView(image: "wind", color: .green, title: "\(weatherViewModel.windSpeed) m/s")
                Spacer()
                WidgetView(image: "drop.fill", color: .blue, title: "\(weatherViewModel.humidity)")
                Spacer()
                WidgetView(image: "umbrella.fill", color: .red, title: "\(weatherViewModel.rainChances)")
                Spacer()
            }
        }
        .padding()
        .foregroundStyle(.white)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(
                    LinearGradient(gradient: Gradient(colors: [Color("DeepPurple"), Color("DarkPurple")]),
                                   startPoint: .top, endPoint: .bottom)
                )
                .opacity(0.3)
        )
        .shadow(color: Color.white.opacity(0.1), radius: 2, x: -2, y: -2)
        .shadow(color: Color.black.opacity(0.2), radius: 2, x: 2, y: 2)
    }
    
    private func WidgetView(image: String, color: Color, title: String) -> some View {
        VStack {
            Image(systemName: image)
                .padding()
                .font(.title)
                .foregroundStyle(color)
                .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
            
            Text(title)
                .font(.title)
        }
    }
}

struct TodayWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        TodayWeatherView(weatherViewModel: WeatherViewModel())
    }
}
