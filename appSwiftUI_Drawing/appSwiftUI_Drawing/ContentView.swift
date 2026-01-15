//
//  ContentView.swift
//  appSwiftUI_Drawing
//
//  Created by Emiliano Cepeda on 07/12/24.
//

import SwiftUI

struct ContentView: View {
    @State private var earRotation = -5.0
    @State private var tailOffsetY: CGFloat = 10

    var body: some View {
        ZStack {
            // Cuerpo
            Ellipse()
                .fill(.black)
                .frame(width: 140, height: 190)
                .offset(y: 30)

            // Cuello
            Rectangle()
                .fill(.black)
                .frame(width: 50, height: 90)
                .offset(y: -100)
            
            // Cola
            ColaGato()
                .stroke(lineWidth: 15)
                .foregroundColor(.black)
                .frame(width: 90, height: 150)
                .offset(x: 40, y: tailOffsetY)

            //Patas
            HStack(spacing: 5) {
                //Pata Delantera 1
                Rectangle()
                    .fill(.black)
                    .frame(width: 30, height: 70)
                    .overlay(
                        HStack(spacing: 1) {
                            Rectangle()
                                .fill(.black)
                                .frame(width: 10, height: 10) // Dedo 1
                            Rectangle()
                                .fill(.black)
                                .frame(width: 10, height: 10) // Dedo 2
                            Rectangle()
                                .fill(.black)
                                .frame(width: 10, height: 10) // Dedo 3
                        }
                        .offset(y: 35)
                    )

                //Pata Delantera 2
                Rectangle()
                    .fill(.black)
                    .frame(width: 30, height: 70)
                    .overlay(
                        HStack(spacing: 1) {
                            Rectangle()
                                .fill(.black)
                                .frame(width: 10, height: 10) // Dedo 1
                            Rectangle()
                                .fill(.black)
                                .frame(width: 10, height: 10) // Dedo 2
                            Rectangle()
                                .fill(.black)
                                .frame(width: 10, height: 10) // Dedo 3
                        }
                        .offset(y: 35)
                    )
            }
            .offset(y: 125)
            
            HStack(spacing: 70) {
                //Pata Trasera 1
                Rectangle()
                    .fill(.black)
                    .frame(width: 30, height: 70)
                    .overlay(
                        HStack(spacing: 1) {
                            Rectangle()
                                .fill(.black)
                                .frame(width: 10, height: 10) // Dedo 1
                            Rectangle()
                                .fill(.black)
                                .frame(width: 10, height: 10) // Dedo 2
                            Rectangle()
                                .fill(.black)
                                .frame(width: 10, height: 10) // Dedo 3
                        }
                        .offset(y: 35)
                    )

                //Pata Trasera 2
                Rectangle()
                    .fill(.black)
                    .frame(width: 30, height: 70)
                    .overlay(
                        HStack(spacing: 1) {
                            Rectangle()
                                .fill(.black)
                                .frame(width: 10, height: 10) // Dedo 1
                            Rectangle()
                                .fill(.black)
                                .frame(width: 10, height: 10) // Dedo 2
                            Rectangle()
                                .fill(.black)
                                .frame(width: 10, height: 10) // Dedo 3
                        }
                        .offset(y: 35)
                    )
            }
            .offset(y: 100)

            // Cabeza
            ZStack {
                Circle()
                    .fill(.black)
                    .frame(width: 150, height: 150)

                // Oreja 1
                Triangle()
                    .fill(.black)
                    .frame(width: 50, height: 60)
                    .rotationEffect(.degrees(earRotation))
                    .offset(x: -50, y: -60)

                // Oreja 2
                Triangle()
                    .fill(.black)
                    .frame(width: 50, height: 60)
                    .rotationEffect(.degrees(-earRotation))
                    .offset(x: 50, y: -60)

                // Ojos
                HStack(spacing: 35) {
                    Ellipse()
                        .fill(.green)
                        .frame(width: 40, height: 40)
                    Ellipse()
                        .fill(.green)
                        .frame(width: 40, height: 40)
                }
                .offset(y: -20)

                // Pupilas
                HStack(spacing: 60) {
                    Ellipse()
                        .fill(.black)
                        .frame(width: 10, height: 35)
                    Ellipse()
                        .fill(.black)
                        .frame(width: 10, height: 35)
                }
                .offset(y: -20)

                // Nariz
                Triangle()
                    .fill(.pink)
                    .frame(width: 20, height: 20)
                    .offset(y: -20)
                    .rotationEffect(.degrees(180))

                // Boca
                BocaGato()
                    .stroke(lineWidth: 2)
                    .foregroundColor(.pink)
                    .frame(width: 80, height: 40)
                    .offset(y: 35)
            }
            .offset(y: -150)
        }
        .frame(width: 300, height: 600)
        .background(Color.blue.opacity(0.5))
        .onAppear {
            withAnimation(.easeInOut.repeatForever(autoreverses: true)) {
                earRotation = 10
                tailOffsetY = 20
            }
        }
    }
}


struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.closeSubpath()
        return path
    }
}

struct ColaGato: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 75, y: 10))
        path.addQuadCurve(
            to: CGPoint(x: rect.midX, y: rect.maxY),
            control: CGPoint(x: rect.midX + rect.width /  cos(.pi / 180), y: rect.midY)
        )
        return path
    }
}

struct BocaGato: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.midX - rect.width / 4, y: rect.midY))
        path.addQuadCurve(
            to: CGPoint(x: rect.midX, y: rect.midY + rect.height / 4),
            control: CGPoint(x: rect.midX - rect.width / 8, y: rect.midY + rect.height / 2)
        )
        path.addQuadCurve(
            to: CGPoint(x: rect.midX + rect.width / 4, y: rect.midY),
            control: CGPoint(x: rect.midX + rect.width / 8, y: rect.midY + rect.height / 2)
        )
        return path
    }
}

#Preview {
    ContentView()
}




