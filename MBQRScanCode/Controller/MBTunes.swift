//
//  ViewController.swift
//  MBQRScanCode
//
//  Created by Massimiliano on 09/11/2019.
//  Copyright © 2019 Massimiliano Bonafede. All rights reserved.
//

import UIKit
//import AVFoundation

class MBTunes: UIViewController {
    
    //MARK: - Outlets
    
    @IBOutlet var songImage: UIImageView!
    @IBOutlet var pauseBtn: UIButton!
    @IBOutlet var playBtn: UIButton!
    @IBOutlet var stopBtn: UIButton!
    
    //MARK: - Properties
    
    private var viewModel: PlayerViewModel!
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = PlayerViewModel()
        
        viewModel.onPlayerState = { [weak self] state in
            guard let self = self else { return }
            
            let playImage: String
            let pauseImage: String
            let stopImage: String
            
            switch state {
            case .none(let play, let pause, let stop):
                playImage = play
                pauseImage = pause
                stopImage = stop
                
            case .play(let play, let pause, let stop):
                playImage = play
                pauseImage = pause
                stopImage = stop
              
            case .pause(let play, let pause, let stop):
                playImage = play
                pauseImage = pause
                stopImage = stop
               
            case .stop(let play, let pause, let stop):
                playImage = play
                pauseImage = pause
                stopImage = stop
               
            }
            self.setupButtonImageAtState(play: playImage, pause: pauseImage, stop: stopImage)
        }
        
        songImage.image = UIImage(named: viewModel.songImage)
    }
    
    //MARK: - Methods

    private func setupButtonImageAtState(play: String, pause: String, stop: String) {
        playBtn.setImage(UIImage(systemName: play), for: .normal)
        
        pauseBtn.setImage(UIImage(systemName: pause), for: .normal)
        
        stopBtn.setImage(UIImage(systemName: stop), for: .normal)
    }
    
    //MARK: - Actions
    
    @IBAction func playBtnWasPressed(_ sender: Any) {
        viewModel.play()
    }
    
    @IBAction func pauseBtnWasPressed(_ sender: Any) {
        viewModel.pause()
    }
    
    @IBAction func stopBtnWasPressed(_ sender: Any) {
        viewModel.stop()
    }
}




