//
//  ContentView.swift
//  traficLightApp
//
//  Created by Robert Miller on 08.09.2021.
//

import SwiftUI


struct ContentView: View {
    @State private var buttonTitle = "Start"
    
    @State private var redLight = false
    @State private var yellowLight = false
    @State private var greenLight = false
    
    var body: some View {
        ZStack {
            Color.black
            .ignoresSafeArea()
            VStack {
                LightCircle(color: .red, isOn: redLight)
                LightCircle(color: .orange, isOn: yellowLight)
                LightCircle(color: .green, isOn: greenLight)
                Spacer()
                SwitchColorButton(title: buttonTitle, action: switching)
            }
        }
    }
    
    private func switching(){
        buttonTitle = "Next"
        if !redLight && !yellowLight {
            greenLight = false
            redLight = true
        } else if !yellowLight {
            redLight = false
            yellowLight = true
        } else {
            yellowLight = false
            greenLight = true
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
