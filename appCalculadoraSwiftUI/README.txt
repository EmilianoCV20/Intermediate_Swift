----------------------------------------------------
1. Overview
----------------------------------------------------
appCalculadoraSwiftUI es una calculadora construida con SwiftUI que combina operaciones aritméticas básicas con funciones matemáticas adicionales (raíz, factorial, exponente, comprobación de primo), manejo de porcentaje y cambio de signo. La interfaz presenta una cuadrícula de botones personalizada y una pantalla superior que muestra el valor actual. El diseño adapta el tamaño de los botones al ancho de pantalla para mantener una experiencia consistente en distintos dispositivos.

El proyecto demuestra:
- Uso de `@State` para controlar la UI reactiva.  
- Composición de la interfaz con `VStack` y `HStack`.  
- Uso de `enum` para representar botones y estilos visuales.  
- Lógica de operaciones con control de errores básicos (división por cero, entradas inválidas).

----------------------------------------------------
2. Estructura de Archivos
----------------------------------------------------

/appCalculadoraSwiftUIApp.swift  
    Archivo `@main` que define la entrada de la aplicación y carga `ContentView` en la escena principal.

ContentView.swift  
    Contiene la vista principal y la lógica del comportamiento de la calculadora, incluye:
    - `enum CalcButton` — representación de cada botón (números, operadores, funciones especiales).  
      • Propiedad `buttonColor` para asignar color según tipo (operador, función, numérico).  
    - `enum Operation` — operaciones aritméticas en curso (`add`, `subtract`, `multiply`, `divide`, `exponent`, `none`).
    - Estados:
      • `@State var runningNumber: Double` — número almacenado cuando se selecciona una operación.  
      • `@State var value: String` — texto mostrado en pantalla (entrada actual / resultado).  
      • `@State var currentOperation: Operation` — operación seleccionada.
    - `let buttons` — matriz de matrices que define la disposición de la cuadrícula de botones.
    - Layout:
      • Grande `ZStack` con fondo negro y `VStack` para contener display y filas de botones.  
      • Cada fila es un `HStack` con botones generados a partir de `buttons`.
    - Utilidades de diseño:
      • `buttonWidth(item:)` — calcula ancho adaptativo, asegura que el botón `0` ocupe doble ancho.  
      • `buttonHeight()` — altura constante para botones cuadráticos.
    - Lógica funcional:
      • `didTap(button:)` — rutina que procesa cada pulsación (operaciones, funciones, entrada numérica), implementa:
          - Operaciones binarias: suma, resta, multiplicación, división, exponente y el cálculo al pulsar `=`.  
          - Funciones: `clear`, `decimal`, `negativo` (cambio de signo), `porcentaje`.  
          - Funciones matemáticas: `factorial` (iterativo usando reduce), `raiz` (sqrt con formato), `primo` (comprobación simple).  
          - Manejo de entrada numérica y concatenación en `value`.
    - `#Preview` para previsualizar `ContentView` en Xcode.

----------------------------------------------------
3. Funcionalidad Clave
----------------------------------------------------
• **Operaciones aritméticas básicas**  
  – Suma, resta, multiplicación y división con control de división por cero.

• **Operaciones avanzadas**  
  – Exponente (pow), raíz cuadrada (sqrt), factorial (reduce sobre rango) y comprobación de primo (búsqueda de divisores).

• **Funciones utilitarias**  
  – Porcentaje (divide entre 100), cambio de signo, punto decimal, borrado completo (CA).

• **Interfaz adaptable**  
  – Botones con tamaños calculados dinámicamente; el botón `0` ocupa el doble de ancho para coincidir con diseño de calculadora clásico.

• **Separación visual por tipo de botón**  
  – Color de fondo distinto para operadores, funciones y dígitos (definido en `CalcButton.buttonColor`).

• **Gestión de estado reactiva**  
  – `@State` mantiene sincronizado el valor mostrado con las interacciones del usuario.

----------------------------------------------------
4. Requerimientos
----------------------------------------------------
• iOS 13 o superior (SwiftUI; se recomienda iOS 14/15+ para compatibilidad más amplia)  
• Xcode 12/13/14/15 con soporte SwiftUI  
• No requiere assets externos  
• Dispositivo o simulador con pantalla táctil para probar la experiencia completa

----------------------------------------------------
5. Posibles Mejoras a Añadir
----------------------------------------------------
• Añadir validaciones más robustas (overflow, entradas inválidas, límites para factorial).  
• Implementar historial de operaciones y posibilidad de deshacer.  
• Mejorar la comprobación de números primos con un algoritmo más eficiente para entradas grandes.  
• Añadir animaciones/feedback táctil al pulsar botones.  

====================================================
