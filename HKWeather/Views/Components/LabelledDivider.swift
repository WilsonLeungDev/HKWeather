//
//  LabelledDivider.swift
//  HKWeather
//
//  Created by Wilson Leung on 24/2/2022.
//

import SwiftUI

struct LabelledDivider: View {

    let label: String
    let horizontalPadding: CGFloat
    let lineHeight: CGFloat
    let color: Color

    init(label: String, horizontalPadding: CGFloat = 20, lineHeight: CGFloat = 5, color: Color = .white) {
        self.label = label
        self.horizontalPadding = horizontalPadding
        self.color = color
        self.lineHeight = lineHeight
    }

    var body: some View {
        HStack {
            line
            Text(label).foregroundColor(color)
            line
        }
    }

    var line: some View {
        VStack {
            Divider().frame(height: lineHeight).background(color)
        }
        .padding(horizontalPadding)
    }
}

struct LabelledDivider_Previews: PreviewProvider {
    static var previews: some View {
        LabelledDivider(label: "Test")
            .preferredColorScheme(.dark)
    }
}
