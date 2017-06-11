//
//  GameViewController.swift
//  Shopper's Adventure
//
//  Created by Rachaus on 28/05/17.
//  Copyright © 2017 Rachaus. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {
    
    var menuScene: MenuScene!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let view = self.view as! SKView
        
//        view.showsPhysics = true
        menuScene = MenuScene(size: view.bounds.size)
        menuScene.scaleMode = .aspectFill
        view.presentScene(menuScene)
        
    }
    
}
