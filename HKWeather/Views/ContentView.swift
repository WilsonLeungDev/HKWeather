//
//  ContentView.swift
//  HKWeather
//
//  Created by Wilson Leung on 25/2/2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var weatherViewModel = WeatherViewModel()
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ScrollView(showsIndicators: false) {
                WeatherForecastView(weatherViewModel: weatherViewModel)
                    .padding(.top, 10)
            }
        }
        .background(
            LinearGradient(
                gradient: Gradient(colors: [Color("LightPurple"), Color("MediumPurple")]),
                startPoint: .topLeading, endPoint: .bottomTrailing
            )
        )
        //        .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
