//
//  FirstStageBackgroundLayer.swift
//  Shopper's Adventure
//
//  Created by Rachaus on 29/05/17.
//  Copyright © 2017 Rachaus. All rights reserved.
//

import SpriteKit

class FirstStageBackgroundLayer: SKNode {
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
        let background = SKSpriteNode(imageNamed: "Layer_0000_9")
        let background1 = SKSpriteNode(imageNamed: "Layer_0001_8")
        let background2 = SKSpriteNode(imageNamed: "Layer_0002_7")
        let background3 = SKSpriteNode(imageNamed: "Layer_0003_6")
        let background4 = SKSpriteNode(imageNamed: "Layer_0004_Lights")
        let background5 = SKSpriteNode(imageNamed: "Layer_0005_5")
        let background6 = SKSpriteNode(imageNamed: "Layer_0006_4")
        let background7 = SKSpriteNode(imageNamed: "Layer_0007_Lights")
        let background8 = SKSpriteNode(imageNamed: "Layer_0008_3")
        let background9 = SKSpriteNode(imageNamed: "Layer_0009_2")
        let background10 = SKSpriteNode(imageNamed: "Layer_0010_1")
        
        background.zPosition = 10
        background1.zPosition = 9
        background2.zPosition = 8
        background3.zPosition = 7
        background4.zPosition = 6
        background5.zPosition = 5
        background6.zPosition = 4
        background7.zPosition = 3
        background8.zPosition = 3
        background9.zPosition = 2
        background10.zPosition = 1
        
        layers.append(contentsOf: [background, background1, background2, background3,
                                   background4, background5, background6, background7,
                                   background8, background9, background10])
        
        for layer in layers {
            layer.texture?.filteringMode = .nearest
            layer.position = position
            layer.physicsBody?.restitution = 0
            self.addChild(layer)
        }
    }
    
    func adjustLayerSize(size: CGSize) {
        for layer in layers {
            layer.size = size
        }
    }
}
