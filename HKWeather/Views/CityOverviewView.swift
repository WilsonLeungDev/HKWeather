//
//  CityOverviewView.swift
//  HKWeather
//
//  Created by Wilson Leung on 24/2/2022.
//

import SwiftUI

struct CityOverviewView: View {
    var city: String
    var date: String
    
    var body: some View {
        HStack {
            VStack(alignment: .center, spacing: 10) {
                Text(city)
                    .font(.title)
                    .fontWeight(.bold)
                Text(date)
                    .font(.title2)
                    .fontWeight(.semibold)
            }
            .foregroundStyle(.white)
        }
        .preferredColorScheme(.dark)
    }
}

struct CityOverviewView_Previews: PreviewProvider {
    static var previews: some View {
        CityOverviewView(city: "Hong Kong", date: "2022-02-24")
    }
}

