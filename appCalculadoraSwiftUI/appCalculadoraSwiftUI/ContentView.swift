//
//  ContentView.swift
//  appCalculadoraSwiftUI
//
//  Created by Emiliano Cepeda on 09/12/24.
//

import SwiftUI

enum CalcButton: String {
    case one = "1"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9"
    case zero = "0"
    case suma = "+"
    case resta = "-"
    case multiplicacion = "*"
    case division = "/"
    case igual = "="
    case decimal = "."
    case porcentaje = "%"
    case negativo = "-/+"
    case clear = "CA"

    case primo = "P"
    case raiz = "RAIZ"
    case factorial = "!"
    case exponente = "^"
    
    //case cos
    //case sen
    //case tang
    //case XX

    var buttonColor: Color {
        switch self {
        case .suma, .resta, .multiplicacion, .division, .igual:
            return .teal
        case .clear, .negativo, .porcentaje:
            return Color(.darkGray)
        case .primo, .raiz, .factorial, .exponente:
            return .teal
        //case .cos, .sen, .tan, .XX:
            //return .blue
        default:
            return Color(UIColor(red: 55/255.0, green: 55/255.0, blue: 55/255.0, alpha: 1))
        }
    }
}

enum Operation {
    case add, subtract, multiply, divide, exponent, none
}

struct ContentView: View {

    @State var runningNumber: Double = 0
    @State var value: String = "0"
    @State var currentOperation: Operation = .none

    let buttons: [[CalcButton]] = [
        //[.cos, .sen, .tan, .XX],
        [.primo, .raiz, .factorial, .exponente],
        [.clear, .negativo, .porcentaje, .division],
        [.seven, .eight, .nine, .multiplicacion],
        [.four, .five, .six, .resta],
        [.one, .two, .three, .suma],
        [.zero, .decimal, .igual],
    ]

    var body: some View {

        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            VStack{
                Spacer()
                HStack{
                    Spacer()
                    Text(value)
                        .bold()
                        .font(.system(size: 100))
                        .foregroundColor(.white)
                }
                ForEach(buttons, id:\.self) { row in
                    HStack(spacing: 12){
                        ForEach(row, id:\.self) { item in
                            Button(action:{
                                self.didTap(button: item)
                            }, label: {
                                Text(item.rawValue)
                                    .font(.system(size: 32))
                                    .frame(width: buttonWidth(item: item), height: self.buttonHeight())
                                    .foregroundColor(.white)
                                    .background(item.buttonColor)
                                    .cornerRadius(35)
                            })
                        }
                    }.padding(.bottom, 3)
                }
            }
        }

    }

    //Funcion de utilidad para ajustar equitativamente segun el dispositivo
    func buttonWidth(item: CalcButton) -> CGFloat {
        if item == .zero {
            return ((UIScreen.main.bounds.width - (4*12))/4) * 2
        }
        return ((UIScreen.main.bounds.width - (5*12))/4)
    }

    func buttonHeight() -> CGFloat {
        return ((UIScreen.main.bounds.width - (5*12))/4)
    }

    func didTap(button: CalcButton){
        switch button {
        case .suma, .resta, .multiplicacion, .division, .igual, .exponente:
            if button == .suma {
                self.currentOperation = .add
                self.runningNumber = Double(self.value) ?? 0
            } else if button == .resta {
                self.currentOperation = .subtract
                self.runningNumber = Double(self.value) ?? 0
            } else if button == .multiplicacion {
                self.currentOperation = .multiply
                self.runningNumber = Double(self.value) ?? 0
            } else if button == .division {
                self.currentOperation = .divide
                self.runningNumber = Double(self.value) ?? 0
            } else if button == .exponente {
                self.currentOperation = .exponent
                self.runningNumber = Double(self.value) ?? 0
            } else if button == .igual {
                let runningValue = self.runningNumber
                let currentValue = Double(self.value) ?? 0

                switch self.currentOperation {
                case .add: self.value = "\(runningValue + currentValue)"
                case .subtract: self.value = "\(runningValue - currentValue)"
                case .multiply: self.value = "\(runningValue * currentValue)"
                case .divide: self.value = currentValue != 0 ? "\(runningValue / currentValue)" : "Error"
                case .exponent: self.value = "\(pow(runningValue, currentValue))"
                case .none: break
                }
            }

            if button != .igual {
                self.value = "0"
            }

        case .clear:
            self.value = "0"

        case .decimal:
            if !self.value.contains(".") {
                self.value += "."
            }

        case .negativo:
            if let number = Double(self.value) {
                self.value = "\(-number)"
            }

        case .porcentaje:
            if let number = Double(self.value) {
                self.value = "\(number / 100)"
            }

        case .factorial:
            if let number = Int(self.value), number >= 0 {
                let result = (1...max(1, number)).reduce(1, *)
                self.value = "\(result)"
            } else {
                self.value = "Error"
            }

        case .raiz:
            if let number = Double(self.value), number >= 0 {
                self.value = String(format: "%.3f", sqrt(number))
            } else {
                self.value = "Error"
            }

        case .primo:
            if let number = Int(self.value), number > 1 {
                self.value = (2..<number).allSatisfy { number % $0 != 0 } ? "True" : "False"
            } else {
                self.value = "False"
            }

        default:
            let number = button.rawValue
            if(self.value == "0"){
                value = number
            } else {
                self.value = "\(self.value)\(number)"
            }
        }
    }
} //Fin de la Vista

#Preview {
    ContentView()
}

