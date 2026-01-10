----------------------------------------------------
1. Overview
----------------------------------------------------
AppSwiftUIDraw es una pequeña aplicación demostrativa en SwiftUI que muestra técnicas de dibujo vectorial y animación usando formas personalizadas. El proyecto define una forma (`Beak`) basada en `Path`, compone una cabeza de ave mediante vistas simples y aplica animaciones continuas para simular el movimiento de apertura y cierre del pico.

El objetivo del proyecto es:
- Practicar la creación de `Shape` personalizados y `Path`.
- Componer vistas reutilizables (funciones que devuelven `some View`).
- Aplicar animaciones implícitas y repetidas con `withAnimation`.
- Experimentar con transformaciones (`rotationEffect`, `offset`) y estilos de trazo.

----------------------------------------------------
2. Estructura de Archivos
----------------------------------------------------

/AppSwiftUIDrawApp.swift  
    Punto de entrada del aplicativo marcado con `@main`. Define la escena principal y carga `ContentView` dentro de un `WindowGroup`. No contiene lógica adicional.

/ContentView.swift  
    Contiene toda la implementación visual y lógica de la demostración:
    - `struct Beak: Shape`  
        • Implementa `func path(in rect: CGRect) -> Path` para dibujar una forma tipo pico usando arco y línea.  
        • Permite parametrizar el ángulo (`angleDegrees`) para controlar la apertura.  
    - `struct ContentView: View`  
        • Estado: `@State private var gapeAngle = Angle.zero` — controla la apertura del pico.  
        • Función `birdHead(diameter:) -> some View` — construye la vista de la cabeza del ave combinando círculos, elipse (ojo) y dos `Beak` para pico superior e inferior.  
        • Uso de modificadores: `.fill`, `.stroke`, `.frame`, `.offset`, `.rotationEffect`.  
        • Animación en `onAppear` con `withAnimation(.easeInOut.repeatForever(autoreverses: true))` que actualiza `gapeAngle` para animar el pico continuamente.  
        • Uso de `ZStack` para composición y `padding`/`background` para presentación.  
    - `#Preview` para previsualizar `ContentView` en Xcode.

----------------------------------------------------
3. Funcionalidad Clave
----------------------------------------------------
• **Shape personalizado (`Beak`)**  
  - Dibuja un arco conectado a una línea cerrada mediante `Path`, parametrizado por `angleDegrees`.  
  - Reutilizable para crear el pico superior e inferior con ángulos positivos y negativos.

• **Composición de vista reutilizable (`birdHead`)**  
  - Construye la cabeza usando `Circle` (relleno y trazo), `Ellipse` para el ojo y dos `Beak` (superior e inferior).  
  - Permite ajustar el tamaño mediante el parámetro `diameter`.

• **Animación continua**  
  - `gapeAngle` se anima con `repeatForever(autoreverses: true)` para simular apertura y cierre del pico.  
  - Transformaciones dinámicas (`rotationEffect`) aplicadas a cada `Beak` en sentido opuesto para lograr el movimiento.

• **Estilización de trazo y relleno**  
  - Uso de `.stroke(style:)` y `.foregroundStyle` para controlar apariencia de líneas.  
  - Uso de `.fill` y `.frame` para controlar forma y proporciones.

----------------------------------------------------
4. Requerimientos
----------------------------------------------------
• Xcode con soporte para SwiftUI (Xcode 14/15 recomendado)  
• iOS 14 o superior para compatibilidad SwiftUI (mejor con iOS 15+)  
• No requiere assets externos ni configuración adicional  
• Recomendado usar Canvas/Previews de Xcode para observar animación en tiempo real

----------------------------------------------------
