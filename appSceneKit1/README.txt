====================================================
appSceneKit1 – Swift (UIKit)
====================================================

Autor: Emiliano Cepeda  
Creado: 14/11/24  
Plataforma: iOS  
Lenguaje: Swift (UIKit)  

----------------------------------------------------
1. Overview
----------------------------------------------------
appSceneKit1 es una aplicación para iOS desarrollada en Swift (UIKit) que demuestra el uso básico de **SceneKit** para crear una escena 3D programáticamente. El proyecto crea una vista `SCNView`, configura una escena (`SCNScene`), añade una cámara, una fuente de luz y un objeto geométrico (un cubo) con material coloreado. Incluye además archivos de escena y un sistema de partículas (MyParticle) para efectos como fuego/partículas.

La app sirve para practicar:
- Creación y configuración de `SCNView` y `SCNScene` desde código.  
- Manejo de nodos (`SCNNode`) con cámaras, luces y geometrías.  
- Uso de constraints (`SCNLookAtConstraint`) para orientar la cámara hacia un nodo.  
- Aplicación de materiales y propiedades visuales en geometrías 3D.  
- Integración de archivos SceneKit (.scn) y particle systems para enriquecer la escena.

----------------------------------------------------
2. Estructura de Archivos
----------------------------------------------------

/AppDelegate.swift  
    Implementación estándar de `UIApplicationDelegate`. No contiene lógica custom adicional.

SceneDelegate.swift  
    Implementación estándar de `UIWindowSceneDelegate` para la gestión de la ventana principal en iOS 13+.

/ViewController.swift  
    Controlador principal que monta la escena SceneKit en `viewDidLoad`:
    - Crea un `SCNView` y lo agrega como subview de la vista principal.  
    - Inicializa una `SCNScene` y la asigna al `sceneView`.  
    - Configura una cámara (`SCNCamera`) y un nodo de cámara con posición 3D.  
    - Configura una luz (`SCNLight`) tipo `.omni` y su nodo con posición 3D.  
    - Crea una geometría `SCNBox` (cubo) con material difuso (verde) y la añade como nodo.  
    - Aplica `SCNLookAtConstraint` para orientar la cámara hacia el cubo (gimbal lock habilitado).  
    - Agrega los nodos al `rootNode` de la escena.

/SceneKit Scene (archivo .scn)  
    Archivo de escena exportado/guardado desde el editor de SceneKit. Puede contener nodos, cámaras, luces y referencias a materiales. Útil para cargar escenas preconstruidas en lugar de crearlas por código.

/MyParticle (sistema de partículas)  
    Archivo que define un `SCNParticleSystem` (por ejemplo efecto de fuego). Puede integrarse en la escena para añadir efectos visuales dinámicos (fuego, humo, chispas).

----------------------------------------------------
3. Funcionalidad Clave
----------------------------------------------------
• Creación programática de la escena  
  - `SCNView` + `SCNScene` montados en `viewDidLoad` sin necesidad de Storyboard.

• Cámara y constraints  
  - Cámara posicionada en (3.0, 3.0, 3.0).  
  - `SCNLookAtConstraint` usado para forzar que la cámara apunte al nodo objetivo (el cubo).

• Iluminación básica  
  - Luz tipo `.omni` posicionada y añadida a la escena para iluminar la geometría.

• Geometría y materiales  
  - `SCNBox` con `diffuse.contents` definido como `UIColor.green`. Materiales pueden reemplazarse por texturas o colores dinámicos.

• Soporte para assets SceneKit  
  - Integración prevista de archivos `.scn` y `SCNParticleSystem` (MyParticle) para enriquecer la escena con modelos y partículas predefinidas.


----------------------------------------------------
4. Requerimientos
----------------------------------------------------
• iOS 11+ (SceneKit está disponible desde versiones anteriores, pero iOS 13+ recomendado para compatibilidad con SceneDelegate y APIs modernas).  
• Xcode 11+ con soporte para Swift 5+.  
• Frameworks: `SceneKit` (import en ViewController).  
• No se requieren permisos especiales.

----------------------------------------------------
