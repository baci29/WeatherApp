//
//  ContentView.swift
//  WeatherApp
//
//  Created by Radovan Bačík on 21.05.2024.
//

import SwiftUI

struct ContentView: View {
    
    @State var isDayTime: Bool = true
    
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(
                    colors: [
                        isDayTime ? Color.blue : Color.black,
                        isDayTime ? Color("lightBlue") : Color.gray
                    ]
                ),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 40) {
                Text("London")
                    .font(.system(size: 32))
                    .foregroundColor(.white)
                    .bold()
                
                VStack(spacing: 4) {
                    Image(systemName: isDayTime ? "cloud.sun.fill" : "moon.stars")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 200, height: 200)
                    
                    Text("20°")
                        .font(.system(size: 36))
                        .foregroundColor(.white)
                }
                
                HStack {
                    DayWeatherContainer(dayName: "MON", imageName: "cloud.sun.fill", degreesTemperatures: 23)
                    
                    DayWeatherContainer(dayName: "TUE", imageName: "sun.max.fill", degreesTemperatures: 33)
                    
                    DayWeatherContainer(dayName: "WED", imageName: "wind.snow", degreesTemperatures: 8)
                    
                    DayWeatherContainer(dayName: "THU", imageName: "sunset.fill", degreesTemperatures: 23)
                    
                    DayWeatherContainer(dayName: "FRI", imageName: "snow", degreesTemperatures: 3)
                    
                    DayWeatherContainer(dayName: "SAT", imageName: "cloud.sun.fill", degreesTemperatures: 31)
                }
                
                Spacer()
                
                Button(action: {
                    if isDayTime == true {
                        isDayTime = false
                    } else {
                        isDayTime = true
                    }
                    
                }, label: {
                    Text("Change Day Time")
                        .frame(width: 280, height: 50)
                        .background(.white)
                        .font(.system(size: 20, weight: .bold))
                        .cornerRadius(10)
                })
                
                Spacer()
                
            }
        }
    }
}

#Preview {
    ContentView()
}

struct DayWeatherContainer: View {
    let dayName: String
    let imageName: String
    let degreesTemperatures: Int
    
    var body: some View {
        VStack(spacing: 8) {
            Text(dayName)
                .font(.system(size: 24))
                .foregroundColor(.white)
            
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 20, height: 20)
            
            Text("\(degreesTemperatures)°")
                .font(.system(size: 24))
                .foregroundColor(.white)
        }
    }
}
