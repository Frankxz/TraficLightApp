//
//  LightCircle.swift
//  traficLightApp
//
//  Created by Robert Miller on 08.09.2021.
//

import SwiftUI

struct LightCircle: View {
    var color: Color
    var currentLight = 0.3
    
    var isOn = false
    
    var body: some View {
        Circle()
        .frame(width: 125, height: 125)
        .foregroundColor(color.opacity(currentLight))
        .overlay(Circle()
        .stroke(Color.white, lineWidth: 5))
        .padding()
        
    }
}

struct LightCircle_Previews: PreviewProvider {
    static var previews: some View {
        LightCircle(color: Color.blue)
    }
}
