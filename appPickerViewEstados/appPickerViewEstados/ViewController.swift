//
//  ViewController.swift
//  appPickerViewEstados
//
//  Created by Emiliano Cepeda on 13/11/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var nombreEstado: UITextField!
    @IBOutlet weak var imagenBanderas: UIImageView!
    @IBOutlet weak var poblacion: UILabel!
    @IBOutlet weak var informacion: UILabel!
    
    
    // Arreglos para los estados de México
    let estados = [
        "🦎Coahuila🦎","🐦Chihuahua🐦","🌵Sonora🌵","🌊Baja California🌊", "🌅Baja California Sur🌅","🌺Jalisco🌺",
        "🎉Ciudad de México🎉","⛱️Quintana Roo⛱️","🌄Zacatecas🌄", "🌾Aguascalientes🌾","🌉Nuevo León🌉",
        "🎋Tamaulipas🎋","🌽Sinaloa🌽","🎸Michoacán🎸","🎭Guanajuato🎭","🎨Querétaro🎨","🌞San Luis Potosí🌞",
        "🌋Colima🌋","🦜Veracruz🦜","🎋Tabasco🎋","🐢Oaxaca🐢","🌿Chiapas🌿","🦜Yucatán🦜","🌅Campeche🌅","🏖️Guerrero🏖️",
        "🐎Durango🐎", "🌄Hidalgo🌄", "🏜️Tlaxcala🏜️", "🎭Puebla🎭","🌊Nayarit🌊","🌄Morelos🌄","🌳Estado de México🌳"
    ]
    
    let banderasEstados = [
        "Coahuila", "Chihuahua", "Sonora", "BajaCalifornia",
        "BajaCaliforniaSur", "Jalisco", "CiudadDeMexico", "QuintanaRoo",
        "Zacatecas", "Aguascalientes", "NuevoLeon", "Tamaulipas",
        "Sinaloa", "Michoacan", "Guanajuato", "Queretaro",
        "SanLuisPotosi", "Colima", "Veracruz", "Tabasco",
        "Oaxaca", "Chiapas", "Yucatan", "Campeche",
        "Guerrero", "Durango", "Hidalgo", "Tlaxcala",
        "Puebla", "Nayarit", "Morelos", "EstadoDeMexico"
    ]
    
    let poblacionEstado = [
        "3,146,771 habitantes", "3,741,869 habitantes", "2,944,840 habitantes", "3,769,020 habitantes",
        "798,447 habitantes", "8,348,151 habitantes", "9,209,944 habitantes", "1,857,985 habitantes",
        "1,622,138 habitantes", "1,425,607 habitantes", "5,784,442 habitantes", "3,527,735 habitantes",
        "3,026,943 habitantes", "4,748,846 habitantes", "6,166,934 habitantes", "2,368,467 habitantes",
        "2,822,255 habitantes", "731,391 habitantes", "8,062,579 habitantes", "2,402,598 habitantes",
        "4,132,148 habitantes", "5,543,828 habitantes", "2,320,898 habitantes", "928,363 habitantes",
        "3,657,048 habitantes", "1,868,996 habitantes", "3,082,841 habitantes", "1,342,977 habitantes",
        "6,583,278 habitantes", "1,288,571 habitantes", "2,044,058 habitantes", "17,363,387 habitantes"
    ]
    
    let infoEstado = [
        "Coahuila es conocido por su producción de vino y el desierto de Cuatrociénegas.",
        "Chihuahua es el estado más grande de México y hogar de la Barranca del Cobre.",
        "Sonora es famoso por su carne asada y sus desiertos vastos y calurosos.",
        "Baja California alberga el famoso Valle de Guadalupe, conocido por sus viñedos.",
        "Baja California Sur es famosa por Los Cabos y sus playas.",
        "Jalisco es el lugar de origen del mariachi y el tequila.",
        "La Ciudad de México es la capital del país, rica en historia y cultura.",
        "Quintana Roo es famoso por sus playas en el Caribe, como Cancún y Tulum.",
        "Zacatecas es famosa por su arquitectura colonial y minas de plata.",
        "Aguascalientes es conocido por la Feria Nacional de San Marcos.",
        "Nuevo León es un importante centro industrial, hogar del Cerro de la Silla.",
        "Tamaulipas es famoso por su producción de cítricos y su puerto en Tampico.",
        "Sinaloa es conocido por su música banda y mariscos frescos.",
        "Michoacán es el hogar de la Mariposa Monarca y el Día de Muertos en Pátzcuaro.",
        "Guanajuato es famoso por su arquitectura colonial y el Festival Cervantino.",
        "Querétaro destaca por su historia y viñedos.",
        "San Luis Potosí es famoso por la Huasteca Potosina y sus cascadas.",
        "Colima es el estado más pequeño y tiene uno de los volcanes más activos.",
        "Veracruz es conocido por su puerto y su música jarocha.",
        "Tabasco es rico en petróleo y hogar de importantes sitios arqueológicos olmecas.",
        "Oaxaca es famoso por su cultura indígena, artesanías y gastronomía.",
        "Chiapas alberga maravillas naturales como el Cañón del Sumidero.",
        "Yucatán es famoso por su cultura maya y la ciudad de Mérida.",
        "Campeche es una ciudad amurallada y patrimonio de la humanidad.",
        "Guerrero es conocido por el puerto de Acapulco y sus playas.",
        "Durango es famoso por su historia de cine del viejo oeste y paisajes desérticos.",
        "Hidalgo es el hogar de los Atlantes de Tula y Prismas Basálticos.",
        "Tlaxcala es el estado más pequeño de México y tiene tradiciones antiguas.",
        "Puebla es famosa por su arquitectura barroca y la gastronomía poblana.",
        "Nayarit es conocido por su cultura indígena y las Islas Marietas.",
        "Morelos tiene clima cálido y es conocido por el Jardín Borda.",
        "El Estado de México es el más poblado y tiene sitios como las pirámides de Teotihuacán."
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
        nombreEstado.inputView = banderasPicker
    }
    
    func crearToolBar(){
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        toolBar.barTintColor = .black
        toolBar.tintColor = .black
        let botonOcultar = UIBarButtonItem(title: "❌", style: .plain, target: self, action: #selector(ViewController.dismissKeyboard))
        
        toolBar.setItems([botonOcultar], animated: true)
        toolBar.isUserInteractionEnabled = true
        
        let botonAdios = UIBarButtonItem(title: "👋🏼", style: .plain, target: self, action: #selector(ViewController.adios))
        
        toolBar.setItems([botonAdios], animated: false)
        toolBar.isUserInteractionEnabled = true
        
        let espacio = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        
        self.toolbarItems = [botonOcultar, espacio, botonAdios]
        
        toolBar.setItems(toolbarItems, animated: false)
        
        nombreEstado.inputAccessoryView = toolBar
        
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
        return estados.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return estados[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        banderaSeleccionada = estados[row]
        
        nombreEstado.backgroundColor = UIColor.random()
        nombreEstado.text = banderaSeleccionada
        informacion.backgroundColor = UIColor.random()
        poblacion.backgroundColor = UIColor.random()
        self.view.backgroundColor = UIColor.random()
        
        let nombreImagen = banderasEstados[row]
        imagenBanderas.image = UIImage(named: nombreImagen)
        
        poblacion.text = poblacionEstado[row]
        
        informacion.text = infoEstado[row]
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
        label.text = estados[row]
        return label
    }
}

