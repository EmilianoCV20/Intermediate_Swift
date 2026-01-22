----------------------------------------------------
1. Overview
----------------------------------------------------
appSwiftUI_NavigationViewList es una aplicación de ejemplo en SwiftUI que demuestra el patrón de navegación maestro-detalle usando `NavigationView`, `List` y `NavigationLink`. El proyecto organiza un conjunto de elementos (frutas representadas por un emoji y metadatos) en una lista navegable; al seleccionar un elemento el usuario accede a una vista detalle con información ampliada.

El objetivo del proyecto es practicar:
- Construcción de listas dinámicas en SwiftUI.  
- Uso de `NavigationView` y `NavigationLink` para navegación jerárquica.  
- Modelado de datos sencillo con `Identifiable`.  
- Composición de vistas reutilizables y presentación de contenido detallado.

----------------------------------------------------
2. Estructura de Archivos
----------------------------------------------------

/appSwiftUI_NavigationViewListApp.swift  
    Punto de entrada marcado con `@main`. Define la escena principal y carga `ContentView` dentro de un `WindowGroup`. No contiene lógica adicional.

/ContentView.swift  
    Contiene la implementación completa de la interfaz y modelos:
    - `struct emojiFrutas: Identifiable`  
        • Modelo de datos con `id: UUID`, `emoji: String`, `nombre: String`, `descripcion: String`.  
        • Implementa `Identifiable` para uso directo en `List`.
    - `private let listaEmojis: [emojiFrutas]`  
        • Array estático de ejemplo que actúa como fuente de datos para la lista.
    - `struct ContentView: View`  
        • Contenedor principal: `NavigationView` que incluye una `List` de `listaEmojis`.  
        • Cada fila está construida con `NavigationLink(destination: detallesView(...))` y un `HStack` compuesto por `emojiCirculoView` y título.
        • Barra de navegación con título "Frutas" (via `navigationBarTitle`).
    - `struct detallesView: View`  
        • Vista de detalle que recibe una instancia `emojiFrutas` y muestra: icono, nombre (título grande) y la descripción completa.  
        • Configura `navigationBarTitle` en modo grande.
    - `struct emojiCirculoView: View`  
        • Vista reutilizable que presenta el icono (emoji) dentro de un marco circular con borde, usada tanto en la lista como en la vista detalle.

----------------------------------------------------
3. Funcionalidad Clave
----------------------------------------------------
• **Lista navegable (master-detail)**  
  – `NavigationView` + `List` + `NavigationLink` permiten navegación hacia una vista de detalle por cada elemento.

• **Modelo de datos Identificable**  
  – `emojiFrutas` implementa `Identifiable` para simplificar la iteración en la `List` y garantizar unicidad de filas.

• **Composición de vistas reutilizables**  
  – `emojiCirculoView` encapsula presentación del icono, favoreciendo la reutilización y separación de responsabilidades.

• **Presentación de contenido detallado**  
  – `detallesView` muestra metadatos (nombre y descripción) con alineación y espaciado adecuados; ideal para extenderse con más campos.

• **Uso de modificadores de navegación**  
  – `navigationBarTitle` y `displayMode` para controlar la presentación del título en la vista detalle.

----------------------------------------------------
4. Requerimientos
----------------------------------------------------
• iOS 14 o superior (compatible con las APIs usadas de SwiftUI; Xcode reciente recomendado)  
• Xcode 12/13/14/15 con soporte para SwiftUI  
• No requiere assets externos ni configuraciones adicionales  
• Recomendado probar en el simulador o Canvas de Xcode para validar navegación y presentación

====================================================
