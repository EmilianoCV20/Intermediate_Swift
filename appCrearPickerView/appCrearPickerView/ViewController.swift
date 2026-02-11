//
//  ViewController.swift
//  appCrearPickerView
//
//  Created by Emiliano Cepeda on 12/11/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var texto1: UITextField!
    @IBOutlet weak var imagenBandera: UIImageView!
    @IBOutlet weak var informacion: UILabel!
    
    
    //Arreglo de banderas
    let banderas = ["🇲🇽Mexico🇲🇽", "🇦🇷Argentina🇦🇷", "🇨🇦Canada🇨🇦", "🇬🇧Reino Unido🇬🇧", "🇮🇹Italy🇮🇹", "🇺🇸USA🇺🇸", "🇦🇺Australia🇦🇺", "🇧🇷Brazil🇧🇷", "🇪🇸Spain🇪🇸", "🇫🇷France🇫🇷", "🇩🇪Alemania🇩🇪", "🇮🇹Italy🇮🇹", "🇷🇺Russia🇷🇺", "🇦🇺Australia🇦🇺", "🇺🇦Ucrania🇺🇦", "🇨🇳China🇨🇳","🇹🇼Taiwan🇹🇼"]
    
    let imagenBanderas = ["Mexico", "Argentina", "Canada", "Reino Unido", "Italy", "USA", "Australia", "Brazil", "Spain", "France", "Alemania", "Italy", "Russia", "Australia", "Ucrania", "China", "Taiwan"]
    
    let datosCuriosos = [
        "México es el país que dio origen al chocolate y el chile.",
        "Argentina es famosa por su tango y su deliciosa carne de res.",
        "Canadá tiene el 10% de los bosques del mundo.",
        "El Reino Unido es hogar de una de las familias reales más famosas.",
        "Italia es el lugar de origen de la pizza y el espresso.",
        "Estados Unidos tiene la economía más grande del mundo.",
        "Australia es hogar de más de 60 especies de canguros.",
        "Brasil tiene el Carnaval más grande y famoso del mundo.",
        "España es conocida por su baile flamenco y su paella.",
        "Francia es el país más visitado del mundo.",
        "Alemania es el país donde se originaron los autos modernos.",
        "Italia es hogar del Coliseo, una de las siete maravillas del mundo.",
        "Rusia es el país más grande del mundo por área.",
        "Australia es también conocida por su Gran Barrera de Coral.",
        "Ucrania es uno de los mayores productores de girasoles del mundo.",
        "China tiene la Gran Muralla, una de las nuevas maravillas del mundo.",
        "Taiwán es conocido por su excelente comida callejera."
    ]
    
    var banderaSeleccionada: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        crearPickerView()
        crearToolBar()
    }
    
    func crearPickerView(){
        let banderasPicker = UIPickerView()
        banderasPicker.delegate = self
        texto1.inputView = banderasPicker
    }
    
    func crearToolBar(){
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        toolBar.barTintColor = .black
        toolBar.tintColor = .black
        let botonOcultar = UIBarButtonItem(title: "🔻", style: .plain, target: self, action: #selector(ViewController.dismissKeyboard))
        
        toolBar.setItems([botonOcultar], animated: true)
        toolBar.isUserInteractionEnabled = true
        
        let botonAdios = UIBarButtonItem(title: "👋🏼", style: .plain, target: self, action: #selector(ViewController.adios))
        
        toolBar.setItems([botonAdios], animated: false)
        toolBar.isUserInteractionEnabled = true
        
        let espacio = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        
        self.toolbarItems = [botonOcultar, espacio, botonAdios]
        
        toolBar.setItems(toolbarItems, animated: false)
        
        texto1.inputAccessoryView = toolBar
        
    }
    
    @objc func dismissKeyboard(){
        view.endEditing(true)
    }
    
    @objc func adios(){
        UIControl().sendAction(#selector(NSXPCConnection.suspend), to: UIApplication.shared, for: nil)
    }


} //Fin View Controller

extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random())/CGFloat(UInt32.max)
    }
}

extension UIColor {
    static func random() -> UIColor {
        return UIColor(red: .random(), green: .random(), blue: .random(), alpha: 1.0)
    }
}

extension ViewController: UIPickerViewDelegate ,UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return banderas.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return banderas[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        banderaSeleccionada = banderas[row]
        
        // Actualizar el texto y los colores aleatorios
        texto1.backgroundColor = UIColor.random()
        texto1.text = banderaSeleccionada
        self.view.backgroundColor = UIColor.random()
        
        // Mostrar la bandera seleccionada en el UIImageView
        let nombreImagen = imagenBanderas[row]
        imagenBandera.image = UIImage(named: nombreImagen)
        
        // Mostrar el dato curioso en el UILabel de información
        informacion.text = datosCuriosos[row]
    }
    
    public func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        var label: UILabel
        if let view = view as? UILabel {
            label = view
        } else {
            label = UILabel()
        }
        label.textColor = UIColor.orange
        label.textAlignment = .center
        label.font = UIFont(name: "Futura", size: 24)
        label.text = banderas[row]
        return label
    }
}
