//
//  ContentView.swift
//  appSwiftUI_TiendaNavigationViewList
//
//  Created by Emiliano Cepeda on 10/12/24.
//

import SwiftUI

struct Producto: Identifiable {
    let id = UUID()
    let imagen: String
    let nombre: String
    let descripcion: String
    let precio: Double
    let disponible: Bool
}

private let listaProductos: [Producto] = [
    Producto(imagen: "naranja", nombre: "Naranja", descripcion: "Fruta cítrica rica en vitamina C y antioxidantes.", precio: 20.00, disponible: true),
    Producto(imagen: "limon", nombre: "Limón", descripcion: "Fruta cítrica versátil ideal para bebidas, comidas y salsas.", precio: 15.00, disponible: false),
    Producto(imagen: "SwitchOLED", nombre: "Nintendo Switch OLED", descripcion: "Consola híbrida con pantalla OLED de 7 pulgadas para una experiencia mejorada.", precio: 7999.00, disponible: true),
    Producto(imagen: "XboxSerieX", nombre: "Xbox Series X", descripcion: "Consola de videojuegos de próxima generación con gráficos 4K y almacenamiento SSD.", precio: 13499.00, disponible: true),
    Producto(imagen: "Playstation5", nombre: "PlayStation 5", descripcion: "Consola de videojuegos con tecnología avanzada para gráficos y rendimiento superiores.", precio: 13999.00, disponible: false),
    Producto(imagen: "Teclados", nombre: "Teclados Gamer", descripcion: "Teclados mecánicos RGB diseñados para mejorar el rendimiento en videojuegos.", precio: 1200.00, disponible: true),
    Producto(imagen: "Funkos", nombre: "Funko Pops", descripcion: "Figuras coleccionables de edición limitada basadas en personajes populares.", precio: 350.00, disponible: false),
]


struct ContentView: View {
    var body: some View {
        NavigationView {
            List(listaProductos) { producto in
                NavigationLink(destination: DetallesView(producto: producto)) {
                    HStack {
                        ProductoImagenView(producto: producto, isDetailView: false)
                        Text(producto.nombre).font(.headline)
                    }
                    .padding()
                }
            }
            .navigationBarTitle("Catalogo de Tienda")
        }
    }
}

struct DetallesView: View {
    let producto: Producto

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            ProductoImagenView(producto: producto, isDetailView: true)
                .padding()

            Text(producto.nombre)
                .font(.largeTitle)
                .bold()

            Text("Precio: $\(String(format: "%.2f", producto.precio))")
                .font(.title2)

            Text(producto.descripcion)
                .font(.body)

            Text(producto.disponible ? "Disponible" : "No disponible")
                .font(.headline)
                .foregroundColor(producto.disponible ? .green : .red)

            Spacer()
        }
        .padding()
        .navigationBarTitle(Text(producto.nombre), displayMode: .inline)
    }
}

struct ProductoImagenView: View {
    let producto: Producto
    let isDetailView: Bool

    var body: some View {
        if isDetailView {
            Image(producto.imagen)
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity, maxHeight: 200)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .shadow(radius: 5)
        } else {
            Image(producto.imagen)
                .resizable()
                .scaledToFill()
                .frame(width: 65, height: 65)
                .clipShape(Circle())
                .overlay(Circle().stroke(producto.disponible ? .teal : .red, lineWidth: 5))
                .shadow(radius: 5)
        }
    }
}

#Preview {
    ContentView()
}
