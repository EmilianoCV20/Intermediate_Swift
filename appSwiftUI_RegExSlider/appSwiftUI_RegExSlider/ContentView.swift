//
//  ContentView.swift
//  appSwiftUI_RegExSlider
//
//  Created by Emiliano Cepeda on 07/12/24.
//

import SwiftUI

struct ContentView: View {
    @State private var inputText = ""
    @State private var selectedValidation = ValidationType.email // Selección inicial
    @State private var showInvalidAlert = false
    @State private var showValidAlert = false

    var body: some View {
        VStack(spacing: 20) {
            Text("Expresiones Regulares")
                .font(.title)
                .padding()
            
            Picker("Selecciona Validación", selection: $selectedValidation) {
                ForEach(ValidationType.allCases) { validation in
                    Text(validation.rawValue.capitalized).tag(validation)
                }
            }
            .padding()
            
            TextField("Escribe el texto", text: $inputText)
                .frame(width: 250, height: 40)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .multilineTextAlignment(.center)
                .padding()
            
            Button("Validar") {
                if selectedValidation.isValid(inputText) {
                    showValidAlert = true
                } else {
                    showInvalidAlert = true
                }
            }
            .alert("Texto Válido", isPresented: $showValidAlert) {
                Button("OK", role: .cancel) {}
            }
            .alert("Texto NO válido", isPresented: $showInvalidAlert) {
                Button("OK", role: .cancel) {}
            }
        }
        .padding()
    }
}

enum ValidationType: String, CaseIterable, Identifiable {
    case email = "📩Email📩"
    case hex = "⬢Hexadecimal⬢"
    case telefono = "📞Telefono📞"
    case codigopostal = "📭Código Postal📭"
    case contraseña = "🔒Contraseña🔒"
    

    var id: String { self.rawValue }

    var regex: String {
        switch self {
        case .email:
            return "^[A-Za-z0-9.-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}$"
        case .hex:
            return "^[A-Fa-f0-9]{6}|[A-Fa-f0-9]{3}$"
        case .telefono:
            return "^\\d{3}-\\d{3}-\\d{4}$"
        case .codigopostal:
            return "^\\d{5}$"
        case .contraseña:
            return "^[A-Z](?=.*[0-9])(?=.*[.#*])[A-Za-z0-9.#*]{9,}$"
        }
    }

    func isValid(_ text: String) -> Bool {
        return text.range(of: self.regex, options: .regularExpression) != nil
    }
}

#Preview {
    ContentView()
}
