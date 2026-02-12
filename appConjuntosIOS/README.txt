====================================================
appConjuntosIOS – Swift (UIKit)
====================================================

Autor: Emiliano Cepeda  
Creado: 11/11/24  
Platforma: iOS  
Lenguaje: Swift (UIKit)  

----------------------------------------------------
1. Overview
----------------------------------------------------
appConjuntosIOS es una aplicación para iOS desarrollada en Swift (UIKit) diseñada para practicar operaciones con conjuntos (Set) y mostrar resultados algebraicos entre dos colecciones de elementos ingresadas por el usuario. Permite crear dos conjuntos a partir de texto (elementos separados por comas) y realizar operaciones como unión, intersección, diferencia, diferencia simétrica, comprobación de subconjunto/superconjunto y producto cartesiano.

La interfaz es simple e interactiva: dos UITextField para ingresar los elementos de A y B, botones para asignar cada conjunto y un UISegmentedControl para seleccionar la operación a aplicar. El resultado se muestra en pantalla en un UILabel.

----------------------------------------------------
2. Estructura de Archivos
----------------------------------------------------

/AppDelegate.swift  
    Implementación estándar del ciclo de vida de la aplicación (UIApplicationDelegate).

/SceneDelegate.swift  
    Implementación estándar del ciclo de vida de la escena (UIWindowSceneDelegate) para iOS 13+.

/ViewController.swift  
    Controlador principal que contiene:
    - IBOutlets:
        • textoConjuntoA: UITextField  
        • textoConjuntoB: UITextField  
        • labelResultado: UILabel (uso interno / estado)  
        • botonAsignarSetA: UIButton  
        • botonAsignarSetB: UIButton  
        • ControlOperaciones: UISegmentedControl  
        • textoResultado: UILabel — muestra la representación textual del resultado
    - Propiedades:
        • setA: Set<String>  
        • setB: Set<String>
    - IBActions / métodos:
        • textoSetAChanged(_:), textoSetBChanged(_:) — control de habilitación de botones.  
        • botonAsignarSetA(_:), botonAsignarSetB(_:) — parseo del texto, construcción de Sets.  
        • SelectorOperaciones(_:) — aplica la operación seleccionada y actualiza textoResultado.
    - Operaciones soportadas (mapa por índice del segmented control):
        0 — Unión  
        1 — Intersección  
        2 — Diferencia (A \ B)  
        3 — Diferencia simétrica  
        4 — Subconjunto (isSubset)  
        5 — Superconjunto (isSuperset)  
        6 — Producto cartesiano (representado como pares "a,b" separados por " | ")

----------------------------------------------------
3. Funcionalidad Clave
----------------------------------------------------
• **Creación de conjuntos a partir de texto**  
  - Entrada: cadena con elementos separados por comas.  
  - Salida: Set<String> que elimina duplicados automáticamente.

• **Operaciones de teoría de conjuntos**  
  - Unión, intersección, diferencia, diferencia simétrica.  
  - Comprobación de subconjunto y superconjunto (respuestas textuales).  
  - Producto cartesiano: lista de pares (a,b) formados por todos los pares posibles.

• **Interfaz reactiva**  
  - Botones de asignación habilitan el selector de operaciones al completar ambos conjuntos.  
  - Resultado mostrado en `textoResultado` como cadena legible.

----------------------------------------------------
4. Requerimientos
----------------------------------------------------
• iOS 13 o superior.  
• Xcode (12+) con soporte para Swift y Storyboard.  
• Storyboard con conexiones a los IBOutlets e IBActions listados en ViewController.swift.  
• Teclado y UX básicos (no requiere permisos especiales).

