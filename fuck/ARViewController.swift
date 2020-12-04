//
//  ARViewController.swift
//  fuck
//
//  Created by vicky on 2020/9/29.
//  Copyright © 2020 Ariel. All rights reserved.
//

import UIKit
import ARKit

class ARViewController: UIViewController {
    
    @IBOutlet weak var sceneView: ARSCNView!
    @IBOutlet weak var label: UILabel!
    let fadeDuration: TimeInterval = 0.3
    let rotateDuration: TimeInterval = 3
    let waitDuration: TimeInterval = 0.5
    
    lazy var fadeAndSpinAction: SCNAction = {
        return .sequence([
            .fadeIn(duration: fadeDuration),
            .rotateBy(x: 0, y: 0, z: CGFloat.pi * 360 / 180, duration: rotateDuration),
            .wait(duration: waitDuration),
            .fadeOut(duration: fadeDuration)
            ])
    }()
    
    lazy var fadeAction: SCNAction = {
        return .sequence([
            .fadeOpacity(by: 0.8, duration: fadeDuration),
            .wait(duration: waitDuration),
            .fadeOut(duration: fadeDuration)
            ])
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        sceneView.delegate = self
        configureLighting()
    }
    
    func configureLighting() {
        sceneView.autoenablesDefaultLighting = true
        sceneView.automaticallyUpdatesLighting = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        resetTrackingConfiguration()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        sceneView.session.pause()
    }
    //detecting
    func resetTrackingConfiguration() {
        guard let referenceImages = ARReferenceImage.referenceImages(inGroupNamed: "AR Resources", bundle: nil) else { return }
        let configuration = ARWorldTrackingConfiguration()
        configuration.detectionImages = referenceImages
        let options: ARSession.RunOptions = [.resetTracking, .removeExistingAnchors]
        sceneView.session.run(configuration, options: options)
        label.text = "Move camera around to detect signboard"
    }
}
//after detect
extension ARViewController: ARSCNViewDelegate {
  
  func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
      DispatchQueue.main.async {
          guard let imageAnchor = anchor as? ARImageAnchor,
              let imageName = imageAnchor.referenceImage.name else { return }
          self.label.text = "\(imageName)"
          let store = self.label.text
          
       // let storyboard = UIStoryboard(name: "Main", bundle: nil)
        //let pagemenu = storyboard.instantiateViewController(withIdentifier: "pagemenu")  as! MenuTableViewController

        //pagemenu.receive1 = store!
        //self.present(pagemenu, animated: true, completion: nil)
        
          if (store?.caseInsensitiveCompare("chicken") == .orderedSame){
              let next=self.storyboard?.instantiateViewController(withIdentifier:"pagemenu")
              self.present(next!, animated: true, completion: nil)
          }
        self.resetTrackingConfiguration()
      }
  }
}
