//
//  ViewController.swift
//  appSuperGame
//
//  Created by Emiliano on 07/12/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textNumero: UITextField!
    @IBOutlet weak var numVidas: UILabel!
    @IBOutlet weak var labelMensaje: UILabel!
    @IBOutlet weak var puntos: UILabel!
    
    var numRandom = 0
    var vida = 0
    var punto = 0
    
    func inicializar() {
        numRandom = Int.random(in: 0...9)
        textNumero.text = ""
        vida = 3
        numVidas.text = String(vida)
        labelMensaje.text = "Selecciona un Número del 0-9"
        self.view.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
    }
    
    @IBAction func botonPlay(_ sender: UIButton) {
        guard let numeroIngresado = Int(textNumero.text ?? "") else {
            labelMensaje.text = "Introduce un número válido"
            return
        }
        
        if numeroIngresado == numRandom {
            labelMensaje.text = "GANASTE, FELICIDADES"
            punto += 1
            puntos.text = String(punto);
            self.view.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
            mostrarAlertaGanador()
        } else {
            vida -= 1
            numVidas.text = String(vida)
            if vida == 0 {
                labelMensaje.text = "FALLASTE, VUELVE A INTENTARLO"
                self.view.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
                alerta()
            } else {
                labelMensaje.text = "Vuelve a Intentarlo"
                textNumero.text = ""
            }
        }
    }
    
    func alerta() {
        let alerta = UIAlertController(title: "SUPER GAME", message: "INTENTALO OTRA VEZ", preferredStyle: .alert)
        let jugarOtraVez = UIAlertAction(title: "PLAY", style: .default) { _ in
            self.inicializar()
        }
        alerta.addAction(jugarOtraVez)
        self.present(alerta, animated: true, completion: nil)
    }
    
    func mostrarAlertaGanador() {
        let alerta = UIAlertController(title: "SUPER GAME", message: "¡GANASTE! ¿Quieres jugar otra vez?", preferredStyle: .alert)
        let jugarOtraVez = UIAlertAction(title: "PLAY", style: .default) { _ in
            self.inicializar()
        }
        alerta.addAction(jugarOtraVez)
        self.present(alerta, animated: true, completion: nil)
    }
    
    @IBAction func botonRestart(_ sender: UIButton) {
        punto = 0
        puntos.text = "\(punto)"
        inicializar()
    }
    
    @IBAction func botonAdios(_ sender: UIButton) {
        UIControl().sendAction(#selector(NSXPCConnection.suspend), to: UIApplication.shared, for: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        inicializar()
    }
}


