----------------------------------------------------
1. Overview
----------------------------------------------------
appSwiftUIPicker es una aplicación desarrollada en SwiftUI cuyo propósito es demostrar el uso
del componente **ColorPicker** y el manejo de estado mediante la propiedad `@State`.  
La interfaz permite al usuario seleccionar dinámicamente un color y visualizarlo aplicado
sobre un rectángulo en tiempo real.

Este proyecto funciona como ejemplo introductorio de interacción sencilla en SwiftUI, uso de
bindings y actualización reactiva de la UI.

----------------------------------------------------
2. Estructura de Archivos
----------------------------------------------------

/appSwiftUIPickerApp.swift  
Punto de entrada del proyecto.  
Define la estructura `App` que inicializa la escena principal y muestra `ContentView` dentro
de un `WindowGroup`.  
No contiene lógica adicional.

/ContentView.swift  
Vista principal de la aplicación. Contiene:  
- Variable `@State private var seleccionaColor: Color` para controlar el color actual.  
- Un `ColorPicker` que actualiza el estado.  
- Un `Rectangle` cuyo relleno cambia dinámicamente según la selección del usuario.  
- Layout en `VStack` con espaciado y estilos visuales básicos.  
Incluye sección `#Preview` para visualización inmediata en Xcode.

----------------------------------------------------
3. Funcionalidad Clave
----------------------------------------------------
• **Selector de color dinámico:**  
  – Uso de `ColorPicker` enlazado a un estado local.  
  – Cambio inmediato reflejado en la UI.

• **Manejo de estado con @State:**  
  – `seleccionaColor` almacena el color seleccionado.  
  – La vista se actualiza automáticamente al modificar el estado.

• **Renderizado visual reactivo:**  
  – Un `Rectangle` de 200×200 px muestra el color elegido.  
  – Uso de borde negro para delimitar la figura.

• **Diseño simple con SwiftUI:**  
  – Componentes alineados verticalmente usando `VStack`.  
  – Espaciado entre elementos para una visualización clara.

----------------------------------------------------
4. Requerimientos
----------------------------------------------------
• iOS 14 o superior (requerido para ColorPicker)  
• Xcode con soporte para SwiftUI  
• No requiere imágenes ni recursos adicionales

----------------------------------------------------
