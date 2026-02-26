//
//  ViewController.swift
//  appSceneKit1
//
//  Created by Emiliano Cepeda on 14/11/24.
//

import UIKit
import SceneKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //Crear la escena
        let sceneView = SCNView(frame: self.view.frame)
        self.view.addSubview(sceneView)
        let escena = SCNScene()
        sceneView.scene = escena
        
        //Definir Camara
        let camara = SCNCamera()
        let camaraNodo = SCNNode()
        camaraNodo.camera = camara
        
        //Definir Vista
        camaraNodo.position = SCNVector3(x: 3.0, y: 3.0, z: 3.0)
        
        //Definir luz
        let luz = SCNLight()
        luz.type = SCNLight.LightType.omni
        let luzNodo = SCNNode()
        luzNodo.light = luz
        luzNodo.position = SCNVector3(x: 1.0, y: 1.0, z: 1.0)
        
        //Definir cubo
        let cubo = SCNBox(width: 1.0, height: 1.0, length: 1.0, chamferRadius: 0.1)
        cubo.firstMaterial?.diffuse.contents = UIColor.green
        let cuboNodo = SCNNode(geometry: cubo)
        let constraint = SCNLookAtConstraint(target: cuboNodo)
        
        constraint.isGimbalLockEnabled = true
        camaraNodo.constraints = [constraint]
        
        //Agregar los Nodos a la escena
        escena.rootNode.addChildNode(camaraNodo)
        escena.rootNode.addChildNode(luzNodo)
        escena.rootNode.addChildNode(cuboNodo)
        
        
        
    }


}

