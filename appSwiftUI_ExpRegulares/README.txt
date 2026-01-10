----------------------------------------------------
1. Overview
----------------------------------------------------
appSwiftUI_ExpRegulares es una aplicación desarrollada en SwiftUI destinada a validar entradas de texto usando expresiones regulares. La interfaz permite al usuario introducir y validar:

- Direcciones de **email**.
- Cadenas **hexadecimales** (colores / códigos hex).

La validación se realiza con `String.range(of:options: .regularExpression)` y los resultados se reportan mediante alertas (`Alert`) en la interfaz SwiftUI. El proyecto es un ejemplo práctico para entender cómo integrar lógica de validación (RegEx) con `@State` y el sistema de alertas de SwiftUI.

----------------------------------------------------
2. Estructura de Archivos
----------------------------------------------------

/appSwiftUI_ExpRegularesApp.swift  
    Punto de entrada del proyecto. Define la estructura `App` y carga `ContentView` dentro de un `WindowGroup`. No contiene lógica adicional.

/ContentView.swift  
    Vista principal que contiene:
    - `@State var textFieldInfo` – Texto del campo email.  
    - `@State var textFieldInfo2` – Texto del campo hexadecimal.  
    - Flags `@State` para controlar la presentación de alertas:  
      • `showEmailInvalidAlert`, `showEmailValidAlert`  
      • `showHexInvalidAlert`, `showHexValidAlert`  
    - Patrones RegEx usados:  
      • `regExEmail = "^[A-Za-z0-9.-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}$"`  
      • `regExHexa  = "^[A-Fa-f0-9]{6}|[A-Fa-f0-9]{3}$"`  
    - Componentes UI: `TextField` para entrada, `Button` para validar y `Alert` para notificar resultado.

----------------------------------------------------
3. Funcionalidad Clave
----------------------------------------------------
• **Validación de Email**  
  – Usa `regExEmail` para comprobar formato básico `usuario@dominio.ext`.  
  – Al pulsar “Validar Email” se muestra una alerta indicando si es válido o no.

• **Validación Hexadecimal**  
  – Usa `regExHexa` para validar códigos hex (3 o 6 dígitos hexadecimales).  
  – Al pulsar “Validar Hexadecimal” se muestra una alerta con el resultado.

• **Integración RegEx ↔ SwiftUI**  
  – `String.range(of:options:.regularExpression)` se emplea para comprobar coincidencias.  
  – Estados `@State` controlan la presentación reactiva de alertas.

• **UX simple y directa**  
  – Campos centrados y botones que disparan validaciones puntuales.  
  – Uso de alertas nativas para feedback inmediato.

----------------------------------------------------
4. Requerimientos
----------------------------------------------------
• iOS 14 o superior (compatible con SwiftUI y alertas mostradas vía `isPresented`)  
• Xcode 13/14/15 con soporte SwiftUI  
• No requiere assets ni recursos externos
----------------------------------------------------
