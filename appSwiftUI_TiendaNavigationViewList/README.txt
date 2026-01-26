----------------------------------------------------
1. Overview
----------------------------------------------------
appSwiftUI_TiendaNavigationViewList es una aplicación de ejemplo desarrollada en SwiftUI que simula un catálogo de tienda con navegación maestro-detalle. Permite recorrer una lista de productos, cada uno con imagen, nombre, descripción, precio y estado de disponibilidad; al seleccionar un producto se navega a una vista detalle que muestra la información ampliada y una imagen representativa.

El objetivo del proyecto es practicar:
- Construcción de listas dinámicas y navegación con `NavigationView` y `NavigationLink`.
- Modelado de datos con tipos que implementan `Identifiable`.
- Composición de vistas reutilizables para elementos de lista y vista detalle.
- Presentación de imágenes locales y formatos adaptativos (`scaledToFill`, `scaledToFit`).

----------------------------------------------------
2. Estructura de Archivos
----------------------------------------------------

/appSwiftUI_TiendaNavigationViewListApp.swift  
    Punto de entrada del proyecto (`@main`). Define la escena principal y carga `ContentView` dentro de un `WindowGroup`. No contiene lógica adicional.

/ContentView.swift  
    Contiene la implementación completa de la UI y modelos:
    - `struct Producto: Identifiable`  
        • Modelo de datos con `id: UUID`, `imagen: String`, `nombre: String`, `descripcion: String`, `precio: Double`, `disponible: Bool`.  
    - `private let listaProductos: [Producto]`  
        • Array estático con instancias de ejemplo que actúa como fuente de datos del catálogo.
    - `struct ContentView: View`  
        • `NavigationView` que contiene una `List` de `listaProductos`.  
        • Cada fila se construye con `NavigationLink(destination: DetallesView(producto:))` y un `HStack` que incluye `ProductoImagenView` y el nombre del producto.  
        • Título de la barra de navegación: "Catalogo de Tienda".
    - `struct DetallesView: View`  
        • Vista detalle que muestra la imagen ampliada, nombre, precio formateado, descripción y estado de disponibilidad (con color verde/rojo).  
        • Configura `navigationBarTitle` en modo inline.
    - `struct ProductoImagenView: View`  
        • Componente reutilizable que presenta la imagen del producto en dos modos: vista de lista (círculo pequeño) y vista detalle (imagen amplia con `RoundedRectangle`).
    - `#Preview` para previsualizar `ContentView` en Xcode.

/Assets.xcassets (requerido)  
    - Imágenes referenciadas por los nombres usados en `listaProductos`:
        • naranja  
        • limon  
        • SwitchOLED  
        • XboxSerieX  
        • Playstation5  
        • Teclados  
        • Funkos

----------------------------------------------------
3. Funcionalidad Clave
----------------------------------------------------
• **Lista navegable (master-detail)**  
  – `NavigationView` + `List` + `NavigationLink` permiten navegar desde la lista de productos hacia la vista detalle de cada elemento.

• **Modelo de datos Identificable**  
  – `Producto` implementa `Identifiable` para simplificar la iteración en `List` y asegurar unicidad.

• **Vista detalle con información ampliada**  
  – La vista detalle muestra imagen grande, nombre, precio con formato, descripción y un indicador de disponibilidad (texto y color).

• **Componente de imagen reutilizable**  
  – `ProductoImagenView` se adapta a `isDetailView` para ofrecer distintas presentaciones (círculo en lista / imagen ampliada en detalle), incluyendo `clipShape`, `shadow` y `overlay` con borde que refleja disponibilidad.

• **Presentación y formato numérico**  
  – Precio mostrado con formato a dos decimales `String(format: "%.2f", producto.precio)`.

----------------------------------------------------
4. Requerimientos
----------------------------------------------------
• iOS 14 o superior (recomendado iOS 15+)  
• Xcode 13/14/15 con soporte para SwiftUI  
• Asset Catalog con las imágenes referenciadas: naranja, limon, SwitchOLED, XboxSerieX, Playstation5, Teclados, Funkos  
• Ejecutar en simulador o dispositivo para validar navegación y escalado de imágenes


----------------------------------------------------
5. Posibles mejoras a agregar
----------------------------------------------------
• Integrar patrón MVVM: separar modelo, vista y ViewModel para facilitar pruebas y escalabilidad.  
• Implementar búsqueda y filtros (por precio, disponibilidad, categoría).  
• Añadir pantalla de carrito y flujo de compra (cantidad, subtotal, impuestos).  

====================================================
