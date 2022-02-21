//
//  Help.swift
//  slot-machine-a1
//
//  Created by Aishwarya Shrestha on 20/02/2022.
//

import GameplayKit
import SpriteKit

class Help : GameObject
{
    init()
    {
        super.init(imageString: "faq", initialScale: 0.25)
        Start()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //Initialization
    override func Start()
    {
        //layering top of each other
        zPosition = 2
    }
}
