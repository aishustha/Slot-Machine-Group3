//
//  Quit.swift
//  slot-machine-a1
//
//  Created by Poojan on 1/23/22.
//

import GameplayKit
import SpriteKit

class Quit : GameObject
{
    init()
    {
        super.init(imageString: "quit", initialScale: 3.0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
