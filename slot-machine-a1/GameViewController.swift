//
//  GameViewController.swift
//  slot-machine-a1
//
//  Students: Aishwarya Shrestha(301138662), Keshav Dulal(301209947), Poojan Patel(301228811)
//  Course: Advanced IOS Development - 724
//  Submission Date: 23/01/2022
//  Exercise Number: A1 - Slot Machine App - Part 1 - Create the app UI
//  Github Repo: https://github.com/aishustha/Slot-Machine-Group3
//  Figma Link: https://www.figma.com/file/Twrlrzgrl6Kvq6w90xJb9f/SlotMachine?node-id=8%3A2
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            if let scene = SKScene(fileNamed: "GameScene") {
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill
                
                // Present the scene
                view.presentScene(scene)
            }
            
            view.ignoresSiblingOrder = true
            
            view.showsFPS = true
            view.showsNodeCount = true
        }
    }

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
