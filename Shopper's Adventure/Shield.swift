//
//  Shield.swift
//  Shopper's Adventure
//
//  Created by Rachaus on 30/05/17.
//  Copyright © 2017 Rachaus. All rights reserved.
//

import SpriteKit

protocol Shield {
    var blockChance: Int { get set }
    
    init()
    init(blockChance: Int)
}
