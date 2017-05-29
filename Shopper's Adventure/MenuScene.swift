//
//  MainMenuScene.swift
//  Shopper's Adventure
//
//  Created by Rachaus on 28/05/17.
//  Copyright © 2017 Rachaus. All rights reserved.
//

import SpriteKit

class MenuScene: SKScene {
    // Menu sprites
    var backgroundLayer: MenuBackgroundLayer?
    var shopButton =  SKSpriteNode()
    
    // MARK: - Init functions
    
    override init(size: CGSize) {
        super.init(size: size)
        
        AudioManager.audioManager.playMenuMusic()
        initializaVariables()
        loadMenuSprites()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Initialize MenuScene variables
    func initializaVariables() {
        backgroundLayer = MenuBackgroundLayer(size: size)
        shopButton = SKSpriteNode(imageNamed: "shop")
        shopButton.position = CGPoint(x: (size.width / 2), y: (size.height / 2))
        shopButton.setScale(3)
        shopButton.zPosition = 4
        shopButton.name = "shop"
    }
    
    // Load the menu sprites to the scene
    func loadMenuSprites() {
        addChild(backgroundLayer!)
        addChild(shopButton)
    }
    
}


// MARK: - Touches and scene transition
extension MenuScene {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let location = touches.first?.location(in: self)
        let node = nodes(at: location!).first
        
        if node?.name == "shop" {
            loadGameScene()
        }
    }
    
    // Load the game scene and stop music
    func loadGameScene() {
        AudioManager.audioManager.stopMusic()
        let gameScene = GameScene(size: size)
        gameScene.scaleMode = .aspectFill
        view?.presentScene(gameScene, transition: SKTransition.fade(withDuration: 0.5))
    }
}
