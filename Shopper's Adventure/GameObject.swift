//
//  GameObject.swift
//  Shopper's Adventure
//
//  Created by Rachaus on 29/05/17.
//  Copyright © 2017 Rachaus. All rights reserved.
//

import SpriteKit

class GameObject: SKSpriteNode {
    public init (position: CGPoint, texture: SKTexture) {
        super.init(texture: texture, color: .clear, size: texture.size())
        self.position = position
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
