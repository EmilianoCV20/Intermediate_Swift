====================================================
appPickerViewEstados – Swift (UIKit)
====================================================

Autor: Emiliano Cepeda  
Creado: 13/11/24  
Plataforma: iOS  
Lenguaje: Swift (UIKit)  

----------------------------------------------------
1. Overview
----------------------------------------------------
appPickerViewEstados es una aplicación para iOS desarrollada en Swift (UIKit) diseñada para mostrar información sobre los estados de México mediante un UIPickerView. El usuario selecciona un estado desde un picker personalizado; la aplicación actualiza dinámicamente una imagen representativa del estado, la población y una breve descripción. Incluye además una barra de herramientas sobre el teclado para cerrar el picker o "salir" de la app.

La app sirve como práctica de:
- Uso avanzado de UIPickerView (delegate + datasource + viewForRow).  
- Gestión de arreglos de datos paralelos (nombres, imágenes, población, descripciones).  
- Actualización dinámica de UI (UIImageView, UILabels y colores).  
- Creación de inputAccessoryView (UIToolbar) para UITextField.

----------------------------------------------------
2. Estructura de Archivos
----------------------------------------------------

/AppDelegate.swift  
    Implementación estándar del ciclo de vida de la aplicación (UIApplicationDelegate).

/SceneDelegate.swift  
    Gestión estándar de la escena (UIWindowSceneDelegate) para iOS 13+.

/ViewController.swift  
    Controlador principal. Contiene:
    - IBOutlets:
        • nombreEstado: UITextField — campo que abre el UIPickerView.  
        • imagenBanderas: UIImageView — muestra la imagen del estado.  
        • poblacion: UILabel — muestra la población del estado seleccionado.  
        • informacion: UILabel — muestra una descripción breve del estado.  
    - Arreglos de datos paralelos:
        • estados: [String] — nombres mostrados en el picker (con iconografía en cadena).  
        • banderasEstados: [String] — nombres de imágenes en Assets (para UIImageView).  
        • poblacionEstado: [String] — cadenas con población.  
        • infoEstado: [String] — descripciones cortas por estado.  
    - Métodos principales:
        • crearPickerView() — crea el UIPickerView y lo asigna como inputView de nombreEstado.  
        • crearToolBar() — crea un UIToolbar que actúa como inputAccessoryView con botones de ocultar y "adios".  
        • dismissKeyboard() / adios() — acciones para cerrar o salir (adios hace suspend).  
    - Extensiones:
        • Extensiones para UIColor.random() y CGFloat.random() usadas en efectos visuales.  
    - Conformidad:
        • UIPickerViewDelegate, UIPickerViewDataSource — implementa numberOfComponents, numberOfRows, titleForRow, viewForRow y didSelectRow.

----------------------------------------------------
3. Funcionalidad Clave
----------------------------------------------------
• Selección via UIPickerView:
  - El UITextField `nombreEstado` abre un UIPickerView con una lista de estados.  
  - El picker utiliza `viewForRow` para personalizar la apariencia (UILabel con fuente Futura y color naranja).

• Actualización dinámica de UI:
  - Al seleccionar un estado se actualizan: `imagenBanderas` (imagen desde Assets), `poblacion` y `informacion`.  
  - Se aplican colores aleatorios a algunos elementos (`nombreEstado`, `informacion`, `poblacion`, fondo de la vista) para efecto visual.

• Barra de herramientas sobre teclado: 
  - `UIToolbar` con botón para ocultar el picker y otro botón que ejecuta `adios()` (suspende la app).

• Estructura de datos paralela:
  - Los arrays `estados`, `banderasEstados`, `poblacionEstado` e `infoEstado` están indexados de forma consistente para mapear un estado a su imagen y metadatos.

----------------------------------------------------
4. Recursos / Assets necesarios
----------------------------------------------------
Asegúrate de incluir en el Asset Catalog las siguientes imágenes (nombres exactos usados en `banderasEstados`):
- Coahuila, Chihuahua, Sonora, BajaCalifornia, BajaCaliforniaSur, Jalisco, CiudadDeMexico, QuintanaRoo, Zacatecas, Aguascalientes, NuevoLeon, Tamaulipas, Sinaloa, Michoacan, Guanajuato, Queretaro, SanLuisPotosi, Colima, Veracruz, Tabasco, Oaxaca, Chiapas, Yucatan, Campeche, Guerrero, Durango, Hidalgo, Tlaxcala, Puebla, Nayarit, Morelos, EstadoDeMexico

(Recomendado) incluir la fuente `Futura` o sustituir por una alternativa si no está disponible.

----------------------------------------------------
5. Requerimientos
----------------------------------------------------
• iOS 13 o superior.  
• Xcode con soporte para Swift 5+ y Storyboards.  
• Storyboard con conexiones a los IBOutlets e IBActions definidos en ViewController.swift.  
• Permisos/entorno: no requiere permisos especiales.

----------------------------------------------------
