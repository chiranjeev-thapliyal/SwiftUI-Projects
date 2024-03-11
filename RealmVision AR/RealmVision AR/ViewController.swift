//
//  ViewController.swift
//  RealmVision AR
//
//  Created by Chiranjeev Thapliyal on 11/03/24.
//

import UIKit
import SceneKit
import ARKit

/*
    MARK: Create ARWorldConfig
    MARK: Detect a plane
    MARK: Place object on plane
 */

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        
        sceneView.autoenablesDefaultLighting = true
        
        // Create a new scene
        sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints]
        
        // Set the scene to the view
        // sceneView.scene = scene
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()
        
        configuration.planeDetection = .horizontal

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let touchLocation = touch.location(in: sceneView)
            
            let results = sceneView.hitTest(touchLocation, types: .existingPlaneUsingGeometry)
                
            if let hitResult = results.first {
                
                let arModelScene = SCNScene(named: "art.scnassets/Esmeralda.scn")
                
                if let arModelNode = arModelScene?.rootNode.childNode(withName: "scene", recursively: true){
                    arModelNode.position = SCNVector3(x: hitResult.worldTransform.columns.3.x,
                                                      y: hitResult.worldTransform.columns.3.y,
                                                      z: hitResult.worldTransform.columns.3.z)
                    
                    arModelNode.scale = SCNVector3(x: 0.01, y: 0.01, z: 0.01)

                    sceneView.scene.rootNode.addChildNode(arModelNode)
                }
                
            }
        }
    }
    


}
