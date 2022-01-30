//
//  Minus.swift
//  slot-machine-a1
//
//  Created by Aishwarya Shrestha on 30/01/2022.
//

import GameplayKit
import SpriteKit

class Minus : GameObject
{
    init()
    {
        super.init(imageString: "minus", initialScale: 0.2)
        Start()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //Initialization
    override func Start()
    {
        //layering top of each other
        zPosition = 1
    }
}
