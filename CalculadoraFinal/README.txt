====================================================
appCalculadoraFinal – Swift (UIKit)
====================================================

Autor: Emiliano Cepeda  
Creado: 16/11/24  
Plataforma: iOS  
Lenguaje: Swift (UIKit)  

----------------------------------------------------
1. Overview
----------------------------------------------------
CalculadoraFinal es una aplicación para iOS desarrollada en Swift (UIKit) que implementa una calculadora básica con interfaz por botones. Permite ingresar números enteros mediante botones, realizar operaciones aritméticas elementales (suma, resta, multiplicación y división entera) y ejecutar funciones auxiliares: cálculo de factorial y verificación de primalidad para el número mostrado.

El diseño se centra en la práctica de:
- Conexión de IBOutlets / IBActions con Storyboard.  
- Gestión de estado de la calculadora mediante variables simples (`v1`, `v2`, `operacion`).  
- Implementación de operaciones numéricas y funciones matemáticas (factorial, comprobación de primo) en Swift.  
- Interacción usuario → UI mediante `UITextField` y `UIButton`.

----------------------------------------------------
2. Estructura de Archivos
----------------------------------------------------

/AppDelegate.swift  
    Archivo estándar que implementa `UIApplicationDelegate`. Contiene la configuración básica del ciclo de vida de la app.

SceneDelegate.swift  
    Implementación estándar de `UIWindowSceneDelegate` para iOS 13+. Gestiona la ventana principal cuando se usa Storyboard.

ViewController.swift  
    Controlador principal de la interfaz. Contiene:
    - Variables de estado:
        • `var operacion: Int` — entero que identifica la operación pendiente (1=suma, 2=resta, 3=multiplicación, 4=división).  
        • `var v1: String` — primer operando (cadena).  
        • `var v2: String` — segundo operando (cadena).
    - IBOutlets (conectados desde Storyboard):
        • `@IBOutlet weak var pantalla: UITextField!` — campo de texto que muestra la entrada/resultado.  
        • Botones numéricos: `b0` … `b9` (`UIButton`).  
        • Botones de operaciones y utilidades: `bLimpiar`, `bDivicion`, `bMultiplicacion`, `bResta`, `bSuma`, `bFactorial`, `bPrimo`, `bIgual`.
    - IBActions (mapeadas a eventos de botones):
        • `ab0` … `ab9` — concatenan el dígito correspondiente en `pantalla`.  
        • `limpiar(_:)` — resetea `v1`, `v2`, `operacion` y limpia la `pantalla`.  
        • `suma(_:)`, `resta(_:)`, `multiplicacion(_:)`, `divicion(_:)` — guardan `v1` con el valor actual de `pantalla`, establecen `operacion` y limpian `pantalla` para ingresar `v2`.  
        • `factorial(_:)` — calcula el factorial del entero actual mostrado y reemplaza `pantalla` por el resultado. Implementado con `reduce`.  
        • `primo(_:)` — verifica si el entero actual es primo (algoritmo de prueba hasta `sqrt(n)`) y muestra "Sí"/"No".  
        • `igual(_:)` — toma `v2` desde `pantalla`, realiza la operación seleccionada entre `v1` y `v2` (operaciones enteras) y muestra el resultado en `pantalla`.

----------------------------------------------------
3. Funcionalidad Clave
----------------------------------------------------
• Ingreso por botones  
  - Todos los dígitos (0–9) se ingresan mediante botones que concatenan caracteres en `pantalla`.

• Operaciones aritméticas básicas  
  - Suma, resta, multiplicación y división se realizan con enteros (`Int`). La división implementada es división entera (comportamiento según Swift `Int / Int`). No hay manejo explícito de decimales.

• Funciones auxiliares  
  - Factorial: cálculo iterativo/reducido para `n >= 0` usando `(1...max(1,n)).reduce(1, *)`.  
  - Primalidad: verificación por división hasta `sqrt(n)`. Resultado mostrado como "Sí" o "No".

• Estado simple de la calculadora
  - El flujo básico es: ingresar primer número → pulsar operador → ingresar segundo número → pulsar `=` para obtener resultado. El estado se mantiene en `v1`, `v2` y `operacion`.

----------------------------------------------------
4. Requerimientos
----------------------------------------------------
• iOS 13 o superior.  
• Xcode 11+ con soporte para Swift 5.  
• Storyboard con conexiones a los IBOutlets e IBActions mencionados.  
• No se requieren assets ni permisos especiales.

----------------------------------------------------
