//
//  PlayerViewModel.swift
//  MBMusicPlayer
//
//  Created by Bonafede Massimiliano on 22/07/21.
//  Copyright © 2021 Massimiliano Bonafede. All rights reserved.
//

import Foundation
import AVFoundation

class PlayerViewModel {
    
    //MARK: - Properties

    var onPlayerState: ((PlayerState) -> Void)?
    private var audioPlayer = AVAudioPlayer()
    var songImage = "dua_lipa"
    
    //MARK: - Lifecycle

    init() {
        prepareSong()
    }
    
    //MARK: - Methods

    private func prepareSong () {
        
        do {
            audioPlayer = try AVAudioPlayer(
                contentsOf: URL.init(
                    fileURLWithPath: Bundle.main.path(
                        forResource: "Don't Start Now",
                        ofType: "mp3")!
                )
            )
            
            audioPlayer.prepareToPlay()
            
            let audioSession = AVAudioSession.sharedInstance()
            
            do {
                try audioSession.setCategory(AVAudioSession.Category.playback)
            } catch let sessionError {
                print(sessionError)
            }
            
            DispatchQueue.main.async {
                self.onPlayerState?(.none(playImage: PLAY, pauseImage: PAUSE, stopImage: STOP))
            }
            
        } catch let songPlayError {
            print(songPlayError)
        }
        
        
    }
    
    func play() {
        audioPlayer.play()
        onPlayerState?(.play(playImage: PLAY_MARK, pauseImage: PAUSE, stopImage: STOP))
    }
    
    func pause() {
        audioPlayer.pause()
        onPlayerState?(.pause(playImage: PLAY, pauseImage: PAUSE_MARK, stopImage: STOP))
    }
    
    func stop() {
        audioPlayer.stop()
        audioPlayer.currentTime = 0
        onPlayerState?(.stop(playImage: PLAY, pauseImage: PAUSE, stopImage: STOP_MARK))
    }
}

enum PlayerState {
    case none(playImage: String, pauseImage: String, stopImage: String)
    case play(playImage: String, pauseImage: String, stopImage: String)
    case pause(playImage: String, pauseImage: String, stopImage: String)
    case stop(playImage: String, pauseImage: String, stopImage: String)
}
