//
//  ViewControllerFotos.swift
//  AppsTapBarController
//
//  Created by Emiliano Cepeda on 26/11/24.
//

import UIKit

class ViewControllerFotos: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var imageViewFotos: UIImageView!
    
    let imagePicker = UIImagePickerController()
    var animationCounter = 0 // Para alternar entre diferentes animaciones
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self
        // Animación inicial
        self.imageViewFotos.alpha = 0.0
        UIImageView.animate(withDuration: 2) {
            self.imageViewFotos.frame = CGRect(x: 0, y: 0, width: 300, height: 250)
            self.imageViewFotos.center = self.view.center
            self.imageViewFotos.alpha = 1.0
            self.imageViewFotos.layer.cornerRadius = 25
        }
    }
    
    @IBAction func botonSeleccionarFotos(_ sender: UIButton) {
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            imageViewFotos.contentMode = .scaleAspectFill
            imageViewFotos.image = pickedImage
            
            //Animaciones según el contador
            AnimacionN()
        }
        dismiss(animated: true, completion: nil)
    }
    
    func AnimacionN() {
        // Reiniciar cualquier transformación anterior
        imageViewFotos.transform = .identity
        
        switch animationCounter {
        case 0:
            // Rotación
            UIView.animate(withDuration: 1.0) {
                self.imageViewFotos.transform = CGAffineTransform(rotationAngle: .pi / 4)
            }
        case 1:
            // Escala
            UIView.animate(withDuration: 1.0) {
                self.imageViewFotos.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
            }
            
        case 2:
            // Traslación
            UIView.animate(withDuration: 1.0) {
                self.imageViewFotos.transform = CGAffineTransform(translationX: 50, y: -50)
            }
            
        case 3:
            // Giro
            UIView.animate(withDuration: 2.0, animations: {
                self.imageViewFotos.transform = CGAffineTransform(rotationAngle: .pi)
            }) { _ in
                UIView.animate(withDuration: 2.0) {
                    self.imageViewFotos.transform = CGAffineTransform(rotationAngle: .pi * 2)
                }
            }
            
        case 4:
            // Agitar
            UIView.animateKeyframes(withDuration: 1.2, delay: 0, options: [], animations: {
                UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.3) {
                    self.imageViewFotos.transform = CGAffineTransform(translationX: -10, y: 0)
                }
                UIView.addKeyframe(withRelativeStartTime: 0.1, relativeDuration: 0.3) {
                    self.imageViewFotos.transform = CGAffineTransform(translationX: 10, y: 0)
                }
                UIView.addKeyframe(withRelativeStartTime: 0.2, relativeDuration: 0.3) {
                    self.imageViewFotos.transform = CGAffineTransform(translationX: -10, y: 0)
                }
                UIView.addKeyframe(withRelativeStartTime: 0.3, relativeDuration: 0.3) {
                    self.imageViewFotos.transform = CGAffineTransform.identity
                }
            }, completion: nil)
            
        case 5:
            // Rebote
            UIView.animate(withDuration: 0.6, animations: {
                self.imageViewFotos.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
            }) { _ in
                UIView.animate(withDuration: 0.3) {
                    self.imageViewFotos.transform = .identity
                }
            }
            
        default:
            break
        }
        
        //Contador para la animación
        animationCounter = (animationCounter + 1) % 6
    }
}
