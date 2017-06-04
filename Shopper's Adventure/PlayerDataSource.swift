//
//  PlayerProtocol.swift
//  Shopper's Adventure
//
//  Created by Rachaus on 30/05/17.
//  Copyright © 2017 Rachaus. All rights reserved.
//

import SpriteKit

protocol PlayerDataSource {
    var health: Int { get set }
    var weapon: Weapon { get set }
    var shield: Shield? { get set }
    var playerType: PlayerType { get set }
    var level: Int { get set }
    var exp: Int { get set }
}
