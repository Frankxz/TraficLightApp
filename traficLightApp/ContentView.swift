//
//  ContentView.swift
//  traficLightApp
//
//  Created by Robert Miller on 08.09.2021.
//

import SwiftUI


struct ContentView: View {
    @State var buttonlabel = "Start"
    
    @State  var redLight = LightCircle(color: .red)
    @State  var yellowLight = LightCircle(color: .yellow)
    @State  var greenLight = LightCircle(color: .green)
    
    var body: some View {
        ZStack {
           // Не знал как по другому задать цвет фона надеюсь правильно сделал
            Color.black
            .ignoresSafeArea()
            VStack {
                redLight
                yellowLight
                greenLight
                
                Spacer()
                
                Button(action: switching, label: getButtonLabel)
                    .padding()
            }
        }
    }
    
    private func getButtonLabel() -> some View {
        Text(buttonlabel).font(.title)
            .fontWeight(.semibold)
            .foregroundColor(Color.white)
            .frame(width: 150.0, height: 50.0)
            .background(Color.blue)
            .clipShape(Capsule())
            .overlay(Capsule()
                        .stroke(Color.white, lineWidth: 5))
    }
    
    private func switching(){
        //Пытался тут как то все оптимизировать чтобы упростить код но так и не додумался сделать все нормально
        buttonlabel = "Next"
        
        if !redLight.isOn && !yellowLight.isOn {
            greenLight = toggle(light: greenLight, turnOn: false)
            redLight = toggle(light: redLight, turnOn: true)
        }else if !yellowLight.isOn {
            redLight = toggle(light: redLight, turnOn: false)
            yellowLight = toggle(light: yellowLight, turnOn: true)
        } else {
            yellowLight = toggle(light: yellowLight, turnOn: false)
            greenLight = toggle(light: greenLight, turnOn: true)
        }
    }
    
    private func toggle(light: LightCircle, turnOn: Bool) -> LightCircle {
        var light = light
        let lightOn = 1.0, lightOff = 0.3
        
        if !turnOn {
            light.isOn = false
            light.currentLight = lightOff
        } else {
            light.isOn = true
            light.currentLight = lightOn
        }
        return light
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
