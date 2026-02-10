====================================================
appSuperGame – Swift (UIKit)
====================================================

Autor: Emiliano Cepeda  
Creado: 07/12/24  
Plataforma: iOS  
Lenguaje: Swift (UIKit)

----------------------------------------------------
1. Overview
----------------------------------------------------
appSuperGame es una aplicación simple para iOS escrita en Swift (UIKit) cuyo objetivo es demostrar lógica básica de un juego de adivinanza de números. El jugador debe ingresar un número entre 0 y 9; si acierta gana un punto y se le pregunta si desea jugar otra vez; si falla pierde una vida. El juego controla vidas, puntaje, mensajes informativos y cambia el color de fondo según el estado (inicio, acierto, fallo).

Principales características:
- Generación aleatoria de un número objetivo (0–9).  
- Control de vidas (3 intentos por ronda).  
- Puntaje acumulado por aciertos.  
- Mensajes y alertas (UIAlertController) para comunicar estado y reinicio.  
- Interfaz basada en Storyboard con IBOutlets e IBActions.

----------------------------------------------------
2. Estructura de Archivos
----------------------------------------------------

/AppDelegate.swift  
    - Implementación estándar del `UIApplicationDelegate`. Punto de entrada de la aplicación cuando no se usa `@main` en SceneDelegate-based apps (en este proyecto se incluye de forma estándar).

/SceneDelegate.swift  
    - Implementación estándar del `UIWindowSceneDelegate`. Gestiona el ciclo de la escena en iOS 13+.

/ViewController.swift  
    - Controlador principal (UIViewController) con la lógica del juego. Contiene:
        • IBOutlets:
            - `textNumero: UITextField` — campo donde el usuario escribe su número.  
            - `numVidas: UILabel` — muestra las vidas restantes.  
            - `labelMensaje: UILabel` — mensaje informativo al usuario.  
            - `puntos: UILabel` — muestra el puntaje acumulado.
        • Variables de estado:
            - `numRandom: Int` — número objetivo aleatorio.  
            - `vida: Int` — contador de vidas (inicia en 3).  
            - `punto: Int` — puntaje acumulado.
        • Métodos y acciones:
            - `inicializar()` — inicializa/rehace la ronda (genera número aleatorio, limpia campo, resetea vidas y mensajes).  
            - `botonPlay(_:)` — IBAction: lógica que valida entrada, compara con `numRandom`, actualiza puntaje/vidas y muestra alertas.  
            - `botonRestart(_:)` — IBAction: reinicia puntaje y estado del juego.  
            - `botonAdios(_:)` — IBAction: intenta suspender la app (usa `UIControl().sendAction(#selector(NSXPCConnection.suspend), to: UIApplication.shared, for: nil)`).  
            - `alerta()` y `mostrarAlertaGanador()` — muestran `UIAlertController` con opciones para volver a jugar.

----------------------------------------------------
3. Funcionalidad Clave
----------------------------------------------------
• Inicialización de la ronda: generación aleatoria (0–9) y restablecimiento de UI.  
• Entrada y validación: convertir el texto a entero y comprobar rango/validez.  
• Lógica de juego:
  - Acierto: incrementa `punto`, cambia mensaje y color de fondo; muestra alerta de victoria con opción de volver a jugar.  
  - Fallo: decrementa `vida`, actualiza contador y, si `vida == 0`, muestra alerta de reinicio.  
• Reinicio general: `botonRestart` restablece puntaje y llama a `inicializar()`.  
• Interacción visual: cambio del color de fondo según estado del juego para dar retroalimentación inmediata.

----------------------------------------------------
4. Requerimientos
----------------------------------------------------
• iOS 13 o superior.  
• Xcode con soporte para Swift y Storyboard (recomendado Xcode 12+).  
• Storyboard con conexiones a los IBOutlets e IBActions listados en ViewController.swift:
  - UITextField `textNumero`  
  - UILabel `numVidas`  
  - UILabel `labelMensaje`  
  - UILabel `puntos`  
  - Botones conectados a `botonPlay:`, `botonRestart:` y `botonAdios:`  
