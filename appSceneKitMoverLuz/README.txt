====================================================
appSceneKitMoverLuz – Swift (UIKit)
====================================================

Autor: Emiliano Cepeda  
Creado: 15/11/24  
Plataforma: iOS  
Lenguaje: Swift (UIKit)  

----------------------------------------------------
1. Overview
----------------------------------------------------
appSceneKitMoverLuz es una aplicación para iOS desarrollada en Swift (UIKit) que demuestra el uso de SceneKit para renderizar una escena 3D simple y controlar dinámicamente una fuente de luz y la cámara mediante controles de interfaz (sliders y segmented controls). El usuario puede mover la luz en los ejes X/Y/Z, cambiar el tipo de luz, seleccionar distintas geometrías (cubo, esfera, cilindro, pirámide, cono) y ajustar la posición de la cámara. La escena se muestra dentro de un `SCNView` que se añade dinámicamente sobre un `UIImageView`.

La app sirve como práctica de:
- Integración de SceneKit en una app UIKit (SCNView + SCNScene).  
- Creación y configuración de nodos: cámara (`SCNCamera`), luz (`SCNLight`) y geometrías (`SCNGeometry`).  
- Control runtime de parámetros de luz y cámara desde la interfaz (UISlider, UISegmentedControl).  
- Uso de constraints de SceneKit (`SCNLookAtConstraint`) y materiales básicos (`SCNMaterial`).  
- Renderizado y composición de elementos 3D sobre la UI existente (añadir SCNView sobre UIImageView).

----------------------------------------------------
2. Estructura de Archivos
----------------------------------------------------

/AppDelegate.swift  
    Implementación estándar del ciclo de vida de la aplicación (UIApplicationDelegate).  

/SceneDelegate.swift  
    Gestión estándar de la escena (UIWindowSceneDelegate) para iOS 13+.

/ViewController.swift  
    Controlador principal con la lógica de SceneKit y las conexiones IB:
    - IBOutlets:
        • imageView1: UIImageView — contenedor visual donde se añade programáticamente el SCNView.  
        • sliderLuzX / sliderLuzY / sliderLuzZ: UISlider — controlan la posición de la luz en X, Y, Z.  
        • labelLuzX / labelLuzY / labelLuzZ: UITextField — muestran el valor actual de cada slider de la luz.  
        • selectorTipoLuz: UISegmentedControl — elige el tipo de luz (spot, ambient, directional, omni, area, probe, IES).  
        • selectorFigura: UISegmentedControl — selecciona la geometría a mostrar (cubo, esfera, cilindro, pirámide, cono).  
        • sliderCamaraX / sliderCamaraY / sliderCamaraZ: UISlider — controlan la posición de la cámara.  
        • labelCamaraX / labelCamaraY / labelCamaraZ: UITextField — muestran valores de la cámara.  
    - IBActions:
        • sliderX(_:), sliderY(_:), sliderZ(_:) — actualizan posición y redibujan la escena cuando cambian sliders de luz.  
        • sliderCamaraX(_:), sliderCamaraY(_:), sliderCamaraZ(_:) — actualizan posición de la cámara.  
        • tipoLuz(_: ) — cambia el tipo de `SCNLight` usado (actualiza la escena).  
        • cambiarFigura(_: ) — cambia la geometría mostrada en la escena.  
    - Método central:
        • dibujaFigura() — crea un `SCNView`, construye una `SCNScene`, configura cámara, luz (según `tipoLuz`), geometría seleccionada, plano de suelo, materiales y añade los nodos a la escena. Se aplica `SCNLookAtConstraint` para que la cámara y la luz apunten a la figura.

----------------------------------------------------
3. Funcionalidad Clave
----------------------------------------------------
• Control de la luz en tiempo real
  - Los sliders modifican `nodoLuz.position` (X/Y/Z) y la escena se reconstruye/actualiza para reflejar la nueva posición.  
  - El segmented control `selectorTipoLuz` permite alternar entre tipos de luz compatibles con SceneKit: `spot`, `ambient`, `directional`, `omni`, `area`, `probe`, `IES` (el código usa `SCNLight.LightType(rawValue:)` con la cadena correspondiente).

• Selección de geometría
  - El usuario puede elegir entre varias geometrías (`SCNBox`, `SCNSphere`, `SCNCylinder`, `SCNPyramid`, `SCNCone`) y la app coloca la geometría seleccionada como nodo central de la escena.

• Cámara dinámica  
  - Los sliders de cámara controlan la posición `SCNNode` de la cámara (`camaraNodo.position`) para observar la geometría desde diferentes ángulos. La cámara puede compartir un `SCNLookAtConstraint` para apuntar siempre a la figura.

• Materiales y sombra
  - La geometría y el plano de fondo usan `SCNMaterial` con `diffuse.contents` para color básico. La luz configura `castsShadow = true` y ángulos si es `spot`.

• Integración UIKit + SceneKit
  - Se crea un `SCNView` dinámicamente y se añade como subview al `UIImageView` (`imageView1.addSubview(sceneView)`), permitiendo mezclar elementos 2D y 3D en la misma pantalla sin storyboard específico para la vista 3D.

----------------------------------------------------
4. Recursos / Assets necesarios
----------------------------------------------------
No se requieren assets gráficos específicos para la escena 3D; la app usa colores sólidos para materiales. Sin embargo, la interfaz utiliza `imageView1` (puede contener una imagen de fondo opcional) y debe estar conectada en Interface Builder.


----------------------------------------------------
5. Requerimientos
----------------------------------------------------
• iOS 13 o superior.  
• Xcode con soporte para Swift 5+.  
• Frameworks: SceneKit (import SceneKit).  
• Storyboard con conexiones a todos los IBOutlets e IBActions listados en `/ViewController.swift`.  
• Permisos/entorno: no requiere permisos especiales (no usa cámara real ni AR).  
