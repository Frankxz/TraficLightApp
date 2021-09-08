//
//  ContentView.swift
//  traficLightApp
//
//  Created by Robert Miller on 08.09.2021.
//

import SwiftUI


struct ContentView: View {
    @State var buttonlabel = "Start"
    
    @State var redLight = LightCircle(color: .red)
    @State var yellowLight = LightCircle(color: .yellow)
    @State var greenLight = LightCircle(color: .green)
    
    private let lightOn = 1.0
    private let lightOff = 0.3
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.black)
                .ignoresSafeArea()
            VStack {
                redLight
                yellowLight
                greenLight
            Spacer()
            
            Button(action: {
                    buttonlabel = "Next"
                if !redLight.isOn && !yellowLight.isOn {
                    greenLight.isOn = false
                    greenLight.currentLight = lightOff
                    redLight.isOn = true
                    redLight.currentLight = lightOn
                } else if !yellowLight.isOn {
                    redLight.isOn = false
                    redLight.currentLight = lightOff
                    yellowLight.isOn = true
                    yellowLight.currentLight = lightOn
                } else {
                    yellowLight.isOn = false
                    yellowLight.currentLight = lightOff
                    greenLight.isOn = true
                    greenLight.currentLight = lightOn
                }
                },
                label: {
                    Text(buttonlabel).font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(Color.white)
                        .frame(width: 150.0, height: 50.0)
                        .background(Color.blue)
                        .clipShape(Capsule())
                        .overlay(Capsule()
                        .stroke(Color.white, lineWidth: 5))
                })
            .padding()
            }.background(Color.black)
             .ignoresSafeArea()
             .padding(.top)
         }
    }
    
}
    
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
