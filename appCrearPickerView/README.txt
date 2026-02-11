====================================================
appCrearPickerView – Swift (UIKit)
====================================================

Autor: Emiliano Cepeda  
Creado: 12/11/24  
Plataforma: iOS  
Lenguaje: Swift (UIKit)  

----------------------------------------------------
1. Overview
----------------------------------------------------
appCrearPickerView es una aplicación para iOS desarrollada en Swift (UIKit) cuyo objetivo es demostrar la creación de un UIPickerView personalizado como inputView de un UITextField, mostrar imágenes asociadas y desplegar información contextual (datos curiosos) para la selección hecha por el usuario.

La aplicación permite:
- Seleccionar un país/entrada desde un UIPickerView integrado como teclado personalizado.  
- Mostrar la bandera correspondiente en un UIImageView.  
- Mostrar un dato curioso asociado en un UILabel.  
- Personalizar la apariencia del texto del picker (fuente, color, centrado).  
- Añadir una barra de herramientas (inputAccessoryView) con botones para ocultar el picker o ejecutar una acción de "adiós".  
- Cambiar colores de fondo de forma aleatoria para elementos seleccionados.

----------------------------------------------------
2. Estructura de Archivos
----------------------------------------------------

/AppDelegate.swift  
    Implementación estándar del `UIApplicationDelegate`. Punto de entrada de la app.

 /SceneDelegate.swift  
    Implementación estándar del `UIWindowSceneDelegate` para iOS 13+. Gestiona la escena principal.

 /ViewController.swift  
    Controlador principal que contiene:
    - IBOutlets:
        • `texto1: UITextField` — campo que muestra la selección y usa el picker como `inputView`.  
        • `imagenBandera: UIImageView` — muestra la imagen de la bandera seleccionada.  
        • `informacion: UILabel` — muestra el dato curioso correspondiente.
    - Arrays de datos:
        • `banderas` — lista de cadenas mostradas en el picker.  
        • `imagenBanderas` — nombres de las imágenes en Assets.xcassets (deben coincidir con assets).  
        • `datosCuriosos` — textos informativos correspondientes por índice.
    - Lógica:
        • `crearPickerView()` — crea y configura `UIPickerView` como `texto1.inputView`.  
        • `crearToolBar()` — construye y asigna `inputAccessoryView` (UIToolbar) con botones.  
        • `dismissKeyboard()` — oculta el teclado/picker.  
        • `adios()` — acción enlazada al botón “adiós” (intenta suspender la app).  
    - Implementa `UIPickerViewDelegate` / `UIPickerViewDataSource` con:
        • `numberOfComponents(in:)`, `pickerView(_:numberOfRowsInComponent:)`, `pickerView(_:titleForRow:forComponent:)`, `pickerView(_:didSelectRow:inComponent:)`, `pickerView(_:viewForRow:forComponent:reusing:)`.

/Extensions (en el mismo archivo ViewController.swift):
    - `CGFloat.random()` — devuelve un CGFloat aleatorio.
    - `UIColor.random()` — devuelve un UIColor aleatorio.

----------------------------------------------------
3. Funcionalidad Clave
----------------------------------------------------
• **Picker como inputView**  
  - El UITextField `texto1` usa un UIPickerView como `inputView`, evitando el teclado estándar y permitiendo selección controlada.

• **Actualización visual por selección**  
  - Al seleccionar una fila en el picker:  
    • Se actualiza `texto1.text` con la entrada seleccionada.  
    • Se cambia el color de fondo de la vista y del UITextField de forma aleatoria.  
    • Se actualiza `imagenBandera.image` con el asset correspondiente.  
    • Se muestra el dato curioso en `informacion`.

• **Presentación personalizada del picker**  
  - `viewForRow` devuelve un UILabel customizado (color naranja, fuente Futura tamaño 24, centrado).

• **Input accessory (toolbar)**  
  - Toolbar con botones para ocultar el picker y ejecutar la acción `adios()`.

----------------------------------------------------
4. Requerimientos
----------------------------------------------------
• iOS 13 o superior.  
• Xcode 12+ (recomendado) con Swift y Storyboard.  
• Storyboard con las conexiones IBOutlets/IBActions en ViewController:  
  - UITextField `texto1`  
  - UIImageView `imagenBandera`  
  - UILabel `informacion`  
• Assets en Assets.xcassets con los nombres listados en `imagenBanderas`:
  - Mexico, Argentina, Canada, Reino Unido, Italy, USA, Australia, Brazil, Spain, France, Alemania, Russia, Ucrania, China, Taiwan
  (Asegurar que cada nombre exista y coincida exactamente.)
• Info.plist: no requiere permisos especiales para esta funcionalidad.
