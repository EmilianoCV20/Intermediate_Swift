//
//  ContentView.swift
//  appSwiftUI_NavigationViewList
//
//  Created by Emiliano Cepeda on 10/12/24.
//

import SwiftUI

struct emojiFrutas: Identifiable
{
    let id = UUID()
    let emoji : String
    let nombre : String
    let descripcion : String
}

private let listaEmojis : [emojiFrutas] =
[
    emojiFrutas(emoji: "🍊", nombre: "Naranja", descripcion: "La naranja es una fruta cítrica obtenida del naranjo dulce (Citrus × sinensis), del naranjo amargo (Citrus × aurantium) y de naranjos de otras variedades o híbridos, de origen asiático.1​ Es un hesperidio carnoso de cáscara más o menos gruesa y endurecida y su pulpa está formada típicamente por once gajos u hollejos llenos de jugo, el cual contiene mucha vitamina C, flavonoides y aceites esenciales. Se cultiva como un antiguo árbol ornamental y para obtener fragancias de sus frutos."),
    emojiFrutas(emoji: "🍋", nombre: "Limon", descripcion: "El término limón es un nombre común de tres frutas cítricas fragantes y de sabor ácido, utilizadas principalmente en el sector alimentario."),
    emojiFrutas(emoji: "🍉", nombre: "Sandia", descripcion: "Citrullus lanatus, comúnmente llamada melón de agua, sandía, acendría, sindria, patilla, es una especie de la familia Cucurbitaceae. Es originaria de África con una gran presencia y difusión en todo el mundo. Se cultiva de manera extendida por todo el mundo debido a su fruto, el cual es un pepónide de enorme tamaño (el récord entre las frutas fue una de 120 kg)."),
]

struct ContentView: View {
    var body: some View {
        NavigationView {
            List(listaEmojis){
                emojiFruta in NavigationLink(destination: detallesView(emojiFruta: emojiFruta))
                {
                    HStack{
                        emojiCirculoView(emojiFruta: emojiFruta)
                        Text(emojiFruta.nombre).font(.headline)
                    }.padding()
                }
            }
        }.navigationBarTitle("Frutas")
        
    }
}// Fin content view

struct detallesView: View {
    let emojiFruta: emojiFrutas
    var body: some View{
        VStack(alignment: .leading) {
            HStack{
                emojiCirculoView(emojiFruta: emojiFruta).padding()
                Text(emojiFruta.nombre).font(.largeTitle).bold()
                Spacer()
            }
            Text(emojiFruta.descripcion)
                .padding(.top)
            Spacer()
        }
        .padding()
        .navigationBarTitle(Text(emojiFruta.nombre), displayMode: .large)
    }
}

struct emojiCirculoView: View {
    let emojiFruta: emojiFrutas
    var body: some View {
        ZStack{
            Text(emojiFruta.emoji).shadow(radius: 5)
                .font(.largeTitle)
                .frame(width: 65, height: 65)
                .overlay(Circle().stroke(Color.green, lineWidth: 5))
        }
    }
}

#Preview {
    ContentView()
}
