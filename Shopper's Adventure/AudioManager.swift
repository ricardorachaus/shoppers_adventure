//
//  AudioManager.swift
//  Shopper's Adventure
//
//  Created by Rachaus on 29/05/17.
//  Copyright © 2017 Rachaus. All rights reserved.
//

import AVFoundation

class AudioManager: AudioProtocol {
    static let audioManager = AudioManager()
    fileprivate init() {}
    
    // Menu music
    internal var music: AVAudioPlayer?
    
    func playMenuMusic() {
        music = startMusic(audioType: .menu)
        music?.volume = 0.5
        music?.play()
    }
    
    func stopMusic() {
        music?.stop()
    }
    
    func startMusic(audioType: AudioType) -> AVAudioPlayer? {
        let music: AVAudioPlayer? = {
            guard let url = Bundle.main.url(forResource: audioType.musicName, withExtension: "mp3") else {
                return nil
            }
            do {
                let player = try AVAudioPlayer(contentsOf: url)
                player.numberOfLoops -= 1
                return player
            }
            catch {
                return nil
            }
        }()
        
        return music
    }
}
