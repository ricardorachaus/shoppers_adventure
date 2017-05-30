//
//  AudioManager.swift
//  Shopper's Adventure
//
//  Created by Rachaus on 29/05/17.
//  Copyright © 2017 Rachaus. All rights reserved.
//

import AVFoundation

class AudioManager: AudioDelegate {
    static let audioManager = AudioManager()
    fileprivate init() {}
    
    // Music played along the game
    internal var music: AVAudioPlayer?
    
    // Start playing menu music
    func playMenuMusic() {
        music = startMusic(audioType: .menu)
        music?.volume = 0.5
        music?.play()
    }
    
    // Stop music
    func stopMusic() {
        music?.stop()
    }
    
    // Initilize music based on it's type
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
