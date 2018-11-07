//
//  ViewController.swift
//  MagicPaper
//
//  Created by Mac Air on 2018/8/23.
//  Copyright © 2018 Yiwen Wang. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    var currentVideoNode = SKVideoNode(fileNamed:"HarryPotter.mp4")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        
        self.navigationController?.setNavigationBarHidden(false, animated: true)

        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARImageTrackingConfiguration()
        if let imageToTrack = ARReferenceImage.referenceImages(inGroupNamed: "NewsPaperImages", bundle: Bundle.main){
            configuration.trackingImages = imageToTrack
            configuration.maximumNumberOfTrackedImages = 1
        }

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }

    // MARK: - ARSCNViewDelegate
    
    func videoPlay(name: String, image: ARImageAnchor, node: SCNNode) -> SCNNode{
        
        currentVideoNode.pause()
        print("pause previous video")
        
        let videoNode = SKVideoNode(fileNamed: name)
        videoNode.play()
        currentVideoNode = videoNode
        print("update current video")
        
        let videoScene = SKScene(size: CGSize(width: 480, height: 360))
        videoNode.position = CGPoint(x:videoScene.size.width/2, y:videoScene.size.height/2)
        videoNode.yScale = -1.0
        videoScene.addChild(videoNode)
        
        let plane = SCNPlane(width: image.referenceImage.physicalSize.width, height: image.referenceImage.physicalSize.height)
        plane.firstMaterial?.diffuse.contents = videoScene
        let planeNode = SCNNode(geometry: plane)
        planeNode.eulerAngles.x = -.pi/2
        node.addChildNode(planeNode)
        
        return node
    }
    

    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        var node =  SCNNode()
        if let imageAnchor = anchor as? ARImageAnchor{
            
            if imageAnchor.referenceImage.name == "HarryPotter"{
                node = videoPlay(name: "HarryPotter.mp4", image: imageAnchor, node: node)
            }
            else if imageAnchor.referenceImage.name == "dumbledore"{
                node = videoPlay(name: "dumbledore.mp4", image: imageAnchor, node: node)
            }
            else if imageAnchor.referenceImage.name == "azkaban"{
                node = videoPlay(name: "azkaban.mp4", image: imageAnchor, node: node)
            }
            else if imageAnchor.referenceImage.name == "sirusblack"{
                node = videoPlay(name: "rap.mp4", image: imageAnchor, node: node)
            }
            else if imageAnchor.referenceImage.name == "harry"{
                node = videoPlay(name: "choosing student.mp4", image: imageAnchor, node: node)
            }
            else if imageAnchor.referenceImage.name == "muggle"{
                node = videoPlay(name: "hogwarts.mp4", image: imageAnchor, node: node)
            }
            else if imageAnchor.referenceImage.name == "london"{
                node = videoPlay(name: "magicstone.mp4", image: imageAnchor, node: node)
            }
            else if imageAnchor.referenceImage.name == "malfoy"{
                node = videoPlay(name: "malfoy.mp4", image: imageAnchor, node: node)
            }
            
        }
        return node
    }
    
}
