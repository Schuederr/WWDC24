//
//  AudioManager.swift
//  Fubá
//
//  Created by Natalia Schueda on 22/02/24.
//

import SwiftUI
import AVFoundation

class AudioManager: ObservableObject {
    var players: [AVAudioPlayer] = []

    func playAudio(for songName: String, loop: Bool = false) {
        if let path = Bundle.main.path(forResource: songName, ofType: "mp3") {
            let url = URL(fileURLWithPath: path)

            do {
                let player = try AVAudioPlayer(contentsOf: url)
                players.append(player)
                
                if loop {
                    player.numberOfLoops = -1
                }
                
                player.play()
                
            } catch {
                print("Erro ao carregar o arquivo de áudio.")
            }
        }
    }

    func stopAll() {
        for player in players {
            player.stop()
        }
        players.removeAll()
    }
}

