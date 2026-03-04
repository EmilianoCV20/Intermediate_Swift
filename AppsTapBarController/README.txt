====================================================
AppsTapBarController – Swift (UIKit)
====================================================

Autor: Emiliano Cepeda  
Creado: 26/11/24  
Plataforma: iOS  
Lenguaje: Swift (UIKit)  

----------------------------------------------------
1. Overview
----------------------------------------------------
AppsTapBarController es una aplicación para iOS desarrollada en Swift (UIKit) que reúne varias utilidades demostrativas dentro de una interfaz basada en Tab Bar. El objetivo del proyecto es practicar la creación de múltiples pantallas (ViewControllers) y su integración en un UITabBarController, además de implementar pequeñas aplicaciones didácticas dentro de cada pestaña: calculadora, operaciones con conjuntos, galería/animaciones de imágenes y un selector (picker) de estados con datos asociados.

La app incluye las siguientes funcionalidades principales:
- Calculadora básica con operaciones aritméticas, factorial y comprobador de primos.  
- Módulo de conjuntos: asignación de conjuntos desde UITextField y operaciones entre conjuntos (unión, intersección, diferencia, diferencia simétrica, subconjunto/superconjunto, producto cartesiano).  
- Visor de fotos con acceso a la galería y varias animaciones aplicadas a la UIImageView.  
- Selector de estados (UIPickerView) que actualiza imagen, población y descripción del estado seleccionado.  
- Integración de todo lo anterior en un Tab Bar para navegar entre módulos.

----------------------------------------------------
2. Estructura de Archivos
----------------------------------------------------

/AppDelegate.swift  
    Implementación estándar de UIApplicationDelegate; no contiene lógica personalizada.

/SceneDelegate.swift  
    Gestión estándar de UIWindowSceneDelegate (iOS 13+) para soporte de escenas.

/Main.storyboard  
    (Implícito) Contiene el UITabBarController y los ViewControllers enlazados a las distintas pestañas. Cada pantalla está asociada a su ViewController correspondiente y a los IBOutlets/IBActions del código.

/ViewController.swift  
    Controlador genérico (pestaña inicial / placeholder).  

/ViewControllerCalculadora.swift  
    Calculadora completa:
    - IBOutlets: pantalla (UITextField), botones numéricos y de operación.  
    - IBActions: entradas numéricas, operaciones (+, -, *, /), factorial, comprobador de primo, limpiar e igual.  
    - Lógica: almacenamiento temporal de operandos (v1, v2) y selección de operación (operacion).

/ViewControllerConjuntos.swift  
    Módulo de conjuntos:
    - IBOutlets: textoConjuntoA, textoConjuntoB, botones de asignación, control segmentado de operaciones, labelResultado/textoResultado.  
    - IBActions: asignar conjuntos desde strings separados por comas, activar operaciones y ejecutar operaciones seleccionadas.  
    - Soporta: unión, intersección, diferencia, diferencia simétrica, verificación de subconjunto/superconjunto, producto cartesiano.

/ViewControllerFotos.swift  
    Galería y animaciones:
    - UIImagePickerController para seleccionar imágenes desde la fototeca.  
    - Varias animaciones aplicadas a imageViewFotos (rotación, escala, traslación, giro, agitación, rebote).  
    - Delegado de selección de imagen y lógica para alternar entre animaciones con un contador.

/ViewControllerPickerView.swift  
    Picker de Estados:
    - IBOutlets: nombreEstado (UITextField), imagenBanderas (UIImageView), poblacion (UILabel), informacion (UILabel).  
    - Datos paralelos: arrays `estados`, `banderasEstados`, `poblacionEstado`, `infoEstado`.  
    - Crear picker como inputView y UIToolbar como inputAccessoryView (botón cerrar + “adios”).  
    - Implementa UIPickerViewDelegate/DataSource y `viewForRow` para personalizar filas (UILabel con fuente y color).  
    - Actualiza UI (imagen, textos, colores aleatorios) al seleccionar un estado.

/Extensiones globales/Helpers  
    - Extensiones para CGFloat.random() y UIColor.random() usadas para efectos visuales.

/Assets/Resources  
    - Imágenes para banderas/estados (nombres exactos usados en banderasEstados).  
    - Iconos para las pestañas del Tab Bar (opcional).  
    - Imágenes de ejemplo o placeholders para la galería.

----------------------------------------------------
3. Funcionalidad Clave
----------------------------------------------------
• Navegación mediante Tab Bar  
  - La app organiza módulos en pestañas para cambio rápido entre calculadora, conjuntos, fotos y picker de estados.

• Calculadora completa  
  - Introducción de números por botones, operaciones binarias y funciones extra (factorial, primo).  
  - Manejo básico de errores (ej. división por cero puede mostrar "Error" si se adapta).

• Operaciones con conjuntos  
  - Entrada de conjuntos como cadenas separadas por comas, conversión a Set y ejecución de operaciones matemáticas de conjuntos.  
  - Resultado mostrado en un UILabel con formato legible.

• Galería y animaciones  
  - Selección de imagen desde Photo Library (UIImagePickerController).  
  - Seis animaciones distintas aplicadas secuencialmente al seleccionar imágenes.

• Picker de Estados  
  - UITextField que invoca un UIPickerView personalizado (viewForRow).  
  - Datos paralelos (nombre, imagen, población y descripción) actualizados de forma sincrónica.  
  - Toolbar sobre el teclado con acción para cerrar y otra acción que suspende la app (adios).

----------------------------------------------------
4. Recursos / Assets necesarios
----------------------------------------------------
Incluye en el Asset Catalog / Bundle:
- Imágenes de estados con los nombres listados en `banderasEstados`.  
- Iconos para pestañas del Tab Bar (recomendado: 4 íconos claros y coherentes).  
- Permisos y configuraciones: agregar `NSPhotoLibraryUsageDescription` en Info.plist para acceso a fotos.

----------------------------------------------------
5. Requerimientos
----------------------------------------------------
• iOS 13 o superior (SceneDelegate y soporte de escenas).  
• Xcode 11+ con soporte para Swift 5+.  
• Storyboard configurado y conectado a todos los IBOutlets/IBActions.  
• Info.plist con `NSPhotoLibraryUsageDescription` para la funcionalidad de fotos.  
• Permisos de ejecución de UI: el app usa APIs públicas de UIKit y PhotoKit (a través de UIImagePickerController).

----------------------------------------------------
