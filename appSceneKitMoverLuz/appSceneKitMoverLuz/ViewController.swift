//
//  ViewController.swift
//  appSceneKitMoverLuz
//
//  Created by Emiliano Cepeda on 15/11/24.
//

import UIKit
import SceneKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView1: UIImageView!
    
    //CONTROL LUZ
    @IBOutlet weak var sliderLuzX: UISlider!
    @IBOutlet weak var sliderLuzY: UISlider!
    @IBOutlet weak var sliderLuzZ: UISlider!
    
    @IBOutlet weak var labelLuzX: UITextField!
    @IBOutlet weak var labelLuzY: UITextField!
    @IBOutlet weak var labelLuzZ: UITextField!
    
    @IBOutlet weak var selectorTipoLuz: UISegmentedControl!
    
    @IBOutlet weak var selectorFigura: UISegmentedControl!
    
    var tipoLuz : String?
    
    //CONTROL CAMARA
    @IBOutlet weak var sliderCamaraX: UISlider!
    @IBOutlet weak var sliderCamaraY: UISlider!
    @IBOutlet weak var sliderCamaraZ: UISlider!
    
    @IBOutlet weak var labelCamaraX: UITextField!
    @IBOutlet weak var labelCamaraY: UITextField!
    @IBOutlet weak var labelCamaraZ: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tipoLuz = "spot"
        dibujaFigura()
    }
    
    @IBAction func sliderX(_ sender: UISlider) {
        sliderLuzX.value = sender.value
        labelLuzX.text = String(sliderLuzX.value)
        dibujaFigura()
    }
    
    @IBAction func sliderY(_ sender: UISlider) {
        sliderLuzY.value = sender.value
        labelLuzY.text = String(sliderLuzY.value)
        dibujaFigura()
    }
    
    @IBAction func sliderZ(_ sender: UISlider) {
        sliderLuzZ.value = sender.value
        labelLuzZ.text = String(sliderLuzZ.value)
        dibujaFigura()
    }
    
    @IBAction func sliderCamaraX(_ sender: UISlider) {
        sliderCamaraX.value = sender.value
        labelCamaraX.text = String(sliderCamaraX.value)
        dibujaFigura()
    }
    
    @IBAction func sliderCamaraY(_ sender: UISlider) {
        sliderCamaraY.value = sender.value
        labelCamaraY.text = String(sliderCamaraY.value)
        dibujaFigura()
    }
    
    @IBAction func sliderCamaraZ(_ sender: UISlider) {
        sliderCamaraZ.value = sender.value
        labelCamaraZ.text = String(sliderCamaraZ.value)
        dibujaFigura()
    }
    
    @IBAction func tipoLuz(_ sender: UISegmentedControl) {
        let indice : Int = selectorTipoLuz.selectedSegmentIndex
        switch indice{
        case 0:tipoLuz = "spot"
            
        case 1:tipoLuz = "ambient"
            
        case 2:tipoLuz = "directional"
            
        case 3: tipoLuz = "omni"
            
        case 4: tipoLuz = "area" // Luz de área
            
        case 5: tipoLuz = "probe" // Luz de reflexión del entorno
            
        case 6: tipoLuz = "IES" // Luz con perfiles de datos reales
            
        default : tipoLuz = "spot"
        }
        
        dibujaFigura()
    }
    
    
    func dibujaFigura()
    {
        let sceneView = SCNView(frame: self.imageView1.frame)
        self.imageView1.addSubview(sceneView)
        
        let scene = SCNScene()
        sceneView.scene = scene
        
        let camara = SCNCamera()
        let camaraNodo = SCNNode()
        camaraNodo.camera = camara
        
        camaraNodo.position = SCNVector3(x: self.sliderCamaraX.value, y: self.sliderCamaraY.value, z: self.sliderCamaraZ.value)
        
        let luz = SCNLight()
        luz.type = SCNLight.LightType(rawValue: tipoLuz!)
        luz.spotInnerAngle = 30.0
        luz.spotOuterAngle = 70.0
        luz.castsShadow = true
        
        let nodoLuz = SCNNode()
        nodoLuz.light = luz
        nodoLuz.position = SCNVector3(x: self.sliderLuzX.value, y: self.sliderLuzY.value, z: self.sliderLuzZ.value)
        
        // Cambiar la figura según la selección
        let indiceFigura = selectorFigura.selectedSegmentIndex
        var geometria: SCNGeometry
        
        switch indiceFigura {
        case 0:
            geometria = SCNBox(width: 1.0, height: 1.0, length: 1.0, chamferRadius: 0.0) // Cubo
        case 1:
            geometria = SCNSphere(radius: 1.0) // Esfera
        case 2:
            geometria = SCNCylinder(radius: 0.5, height: 1.5) // Cilindro
        case 3:
            geometria = SCNPyramid(width: 1.0, height: 1.5, length: 1.0) // Pirámide
        case 4:
            geometria = SCNCone(topRadius: 0.0, bottomRadius: 0.5, height: 1.5) // Cono
        default:
            geometria = SCNBox(width: 1.0, height: 1.0, length: 1.0, chamferRadius: 0.0) // Por defecto: Cubo
        }
        
        let nodoFigura = SCNNode(geometry: geometria)
        let constraint = SCNLookAtConstraint(target: nodoFigura)
        
        constraint.isGimbalLockEnabled = true
        nodoLuz.constraints = [constraint]
        camaraNodo.constraints = [constraint]
        
        // Material y Sombra
        let geometriaPlano = SCNPlane(width: 50.0, height: 50.0)
        let nodoPlano = SCNNode(geometry: geometriaPlano)
        nodoPlano.eulerAngles = SCNVector3(x: GLKMathDegreesToRadians(-90), y: 0.0, z: 0.0)
        nodoPlano.position = SCNVector3(x: 0.0, y: -0.5, z: 0.0)
        
        // Colores
        let colorMaterial = SCNMaterial()
        colorMaterial.diffuse.contents = UIColor.green
        geometriaPlano.materials = [colorMaterial]
        
        let colorFigura = SCNMaterial()
        colorFigura.diffuse.contents = UIColor.blue
        geometria.materials = [colorFigura]
        
        // Agregar nodos
        scene.rootNode.addChildNode(camaraNodo)
        scene.rootNode.addChildNode(nodoLuz)
        scene.rootNode.addChildNode(nodoFigura)
        scene.rootNode.addChildNode(nodoPlano)
    }

    // Acción para el selector de figuras
    @IBAction func cambiarFigura(_ sender: UISegmentedControl) {
        dibujaFigura()
    }



}

