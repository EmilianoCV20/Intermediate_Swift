----------------------------------------------------
1. Overview
----------------------------------------------------
appSwiftUI_RegExSlider es una aplicación desarrollada en SwiftUI que permite validar entradas de texto mediante expresiones regulares (RegEx). El usuario selecciona el tipo de validación (email, hexadecimal, teléfono, código postal, contraseña) usando un Picker y luego introduce el texto a validar. La aplicación muestra feedback inmediato mediante alertas indicando si la entrada es válida o no.

Este proyecto sirve como ejemplo práctico para:
- Integrar RegEx en la lógica de validación.
- Conectar la lógica de validación con la UI declarativa de SwiftUI.
- Usar `@State` para controlar entrada, selección y presentación de alertas.
- Construir un selector (Picker) que itera sobre un `enum` tipado.

----------------------------------------------------
2. Estructura de Archivos
----------------------------------------------------

/appSwiftUI_RegExSliderApp.swift  
    Punto de entrada del proyecto (`@main`). Define la escena principal y carga `ContentView` dentro de un `WindowGroup`. No contiene lógica adicional.

/ContentView.swift  
    Vista principal que contiene:
    - `@State private var inputText: String` — texto escrito por el usuario.
    - `@State private var selectedValidation: ValidationType` — validación seleccionada en el Picker.
    - Flags `@State` para alertas: `showInvalidAlert`, `showValidAlert`.
    - `Picker` para elegir el tipo de validación (itera `ValidationType.allCases`).
    - `TextField` para entrada del usuario (estilo con borde redondeado).
    - `Button("Validar")` que ejecuta la comprobación y activa la alerta correspondiente.
    - Alertas SwiftUI para mostrar resultado de la validación.

/ValidationType (enum) — definido en el mismo archivo  
    - Casos: email, hex, telefono, codigopostal, contraseña.  
    - Cada caso expone:
      • `rawValue` (texto descriptivo).  
      • `regex: String` — patrón asociado.  
      • `func isValid(_:) -> Bool` — método de conveniencia que comprueba la entrada contra el patrón usando `String.range(of:options:.regularExpression)`.

----------------------------------------------------
3. Funcionalidad Clave
----------------------------------------------------
• **Selector de validación (Picker)**  
  – El Picker permite elegir entre varias validaciones; la selección se enlaza a un `@State`.  
  – Se usa `ForEach(ValidationType.allCases)` para poblar el Picker dinámicamente.

• **Validación con expresiones regulares**  
  – Cada tipo de validación contiene su propio patrón RegEx.  
  – La comprobación se realiza con `text.range(of: pattern, options: .regularExpression) != nil`.

• **Feedback mediante alertas**  
  – Al pulsar “Validar” se presentan alertas nativas que notifican si la entrada es válida o no.  
  – Control limpio de estados (`showValidAlert`, `showInvalidAlert`).

• **Arquitectura simple y reutilizable**  
  – `ValidationType` centraliza patrones y lógica de validación, facilitando la extensión (añadir nuevos patrones).

----------------------------------------------------
4. Requerimientos
----------------------------------------------------
• iOS 14 o superior (SwiftUI y APIs de alertas).  
• Xcode 13/14/15 con soporte para SwiftUI.  
• No requiere recursos gráficos externos.  
• Recomendado probar en Xcode Canvas o simulador para ver interactividad.

----------------------------------------------------
