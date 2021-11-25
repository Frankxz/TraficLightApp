//
//  LightCircle.swift
//  traficLightApp
//
//  Created by Robert Miller on 08.09.2021.
//

import SwiftUI

struct LightCircle: View {
    let color: Color
    let isOn: Bool
    
    var body: some View {
        Circle()
        .frame(width: 125, height: 125)
        .foregroundColor(color.opacity(isOn ? 1 : 0.3))
        .shadow(color: color, radius: 5)
        .overlay(Circle()
        .stroke(Color.white, lineWidth: 5))
        .padding()
        
    }
}

struct LightCircle_Previews: PreviewProvider {
    static var previews: some View {
        LightCircle(color: Color.blue, isOn: false)
    }
}
