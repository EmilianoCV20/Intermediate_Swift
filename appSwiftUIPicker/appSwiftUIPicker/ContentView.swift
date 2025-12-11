//
//  ContentView.swift
//  appSwiftUIPicker
//
//  Created by Emiliano Cepeda on 29/11/24.
//

import SwiftUI

struct ContentView: View {
    @State private var seleccionaColor: Color = Color.red
    
    var body: some View {
        VStack {
            
            VStack(spacing: 20) {
                ColorPicker("Selecciona un color", selection: $seleccionaColor)
                Rectangle()
                    .fill(seleccionaColor)
                    .frame(width: 200, height: 200)
                    .border(Color.black, width: 5)
            }
            
            
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
