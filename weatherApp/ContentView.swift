//
//  ContentView.swift
//  weatherApp
//
//  Created by siva on 1/7/24.
//

import SwiftUI

struct ContentView: View {
    @State private var isDay = true
    var body: some View {
        ZStack{
            BackgroundView(topColor: isDay ? .blue : .black,
                           botttomColor: isDay ? .lightBlue : .gray)
            VStack{
                CityTextView(cityName: "Cupertino,CA")
                MainCityweather(imageName: isDay ? "cloud.sun.fill" : "moon.stars.fill",
                                temperature: 71)
                .padding(.bottom,60)
                HStack(spacing:22){
                    weatherDayView(dayOfWeek: "TUE",
                                   imageName: "sun.rain.fill",
                                   temperature: 79)
                    weatherDayView(dayOfWeek: "WED",
                                   imageName: "cloud.sun.fill",
                                   temperature: 73)
                    weatherDayView(dayOfWeek: "THU",
                                   imageName: "cloud.rain.fill",
                                   temperature: 69)
                    weatherDayView(dayOfWeek: "FRI",
                                   imageName: "cloud.bolt.rain.fill",
                                   temperature: 65)
                    weatherDayView(dayOfWeek: "SAT",
                                   imageName: "cloud.sun.rain.fill",
                                   temperature: 72)
                }
                
                Spacer()
                Button{
                    isDay.toggle()
                }label: {
                    WeatherButton(buttonLabel: "Change the Mode",
                                  buttonColor: .white,
                                  labelColor: isDay ? .gray : .blue)
                }
                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}

struct weatherDayView: View {
    
    var dayOfWeek : String
    var imageName : String
    var temperature : Int
    var body: some View {
        VStack(spacing:6){
            Text(dayOfWeek)
                .font(.system(size:20))
                .foregroundStyle(.white)
            Image(systemName: imageName)
                .symbolRenderingMode(.multicolor)
                .resizable()
                .aspectRatio(contentMode:.fit)
                .frame(width: 40,height: 40)
            Text("\(temperature)°")
                .font(.system(size: 28,weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    var topColor:Color
    var botttomColor : Color
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [topColor, botttomColor]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}

struct CityTextView :View {
    var cityName:String
    var body: some View {
        Text(cityName)
            .font(.system(size: 32,weight: .medium,design: .serif))
            .foregroundStyle(.white)
            .padding()
    }
}

struct MainCityweather : View {
    var imageName: String
    var temperature :Int
    var body: some View {
        VStack(spacing:6){
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 150,height: 150)
            Text("\(temperature)°")
                .font(.system(size: 60,weight: .medium))
                .foregroundColor(.white)
        }
    }
}

