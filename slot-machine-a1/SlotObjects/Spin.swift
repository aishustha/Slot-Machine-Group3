//
//  Spin.swift
//  slot-machine-a1
//
//  Created by Poojan on 1/23/22.
//


import GameplayKit
import SpriteKit

class Spin : GameObject
{
    init()
    {
        super.init(imageString: "spin", initialScale: 0.2)
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
