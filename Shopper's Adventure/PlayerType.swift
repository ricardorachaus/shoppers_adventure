//
//  PlayerType.swift
//  Shopper's Adventure
//
//  Created by Rachaus on 30/05/17.
//  Copyright © 2017 Rachaus. All rights reserved.
//

import Foundation

enum PlayerType: Int {
    case warrior = 0, archer, mage, monk
    
    // Retrieves the sprite name of the type
    var spriteName: String {
        let spriteNames = ["2", "1", "10", "6"]
        
        return spriteNames[rawValue]
    }
    
    // Generate a random PlayerType
    static func random() -> PlayerType {
        return PlayerType(rawValue: Int(arc4random_uniform(4)))!
    }
}
