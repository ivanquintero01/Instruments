//
//  SoundHelper.swift
//  Instruments
//
//  Created by Ivan Dario Quintero Vallesteros on 25/05/22.
//

import Foundation
import AVFoundation

class SoundHelper {
    
    //Variables
    private var player: AVAudioPlayer?
    
    //MARK: - función para el sonido

    func playSound(soundName: String) {
    
    guard let sonidoGuitarra = Bundle.main.url(forResource: soundName , withExtension: "mp3")

    else {
        return
    }
    
    do {
        try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
        try AVAudioSession.sharedInstance().setActive(true)
        
        player = try AVAudioPlayer(contentsOf: sonidoGuitarra, fileTypeHint: AVFileType.mp3.rawValue)
        
        guard let playerSound = player else {
            return
        }
        if playerSound.isPlaying {
            playerSound.stop()
        }
        
        playerSound.play()
      
        
    } catch let error {
        print("HA ocurrido un error \(error.localizedDescription)")
    }

}
}

