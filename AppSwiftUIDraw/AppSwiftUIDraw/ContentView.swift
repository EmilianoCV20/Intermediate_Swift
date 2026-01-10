//
//  ContentView.swift
//  AppSwiftUIDraw
//
//  Created by Martin O Valdes on 06/12/24.
//

import SwiftUI

//Documentar esta app:
//Realizar cambios de acuerdo a su creatividad

struct Beak: Shape {
    let angleDegrees: CGFloat
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.midX, y: rect.midY))
        path.addArc(
            center: CGPoint(x: rect.maxX, y: rect.midY),
            radius: rect.midX,
            startAngle: .degrees(180),
            endAngle: .degrees(180 + angleDegrees),
            clockwise: angleDegrees < 0
        )
        path.addLine(to: CGPoint(x: 0, y: rect.midY))
        path.closeSubpath()
        return path
    }
}

struct ContentView: View {
    @State private var gapeAngle = Angle.zero

        private func birdHead(diameter: CGFloat) -> some View {
            ZStack {
                Circle()
                    .fill(.yellow)

                Circle()
                    .stroke(lineWidth: 5)

                // Eye
                Ellipse()
                    .fill(.black)
                    .frame(width: diameter / 5, height: diameter / 5.55)
                    .offset(x: -diameter / 4.7, y: -diameter / 5.35)
                

                // Upper beak
                Beak(angleDegrees: 20)
                    .stroke(style: .init(lineWidth: 5, lineJoin: .round))
                    .foregroundStyle(.red)
                    .offset(x: -diameter / 2)
                    .rotationEffect(gapeAngle)

                // Lower beak
                Beak(angleDegrees: -20)
                    .stroke(style: .init(lineWidth: 5, lineJoin: .round))
                    .foregroundStyle(.red)
                    .offset(x: -diameter / 2)
                    .rotationEffect(-gapeAngle)
            }
            .frame(width: diameter, height: diameter)
        }
    var body: some View {
        birdHead(diameter: 150)
                    .padding(.leading, 50)
                    .frame(width: 300, height: 300)
                    .background(.orange)
                    .onAppear {
                        withAnimation(.easeInOut.repeatForever(autoreverses: true)) {
                            gapeAngle = .degrees(5)
                        }
                    }
            
    }
}

#Preview {
    ContentView()
}
