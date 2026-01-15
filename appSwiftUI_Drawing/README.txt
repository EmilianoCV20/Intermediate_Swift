----------------------------------------------------
1. Overview
----------------------------------------------------
appSwiftUI_Drawing es una aplicación demostrativa en SwiftUI cuyo objetivo es practicar dibujo vectorial, composición de vistas y animaciones sencillas. La aplicación construye una figura (un animal estilizado) combinando formas básicas y `Shape` personalizados, y anima componentes (orejas y cola) usando animaciones implícitas repetidas.

La app está pensada como un laboratorio creativo para:
- Crear `Shape` personalizados (Triangle, ColaGato, BocaGato).  
- Componer vistas reutilizables con `ZStack`, `HStack` y `VStack`.  
- Aplicar transformaciones (`rotationEffect`, `offset`) y estilos.  
- Animar propiedades de estado con `withAnimation(...).repeatForever(...)`.

----------------------------------------------------
2. Estructura de Archivos
----------------------------------------------------

/appSwiftUI_DrawingApp.swift  
    Punto de entrada marcado con `@main`. Define la escena principal y carga `ContentView` dentro de un `WindowGroup`.

/ContentView.swift  
    Implementación completa de la UI y lógica ligera:
    - Estados:
        • `@State private var earRotation = -5.0` — controla la rotación de las orejas.  
        • `@State private var tailOffsetY: CGFloat = 10` — controla desplazamiento vertical de la cola.
    - Funcionalidad principal:
        • Construye la figura combinando formas: `Ellipse`, `Rectangle`, `Circle`, `Ellipse` (ojos), `Triangle`, `ColaGato`, `BocaGato`.  
        • Agrupa elementos con `ZStack` para componer cuerpo, cabeza, patas, cola, ojos, nariz y boca.  
        • Aplica animación en `onAppear` que actualiza `earRotation` y `tailOffsetY` con `repeatForever(autoreverses: true)`.  
    - `Shape` personalizados definidos en el mismo archivo:
        • `Triangle` — triángulo básico (se usa para orejas y nariz).  
        • `ColaGato` — curva cuadrática para la cola (usa `addQuadCurve`).  
        • `BocaGato` — caminos con `addQuadCurve` para trazar la boca.

----------------------------------------------------
3. Funcionalidad Clave
----------------------------------------------------
• **Composición de la figura**  
  – Uso de formas básicas (Circle, Ellipse, Rectangle) y overlays para crear patas y dedos.  
  – Organización mediante `ZStack` y offsets para posicionamiento relativo.

• **Shapes personalizados**  
  – `Triangle`, `ColaGato` y `BocaGato` implementan `Shape` y definen `path(in:)` con `Path`, proporcionando trazados vectoriales reutilizables.

• **Animación declarativa**  
  – `onAppear` con `withAnimation(.easeInOut.repeatForever(autoreverses: true))` anima `earRotation` y `tailOffsetY`, provocando movimiento continuo de orejas y cola.  
  – Uso de `rotationEffect` y `offset` para animar las sub-vistas.

• **Diseño visual y layout**  
  – Tamaños fijos de marco por conveniencia (`.frame(width: 300, height: 600)`) y fondo semitransparente para destacar la figura.  
  – Composición modular que facilita ajustar proporciones mediante parámetros o extraer componentes.

----------------------------------------------------
4. Requerimientos
----------------------------------------------------
• Xcode (versión reciente; Xcode 14/15 recomendado)  
• iOS 14 o superior (mejor iOS 15+) para compatibilidad SwiftUI moderna  
• No requiere assets externos ni imágenes en el Asset Catalog  
• Recomendado: usar Canvas/Previews de Xcode para ver la animación en tiempo real

====================================================
