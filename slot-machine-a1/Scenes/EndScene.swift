//
//  EndScene.swift
//  slot-machine-a1
//
//  Created by Aishwarya Shrestha on 20/02/2022.
//

import SpriteKit
import GameplayKit

class EndScene: SKScene
{
    //instance variables
    var backgroundImg : BackgroundImg?
    
    override func didMove(to view: SKView)
    {
        screenWidth = frame.width
        screenHeight = frame.height
        name = "SLOT MACHINE"
        
        // Adding background to scene
        backgroundImg = BackgroundImg()
        backgroundImg?.position = CGPoint(x: 0,y: 0)
        backgroundImg?.alpha = 0.5
        addChild(backgroundImg!)
    }
    
    
    //cgpoint - have x and y coordinates
    func touchDown(atPoint pos : CGPoint)
    {
        
    }
    
    func touchMoved(toPoint pos : CGPoint)
    {
       
    }
    
    func touchUp(atPoint pos : CGPoint)
    {
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
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
    
    
    override func update(_ currentTime: TimeInterval)
    {
    
    }
}
