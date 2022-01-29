//
//  BackgroundImg.swift
//  slot-machine-a1
//
//  Created by Poojan on 1/23/22.
//

import GameplayKit
import SpriteKit

class BackgroundImg : GameObject
{
    init()
    {
        super.init(imageString: "got", initialScale: 2.0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
