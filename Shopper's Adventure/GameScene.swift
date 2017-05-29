//
//  GameScene.swift
//  Shopper's Adventure
//
//  Created by Rachaus on 28/05/17.
//  Copyright © 2017 Rachaus. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    var backgroundLayer: FirstStageBackgroundLayer?
    
    
    // MARK: - Init functions
    override init(size: CGSize) {
        super.init(size: size)
        
        initializeVariables()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initializeVariables() {
        backgroundLayer = FirstStageBackgroundLayer(size: size)
        
        addChild(backgroundLayer!)
    }
    
}
