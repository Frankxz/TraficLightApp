//
//  ContentView.swift
//  traficLightApp
//
//  Created by Robert Miller on 08.09.2021.
//

import SwiftUI


struct ContentView: View {
    @State var buttonlabel = "Start"
    
    @State var redLight = false
    @State var yellowLight = false
    @State var greenLight = false
    
    var body: some View {
        ZStack {
            Color.black
            .ignoresSafeArea()
            VStack {
                LightCircle(color: .red, isOn: redLight)
                LightCircle(color: .orange, isOn: yellowLight)
                LightCircle(color: .green, isOn: greenLight)
                
                Spacer()
                
                Button(action: switching, label: getButtonLabel)
                    .frame(width: 150.0, height: 50.0)
                    .background(Color.blue)
                    .clipShape(Capsule())
                    .overlay(Capsule()
                    .stroke(Color.white, lineWidth: 5))
                    .padding()
            }
        }
    }
    
    private func getButtonLabel() -> some View {
        Text(buttonlabel).font(.title)
            .fontWeight(.semibold)
            .foregroundColor(Color.white)
    }
    
    private func switching(){
        buttonlabel = "Next"
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
