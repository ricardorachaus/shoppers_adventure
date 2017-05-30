//
//  AudioDelegate.swift
//  Shopper's Adventure
//
//  Created by Rachaus on 29/05/17.
//  Copyright © 2017 Rachaus. All rights reserved.
//

import AVFoundation

protocol AudioDelegate {
    var music: AVAudioPlayer? { get set }
    
    func playMenuMusic()
    func stopMusic()
    func startMusic(audioType: AudioType) -> AVAudioPlayer?
}
