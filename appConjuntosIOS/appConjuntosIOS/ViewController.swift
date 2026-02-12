//
//  ViewController.swift
//  appConjuntosIOS
//
//  Created by Emiliano Cepeda on 11/11/24.
//

import UIKit

class ViewController: UIViewController {
    
    var setA = Set<String>()
    var setB = Set<String>()
    
    @IBOutlet weak var textoConjuntoA: UITextField!
    
    @IBOutlet weak var textoConjuntoB: UITextField!
    
    @IBOutlet weak var labelResultado: UILabel!
    
    @IBOutlet weak var botonAsignarSetA: UIButton!
    
    @IBOutlet weak var botonAsignarSetB: UIButton!
    
    @IBOutlet weak var ControlOperaciones: UISegmentedControl!
    
    @IBOutlet weak var textoResultado: UILabel!
    
    
    @IBAction func textoSetAChanged(_ sender: UITextField) {
        if textoConjuntoA.text!.isEmpty {
            botonAsignarSetA.isEnabled = true
        }
    }
    
    @IBAction func botonAsignarSetA(_ sender: UIButton) {
        if !textoConjuntoA.text!.isEmpty {
            let conjunto:[String]=textoConjuntoA.text!.components(separatedBy: ",")
            setA = Set<String>()
            for valor in conjunto {
                setA.insert(valor)
            }
            textoConjuntoB.isEnabled = true
        }
    }
    
    @IBAction func textoSetBChanged(_ sender: UITextField) {
        if textoConjuntoB.text!.isEmpty {
            botonAsignarSetB.isEnabled = true
        }
    }
    
    @IBAction func botonAsignarSetB(_ sender: UIButton) {
        if !textoConjuntoB.text!.isEmpty {
            let conjunto:[String]=textoConjuntoB.text!.components(separatedBy: ",")
            setB = Set<String>()
            for valor in conjunto {
                setB.insert(valor)
            }
            
            ControlOperaciones.isEnabled = true
        }
    }
    
    @IBAction func SelectorOperaciones(_ sender: UISegmentedControl) {
        
        switch ControlOperaciones.selectedSegmentIndex {
        case 0: // Unión
            let unionAB = setA.union(setB).sorted()
            textoResultado.text = unionAB.joined(separator: ",")
        case 1: // Intersección
            let interseccionAB = setA.intersection(setB).sorted()
            textoResultado.text = interseccionAB.joined(separator: ",")
        case 2: // Diferencia
            let diferenciaAB = setA.subtracting(setB).sorted()
            textoResultado.text = diferenciaAB.joined(separator: ",")
        case 3: // Diferencia Simétrica
            let difSimetricaAB = setA.symmetricDifference(setB).sorted()
            textoResultado.text = difSimetricaAB.joined(separator: ",")
        case 4: // Subconjunto
            let resultado = setA.isSubset(of: setB)
            textoResultado.text = resultado ? "Set A es subconjunto de Set B" : "Set A no es subconjunto de Set B"
        case 5: // Superconjunto
            let resultado = setA.isSuperset(of: setB)
            textoResultado.text = resultado ? "Set A es superconjunto de Set B" : "Set A no es superconjunto de Set B"
        case 6: // Producto Cartesiano
            var producto = [(String, String)]()
            for a in setA {
                for b in setB {
                    producto.append((a, b))
                }
            }
            textoResultado.text = producto.map { "\($0.0),\($0.1)" }.joined(separator: " | ")
        default:
            break
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
}

