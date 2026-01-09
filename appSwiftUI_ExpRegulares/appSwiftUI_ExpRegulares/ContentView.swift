//
//  ContentView.swift
//  appSwiftUI_ExpRegulares
//
//  Created by Emiliano Cepeda on 05/12/24.
//

import SwiftUI

struct ContentView: View {
    @State var textFieldInfo = ""
    @State var textFieldInfo2 = ""
    @State private var showEmailInvalidAlert = false
    @State private var showEmailValidAlert = false
    @State private var showHexInvalidAlert = false
    @State private var showHexValidAlert = false

    var regExEmail = "^[A-Za-z0-9.-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}$"
    var regExHexa = "^[A-Fa-f0-9]{6}|[A-Fa-f0-9]{3}$"

    var body: some View {
        VStack {
            TextField("Email: ", text: $textFieldInfo)
                .frame(width: 250, height: 40)
                .multilineTextAlignment(.center)
                .padding()
            Button("Validar Email") {
                if textFieldInfo.range(of: regExEmail, options: .regularExpression) == nil {
                    showEmailInvalidAlert = true
                } else {
                    showEmailValidAlert = true
                }
            }
            .alert("Email NO válido", isPresented: $showEmailInvalidAlert) {
                Button("OK", role: .cancel) {}
            }
            .alert("Email Válido", isPresented: $showEmailValidAlert) {
                Button("OK", role: .cancel) {}
            }

            TextField("Hexadecimal: ", text: $textFieldInfo2)
                .frame(width: 250, height: 40)
                .multilineTextAlignment(.center)
                .padding()
            Button("Validar Hexadecimal") {
                if textFieldInfo2.range(of: regExHexa, options: .regularExpression) == nil {
                    showHexInvalidAlert = true
                } else {
                    showHexValidAlert = true
                }
            }
            .alert("Hexadecimal NO válido", isPresented: $showHexInvalidAlert) {
                Button("OK", role: .cancel) {}
            }
            .alert("Hexadecimal Válido", isPresented: $showHexValidAlert) {
                Button("OK", role: .cancel) {}
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
