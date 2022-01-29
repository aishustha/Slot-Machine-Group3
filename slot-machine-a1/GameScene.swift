//
//  GameScene.swift
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
import AVFoundation
import SpriteKit
import GameplayKit

let screenSize = UIScreen.main.bounds
var screenWidth: CGFloat?
var screenHeight: CGFloat?


class GameScene: SKScene {
    
    var backgroundImg : BackgroundImg?
    var quit : Quit?
    var spin : Spin?
    
    override func didMove(to view: SKView) {
        screenWidth = frame.width
        screenHeight = frame.height
        name = "SLOT MACHINE"
        
        // Adding background to scene
        backgroundImg = BackgroundImg()
        backgroundImg?.position = CGPoint(x:0,y: -300)
        addChild(backgroundImg!)
        
        // Adding quit button to scene
        quit = Quit()
        quit?.position = CGPoint(x:240,y:-519)
        quit?.zPosition = 1
        //addChild(quit!)
        
        // Adding spin button to scene
        spin = Spin()
        spin?.position = CGPoint(x: 380, y: -1200)
        //addChild(spin!)
        
        
        
        
        
        }
    
    
    func touchDown(atPoint pos : CGPoint) {
       
        
    }
    
    func touchMoved(toPoint pos : CGPoint) {
       
        
    }
    
    func touchUp(atPoint pos : CGPoint) {
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
                
        for t in touches
        {
            self.touchDown(atPoint: t.location(in: self))
            let current_node = atPoint(t.location(in: self))
            if (current_node.name == "quit"){
                exit(0)
            }
            
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        //backgroundImg?.Update()
    }
}
