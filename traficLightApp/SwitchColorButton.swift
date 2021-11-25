//
//  SwitchColorButton.swift
//  traficLightApp
//
//  Created by Robert Miller on 10.09.2021.
//

import SwiftUI

struct SwitchColorButton: View {
    let title: String
    let action: () -> ()
    
    var body: some View {
        Button(action: action) {
            Text(title).font(.title)
            .fontWeight(.semibold)
            .foregroundColor(Color.white)
        }
        .frame(width: 150.0, height: 50.0)
        .background(Color.blue)
        .cornerRadius(10)
        .padding()
    }
}

struct SwitchColorButton_Previews: PreviewProvider {
    static var previews: some View {
        SwitchColorButton(title: "Start" , action: {})
    }
}
