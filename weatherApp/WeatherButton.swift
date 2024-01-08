//
//  WeatherButton.swift
//  weatherApp
//
//  Created by siva on 1/8/24.
//
import SwiftUI
struct WeatherButton : View {
    var buttonLabel : String
    var buttonColor : Color
    var labelColor : Color
    var body: some View {
            Text(buttonLabel)
                .frame(width:280,height:50)
                .background(buttonColor.gradient)
                .foregroundColor(labelColor)
                .font(.system(size: 20,weight:.bold,design: .default))
                .cornerRadius(10)
    }
}

struct WeatherButtonPreview: PreviewProvider{
    static var previews: some View{
        WeatherButton(buttonLabel: "Testing",
                      buttonColor: .gray,
                      labelColor: .white)
    }
}
//#Preview {
//    WeatherButton(buttonLabel: "Testing", buttonColor: .gray, labelColor: .white)
//}
