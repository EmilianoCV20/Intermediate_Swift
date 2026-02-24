//
//  ViewController.swift
//  CalculadoraFinal
//
//  Created by Emiliano Cepeda on 16/11/24.
//

import UIKit

class ViewController: UIViewController {

    var operacion = 0
    var v1 = ""
    var v2 = ""
    
    @IBOutlet weak var pantalla: UITextField!
    
    @IBOutlet weak var b9: UIButton!
    @IBOutlet weak var b8: UIButton!
    @IBOutlet weak var b7: UIButton!
    @IBOutlet weak var b6: UIButton!
    @IBOutlet weak var b5: UIButton!
    @IBOutlet weak var b4: UIButton!
    @IBOutlet weak var b3: UIButton!
    @IBOutlet weak var b2: UIButton!
    @IBOutlet weak var b1: UIButton!
    @IBOutlet weak var b0: UIButton!
    
    @IBOutlet weak var bLimpiar: UIButton!
    @IBOutlet weak var bDivicion: UIButton!
    @IBOutlet weak var bMultiplicacion: UIButton!
    @IBOutlet weak var bResta: UIButton!
    @IBOutlet weak var bSuma: UIButton!
    @IBOutlet weak var bFactorial: UIButton!
    @IBOutlet weak var bPrimo: UIButton!
    @IBOutlet weak var bIgual: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func ab9(_ sender: UIButton) {
        pantalla.text = pantalla.text! + "9"
    }
    
    @IBAction func ab8(_ sender: UIButton) {
        pantalla.text = pantalla.text! + "8"
    }
    
    @IBAction func ab7(_ sender: UIButton) {
        pantalla.text = pantalla.text! + "7"
    }
    
    @IBAction func ab6(_ sender: UIButton) {
        pantalla.text = pantalla.text! + "6"
    }
    
    @IBAction func ab5(_ sender: UIButton) {
        pantalla.text = pantalla.text! + "5"
    }
    
    @IBAction func ab4(_ sender: UIButton) {
        pantalla.text = pantalla.text! + "4"
    }
    
    @IBAction func ab3(_ sender: UIButton) {
        pantalla.text = pantalla.text! + "3"
    }
    
    @IBAction func ab2(_ sender: UIButton) {
        pantalla.text = pantalla.text! + "2"
    }
    
    @IBAction func ab1(_ sender: UIButton) {
        pantalla.text = pantalla.text! + "1"
    }
    
    @IBAction func ab0(_ sender: UIButton) {
        pantalla.text = pantalla.text! + "0"
    }
    
    @IBAction func limpiar(_ sender: UIButton) {
        v1 = ""
        v2 = ""
        operacion = 0
        pantalla.text = ""
    }
    
    @IBAction func divicion(_ sender: UIButton) {
        v1 = pantalla.text!
        operacion = 4
        pantalla.text = ""
    }
    
    @IBAction func multiplicacion(_ sender: UIButton) {
        v1 = pantalla.text!
        operacion = 3
        pantalla.text = ""
    }
    
    @IBAction func resta(_ sender: UIButton) {
        v1 = pantalla.text!
        operacion = 2
        pantalla.text = ""
    }
    
    @IBAction func suma(_ sender: UIButton) {
        v1 = pantalla.text!
        operacion = 1
        pantalla.text = ""
    }
    
    @IBAction func factorial(_ sender: UIButton) {
        guard let texto = pantalla.text, let numero = Int(texto), numero >= 0 else {
            pantalla.text = "Error"
            return
        }
        
        func calcularFactorial(_ n: Int) -> Int {
            return (1...max(1, n)).reduce(1, *)
        }
        
        let resultado = calcularFactorial(numero)
        pantalla.text = String(resultado)
    }
    
    @IBAction func primo(_ sender: UIButton) {
        guard let texto = pantalla.text, let numero = Int(texto), numero > 1 else {
            pantalla.text = "No"
            return
        }
        
        func esPrimo(_ n: Int) -> Bool {
            if n <= 1 { return false }
            for i in 2...Int(sqrt(Double(n))) {
                if n % i == 0 {
                    return false
                }
            }
            return true
        }
        
        let resultado = esPrimo(numero)
        pantalla.text = resultado ? "Sí" : "No"
    }
    
    
    @IBAction func igual(_ sender: UIButton) {
        v2 = pantalla.text!
        switch operacion {
        case 1:
            let valor1 = (Int(v1)!)
            let valor2 = (Int(v2)!)
            let resultado = valor1 + valor2
            pantalla.text = String(resultado)
            break
        case 2:
            let valor1 = (Int(v1)!)
            let valor2 = (Int(v2)!)
            let resultado = valor1 - valor2
            pantalla.text = String(resultado)
            break
        case 3:
            let valor1 = (Int(v1)!)
            let valor2 = (Int(v2)!)
            let resultado = valor1 * valor2
            pantalla.text = String(resultado)
            break
        case 4:
            let valor1 = (Int(v1)!)
            let valor2 = (Int(v2)!)
            let resultado = valor1 / valor2
            pantalla.text = String(resultado)
        default:
        break
        }
    }
    
}



        
