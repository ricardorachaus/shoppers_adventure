//
//  MenuBackgroundLayer.swift
//  Shopper's Adventure
//
//  Created by Rachaus on 28/05/17.
//  Copyright © 2017 Rachaus. All rights reserved.
//

import SpriteKit

class MenuBackgroundLayer: SKNode {
    var layers = [SKSpriteNode]()
    
    public init(size: CGSize) {
        super.init()
        createLayers(position: CGPoint(x: (size.width / 2), y: (size.height / 2)))
        adjustLayerSize(size: size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createLayers(position: CGPoint) {
        let background = SKSpriteNode(imageNamed: "background")
        let background1 = SKSpriteNode(imageNamed: "background01")
        let background2 = SKSpriteNode(imageNamed: "background02")
        let background3 = SKSpriteNode(imageNamed: "background03")
        
        background.zPosition = 0
        background1.zPosition = 3
        background2.zPosition = 2
        background3.zPosition = 1
        
        layers.append(contentsOf: [background, background1, background2, background3])
        
        for layer in layers {
            layer.texture?.filteringMode = .nearest
            layer.position = position
            self.addChild(layer)
        }
    }
    
    func adjustLayerSize(size: CGSize) {
        for layer in layers {
            layer.size = size
        }
    }
}
