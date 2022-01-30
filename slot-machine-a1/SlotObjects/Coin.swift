//
//  Coin.swift
//  slot-machine-a1
//
//  Created by Aishwarya Shrestha on 30/01/2022.
//

import GameplayKit
import SpriteKit

class Coin : GameObject
{
    init()
    {
        super.init(imageString: "coins", initialScale: 0.1)
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
