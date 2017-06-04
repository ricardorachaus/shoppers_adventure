//
//  WeaponDelegate.swift
//  Shopper's Adventure
//
//  Created by Rachaus on 03/06/17.
//  Copyright © 2017 Rachaus. All rights reserved.
//

import Foundation

protocol WeaponDelegate {
    init(damage: Int, weaponType: WeaponType)
    func attack() -> Bool
    func die()
}
